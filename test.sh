
KINESIS_PATH=~/bin/
CANVAS_TIMEOUT=30

RET=0

for project in `find . -name project.json -exec dirname {} \;`
do
CONTEXT=$project/context/dev1.json

    echo "Running tests from $project project"
    java -jar $KINESIS_PATH/kinesis-2.0.0-SNAPSHOT-standalone.jar -p $project -c $CONTEXT -t $CANVAS_TIMEOUT -r -v
    if [ $? != 0 ]
    then
        RET=1
        exit $RET
    fi
done

exit $RET
