# JAR_FILE_NAME=$1
# JAR_FILEPATh="/Data/$1"
# CLASS_NAME=$2
# PARAMS="/input /output"

# preapre
echo "Create folders input app"
hdfs dfs -mkdir -p /input/
hdfs dfs -mkdir -p /app/
# Prepare Jar file
echo "Prepare Jar file"
mkdir /tutorial_classes
javac -classpath $(hadoop classpath) -d /tutorial_classes Data/Program.java
jar -cvf Data/Program.jar -C /tutorial_classes .
# Upload Jar file, in.csv
echo "Upload Jar and in.csv"
hdfs dfs -copyFromLocal -f /Data/in.csv /input/
# hdfs dfs -copyFromLocal -f /Data/Program.jar /app/Program.jar
hdfs dfs -ls / /input/ /app/

# run 
# $HADOOP_HOME/bin/hadoop jar $JAR_FILEPATh $CLASS_NAME $PARAMS
$HADOOP_HOME/bin/hadoop jar /Data/Program.jar Program /input /output

# result
echo "Show result"
hdfs dfs -ls / /input /output
hdfs dfs -cat /output/*

# clean
echo "Cleaning..."
hdfs dfs -rm -r /input /output /app
rm -rf /tutorial_classes