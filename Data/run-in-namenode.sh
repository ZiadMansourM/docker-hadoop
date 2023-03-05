JAR_FILE_NAME=$1
JAR_FILEPATh="/Data/$1"
CLASS_NAME=$2
PARAMS="/input /output"

# preapre
hdfs dfs -mkdir -p /input/
hdfs dfs -copyFromLocal -f /Data/input.txt /input/
hdfs dfs -ls / /input/

# run
$HADOOP_HOME/bin/hadoop jar $JAR_FILEPATh $CLASS_NAME $PARAMS

# result
hdfs dfs -ls / /input /output
hdfs dfs -cat /output/*

# clean
hdfs dfs -rm -r /input /output