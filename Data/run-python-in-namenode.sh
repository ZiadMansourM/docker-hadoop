# check python
if command -v python3 &>/dev/null; then
    echo "Python is installed"
else
    echo "Python is not installed, installing..."
    apt-get update
    apt-get install -y python3
    apt-get install -y python3-venv
fi

echo "Install python packages..."
python3 -m venv /venv
source /venv/bin/activate
pip3 install -r /Data/requirements.txt

# preapre and upload mapper.py and input.txt
echo "Create Folders input and app"
hdfs dfs -mkdir -p /input/
hdfs dfs -mkdir -p /app/
echo "Upload mapper.py and input.txt"
hdfs dfs -copyFromLocal -f /Data/input.txt /input/
hdfs dfs -copyFromLocal /Data/mapper.py /app/
echo "change permission of mapper.py"
hdfs dfs -chmod 777 /app/mapper.py
hdfs dfs -ls / /input/ /app/


echo "Start to run hadoop streaming"
hadoop jar /opt/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
-file /Data/mapper.py \
-mapper "mapper.py --mapper" \
-reducer "mapper.py --reducer" \
-input /input/input.txt \
-output /output

# result
echo "Result Stage: "
hdfs dfs -ls / /input /output
hdfs dfs -cat /output/*

# clean
echo "Cleaning Stage: "
hdfs dfs -rm -r /input /output /app
echo "Clean python venv..."
deactivate
rm -rf /venv