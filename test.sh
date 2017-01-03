
KINESIS_PATH=~/bin/
RET=0

for project in `find . -name kinesis.json -exec dirname {} \;`
do
    echo "Testing $project"
    java -jar $KINESIS_PATH/kinesis-2.0.0-SNAPSHOT-standalone.jar -p $project
    if [ $? != 0 ]
    then
        RET=1
    fi
done

exit $RET
