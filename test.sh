#!/bin/bash
CANVAS_TIMEOUT=45
CONTEXT=dev1.json

RET=0

echo "Kinesis CLI executable: $KINESIS"

function test_project {
PROJECT_DIR=$1
CONTEXT_PATH="$PROJECT_DIR"/context/$CONTEXT

    echo "Running tests in $PROJECT_DIR project"
    "$KINESIS" -p "$PROJECT_DIR" -c "$CONTEXT_PATH" -t "$CANVAS_TIMEOUT" -r
    if [ $? != 0 ]
    then
        RET=1
        exit $RET
    fi
}
PWD=$(pwd)



# List of projects to run
test_project "$PWD/Olympics"
test_project "$PWD/fashion_orders"
test_project "$PWD/Sample_Project"
