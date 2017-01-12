
KINESIS=~/bin/kinesis-cli/kinesis
CANVAS_TIMEOUT=30

RET=0

for project in `find . -name project.json -exec dirname {} \;`
do
CONTEXT=$project/context/dev1.json

    echo "Running tests from $project project"
    $KINESIS -p $project -c $CONTEXT -t $CANVAS_TIMEOUT -r -v
    if [ $? != 0 ]
    then
        RET=1
        exit $RET
    fi
done

exit $RET
