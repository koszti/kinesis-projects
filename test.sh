KINESIS=/var/jenkins_home/bin/kinesis-cli/kinesis
CANVAS_TIMEOUT=45
CONTEXT=dev1.json

RET=0

echo "Kinesis CLI executable: [$KINESIS]"

# Avoid issues with directories having spaces
SAVEIFS=$IFS
IFS=$(echo -en "\n")

# Find every Kinesis project and run in a loop
for project in `find "$(pwd)" -name project.json`
do
echo "Kinesis CLI executable: [$KINESIS]"

    # Make absolute paths that is required for Kinesis CLI
    PROJECT_DIR="$(dirname $project)"
    CONTEXT_PATH="$PROJECT_DIR/context/$CONTEXT"

    echo "Running tests from $PROJECT_DIR project"
    $KINESIS -p $PROJECT_DIR -c $CONTEXT_PATH -t $CANVAS_TIMEOUT -r
    if [ $? != 0 ]
    then
        RET=1
        exit $RET
    fi
done

IFS=$SAVEIFS

exit $RET
