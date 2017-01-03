
KINESIS_PATH=~/bin/
RET=0

for project in `find . -name project.json -exec dirname {} \;`
do
CONTEXT=$project/context/dev1.json

    echo "Testing $project"
    java -jar $KINESIS_PATH/kinesis-2.0.0-SNAPSHOT-standalone.jar -p $project -c $CONTEXT -r
    if [ $? != 0 ]
    then
        RET=1
    fi
done

exit $RET
