#!/bin/bash
KINESIS=~/bin/kinesis-cli/kinesis
CANVAS_TIMEOUT=45
CONTEXT=dev1.json

PROJECT_DIR="$PWD/$1"
CONTEXT_PATH="$PROJECT_DIR"/context/$CONTEXT

RET=0
echo "Kinesis CLI executable: $KINESIS"

echo "Running tests in $PROJECT_DIR project using $CONTEXT context"
"$KINESIS" -p "$PROJECT_DIR" -c "$CONTEXT_PATH" -t "$CANVAS_TIMEOUT" -r
if [ $? != 0 ]
then
    RET=1
    exit $RET
fi
