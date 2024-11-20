######################################################################################################################################
#Created by : Pricing Insights.
##script: service_now_Incident_management.sh
# Description: This Script is used to create service now Incidents for pipeline failures and also restore Incidents on successful completion
######################################################################################################################################


NUID=$1
ENV=$2
SUBJECT_NAME=$3
JOB_STATUS=$4
EXCEPTION_PATH=$5
EXCEPTION_FILE="${EXCEPTION_PATH}"/"exception_file"

echo "Running Environment: $ENV"
echo "Pipeline name: $SUBJECT_NAME"



NUID_UPPER=`echo ${NUID} | tr '[:lower:]' '[:upper:]'`
NUID_LOWER=`echo ${NUID} | tr '[:upper:]' '[:lower:]'`

#Set parameters based on environment
if [ ${ENV} == "prd" ]
then
  OAUTH_URL=https://oauth.iam.target.com/auth/oauth/v2/token
  INCIDENT_URL=https://api-internal.target.com/incidents/v1
else
    OAUTH_URL=https://oauth.iam.perf.target.com/auth/oauth/v2/token
    INCIDENT_URL=https://stgapi-internal.target.com/incidents/v1
fi

CLOSE_JSON_PATH=/user/"${NUID_UPPER}"/tmp/close.json

EDGE_NODE_ALL_INCIDENTS_PATH=/home_dir/"${NUID_LOWER}"/tmp


ENV_UPPER=$(echo "${ENV}" | tr '[:lower:]' '[:upper:]')

SECRETS_PATH=/home_dir/"${NUID_LOWER}"/"${ENV}"/common/creds

set +x

get_password() {
  EXEC_UID_PASSWORD=$(cat < "${SECRETS_PATH}"/"${NUID_UPPER}".Password)
}

API_KEY=$(cat < "${SECRETS_PATH}"/API_KEY_"${NUID_UPPER}".Password)

get_password

generate_bearer_token() {
  BEARER_TOKEN=$(curl -s \
  --location \
  --request POST "${OAUTH_URL}" \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --header 'Authorization: Basic cHJpY2VfaW5zaWdodHNfcm9wYzphZHc1d2NNRUR2M05VMjNCMVFVUk5lY3dCSk8wb2xJRnZKWnFDTUVZWHlHbWhGa0d3Z21lOVNld2M0TDhFYjFX' \
  --data-urlencode 'grant_type=password' \
  --data-urlencode 'username='"${NUID_UPPER}" \
  --data-urlencode 'password='"${EXEC_UID_PASSWORD}" \
  --data-urlencode 'scope=profile email openid' \
  | jq '.access_token')
}

check_incident_file() {
  if [ -f "${EDGE_NODE_ALL_INCIDENTS_PATH}"/"${SUBJECT_NAME}"_incident.txt ]; then
    echo "File exits."
    FILE_STATUS=0
  else
    echo "File does not exist."
    FILE_STATUS=1
  fi
  return $FILE_STATUS
}

create_incident() {
  echo "Creating new incident..."
  SHORT_DESCRIPTION="${SUBJECT_NAME} failure."


  ERROR_MESSAGE="NA"
    if hdfs dfs -test -e $EXCEPTION_FILE; then
      echo "inside if condition"
      ERROR_MESSAGE=$(hdfs dfs -cat "${EXCEPTION_FILE}")
      ERROR_MESSAGE=`echo -e "$ERROR_MESSAGE" | tr -d '\n'`
    fi
    echo $ERROR_MESSAGE

WORK_NOTES="Name: ${SUBJECT_NAME} failure \n Error : ${ERROR_MESSAGE} "
  POST_BODY='{"assignment_group": "EDABI-Pricing-Comp-Insights", "short_description": "'"${SHORT_DESCRIPTION}"'", "priority": "4 - Low", "work_notes": "'"${WORK_NOTES}"'"}'
  CREATION_URL="${INCIDENT_URL}?key=${API_KEY}"
  CREATE_INCIDENT_RESPONSE=$(curl -X POST \
  "${CREATION_URL}" \
  -H "authorization: Bearer ${BEARER_TOKEN//\"}" \
  -H 'content-type: application/json' \
  -d "${POST_BODY}")
  if echo "${CREATE_INCIDENT_RESPONSE}" | grep 'message'; then
    echo "Error while creating incident."
    echo "${CREATE_INCIDENT_RESPONSE}"
    exit 1
  else
    echo "Incident created successfully."
    INCIDENT_NUMBER=$(echo "${CREATE_INCIDENT_RESPONSE}" | jq '.incident_number')
    echo "${CREATE_INCIDENT_RESPONSE}"
    echo "Writing incident number to edge node file."
    echo "${INCIDENT_NUMBER//\"}" >> "${EDGE_NODE_ALL_INCIDENTS_PATH}"/"${SUBJECT_NAME}"_incident.txt
    echo "Incident number written to edge node file."
  fi
}

close_incident() {
  PUT_BODY=$(hdfs dfs -cat "${CLOSE_JSON_PATH}")
  EXISTING_INCIDENT_NUMBER=$(cat "${EDGE_NODE_ALL_INCIDENTS_PATH}"/"${SUBJECT_NAME}"_incident.txt)
  CLOSE_URL="${INCIDENT_URL}/${EXISTING_INCIDENT_NUMBER}?key=${API_KEY}"
  CLOSE_INCIDENT_RESPONSE=$(curl -X PUT \
  "${CLOSE_URL}" \
  -H "authorization: Bearer ${BEARER_TOKEN//\"}" \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d "${PUT_BODY}")
  if echo "${CLOSE_INCIDENT_RESPONSE}" | grep 'message'; then
    echo "Error while creating incident."
    echo "${CLOSE_INCIDENT_RESPONSE}"
    exit 1
  else
    hdfs dfs -test -e ${EXCEPTION_FILE} && hdfs dfs -rm ${EXCEPTION_FILE}
    echo "Incident closed successfully."
    echo "Deleting the incident file..."
    rm "${EDGE_NODE_ALL_INCIDENTS_PATH}"/"${SUBJECT_NAME}"_incident.txt
    echo "Deleted the incident file."
  fi
}

set -vx

if [ $JOB_STATUS -ne 0 ]
  then
  check_incident_file
  if [ "$FILE_STATUS" -eq 0 ]; then
    echo "Incident already exists. Using the same."
    cat "${EDGE_NODE_ALL_INCIDENTS_PATH}"/"${SUBJECT_NAME}"_incident.txt
  else
 set +x
    generate_bearer_token
    create_incident "$@"
  fi
  else
 set -vx
  check_incident_file
  if [ "$FILE_STATUS" -eq 0 ]; then
    echo "Incident created due to previous failure. Closing it..."
   set +x
    generate_bearer_token
    close_incident "$@"
  else
    set -vx
    echo "No incident created. Workflow ran successfully."
  fi
fi