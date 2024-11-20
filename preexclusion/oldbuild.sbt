name := "store_price_premium_exclusion_dpp"
scalaVersion := "2.11.8"
val sparkVersion = "2.3.1"
val jacksonCore = "2.6.7"
val publishMavenStyle = true

val kelsav2Version = "1.5"
val scope = Compile



resolvers ++= Seq(
  "Artifactory" at "https://binrepo.target.com/artifactory/kelsa/",
  "Maven Artifactory" at "https://repo1.maven.org/maven2/",
  "jitpack" at "https://jitpack.io"

)

libraryDependencies ++= Seq(
  "com.tgt.dsc.kelsa.datapipeline" % "kelsa-core_2.11" % "1.9",
  "com.typesafe" % "config" % "1.3.3",
  "org.apache.spark" %% "spark-core" % sparkVersion % Provided,
  "org.apache.spark" %% "spark-sql" % sparkVersion % Provided,
  "org.apache.spark" %% "spark-hive" % sparkVersion % Provided,
  "org.scalatest" %% "scalatest" % "3.1.0" % Test
).map(_.force())
  .map(_.exclude("org.slf4j", "slf4j-simple"))


assemblyMergeStrategy in assembly := {
  case PathList("META-INF", xs @ _*) => MergeStrategy.discard
  case "log4j.properties"            => MergeStrategy.last
  case x                             => MergeStrategy.first
}

//initializing buildinfo to know what version of code is running
lazy val root = (project in file("."))
  .enablePlugins(BuildInfoPlugin)
  .settings(
    name := "kelsa-starter",
    organization := "com.tgt.dsc.kelsa.datapipeline",
    buildInfoKeys ++= Seq[BuildInfoKey](
      resolvers,
      libraryDependencies,
      BuildInfoKey.map(name) {
        case (k, v) => "project" + k.capitalize -> v.capitalize
      },
      BuildInfoKey.action("buildTime") {
        System.currentTimeMillis
      } // re-computed each time at compile
    ),
    buildInfoPackage := "com.tgt.dsc.price.storePricePremiumExclusion"
  )
//This is the entry point for the application
mainClass in assembly := Some(
  "com.tgt.dsc.price.storePricePremiumExclusion.DataPipelineKickStarter"
)

assemblyJarName in assembly := s"${name.value}_2.11-0.1.jar"

//get the token from secrets
val token = sys.env.getOrElse("NEW_SONAR_TOKEN", "")

//configurations for sonar integration
sonarProperties ++= Map(
  "sonar.host.url" -> "https://desonar.prod.target.com/",
  "sonar.scala.version" -> "2.11",
  "sonar.projectName" -> "store_price_premium_exclusion_dpp",
  "sonar.projectKey" -> "store_price_premium_exclusion_dpp",
  "sonar.sources" -> "src/main/scala",
  "sonar.tests" -> "src/test/scala",
  "sonar.scala.coverage.reportPaths" -> "target/scala-2.11/scoverage-report/scoverage.xml",
  "sonar.scala.scapegoat.reportPath" -> "target/scala-2.11/scapegoat-report/scapegoat.xml",
  "sonar.login" -> token,
  "sonar.buildbreaker.skip" -> "true",
  "sonar.exclusions" -> "src/**/HiveConnector*,src/**/DataPipelineKickStarter*,src/**/PipeLineService*"
)

coverageExcludedPackages := ".*HiveConnector$;.*PipeLineService$;.*DataPipelineKickStarter$;"
//how much code coverage is needed
coverageMinimum := 80
//fail the build if code coverage is not met
coverageFailOnMinimum := true