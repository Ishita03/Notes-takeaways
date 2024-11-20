ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.11.8"

val kelsaV2Version = "1.5"
val scope = Compile
val sparkVersion = "2.3.1"
val publishMavenStyle = true


resolvers ++= Seq(
  "Artifactory" at "https://binrepo.target.com/artifactory/kelsa/",
  "Maven Artifactory" at "https://repo1.maven.org/maven2/",
  "jitpack" at "https://jitpack.io"

)



libraryDependencies ++= Seq(
  "com.tgt.dsc.kelsa.datapipeline" % "kelsa-core_2.11" % "1.8.4",
  "com.tgt.dsc.kelsa.kelsa-context-pipeline" % "kelsa_data_quality_2.11" % kelsaV2Version % scope,
    "org.apache.oozie" % "oozie-client" % "4.3.1",
    "org.apache.kafka" % "kafka-clients" % "2.1.1",
//    "org.apache.spark" %% "spark-core" % sparkVersion ,
//    "org.apache.spark" %% "spark-sql" % sparkVersion  ,
//    "org.apache.spark" %% "spark-hive" % sparkVersion ,
//   "org.apache.spark" %% "spark-sql-kafka-0-10" % sparkVersion ,
  "org.apache.spark" %% "spark-sql-kafka-0-10" % sparkVersion % Provided,
  "org.apache.spark" %% "spark-core" % sparkVersion % Provided,
  "org.apache.spark" %% "spark-sql" % sparkVersion % Provided,
  "org.apache.spark" %% "spark-hive" % sparkVersion % Provided
).map(_.force())
  .map(_.exclude("org.slf4j", "slf4j-simple"))

dependencyOverrides += "com.google.guava" % "guava" % "15.0"

assemblyMergeStrategy in assembly := {
  case PathList("META-INF", xs @ _*) => MergeStrategy.discard
  case "log4j.properties"            => MergeStrategy.last
  case x                             => MergeStrategy.first
}

//initializing buildinfo to know what version of code is running
lazy val root = (project in file("."))
  .enablePlugins(BuildInfoPlugin)
  .settings(
    name := "dq-verifier",
    organization := "com.tgt.dse.verifier",
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
    buildInfoPackage := "com.tgt.dse.verifier"
  )
//This is the entry point for the application
mainClass in assembly := Some(
  "com.tgt.dse.verifier.DataPipelineKickStarter"
)

assemblyJarName in assembly := s"${name.value}_2.11-0.1.jar"

