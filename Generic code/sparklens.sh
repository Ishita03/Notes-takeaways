
spark-submit \
--jars /home_dir/svprihdp/bigred3/lib/jars/sparklens-0.3.1-s_2.11.jar \
--class com.qubole.sparklens.app.ReporterApp \
qubole-dummy-arg hdfs://bigred3ns2/apps/spark-tgt/logs/application_1692684672946_2150919 source=history


spark-submit \
--jars /home_dir/svprihdp/bigred3/lib/jars/sparklens-0.3.1-s_2.11.jar \
--class com.qubole.sparklens.app.ReporterApp \
qubole-dummy-arg hdfs://bigred3ns2/apps/spark-tgt/logs/application_1692684672946_2150919_1 source=history
