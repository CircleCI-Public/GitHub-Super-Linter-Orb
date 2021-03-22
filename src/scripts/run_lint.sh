# Load Paths
PATH="${PATH}:/node_modules/.bin:/var/cache/dotnet/tools:/usr/share/dotnet"
# Set directory
DEFAULT_WORKSPACE=$(echo "$PWD/$SCAN_DIR")
export DEFAULT_WORKSPACE
# Create report directory
mkdir "$PWD/$SCAN_DIR/super-linter.report"
# Run Linter
bash /action/lib/linter.sh
# Copy reports for artifacts
cp -R "$PWD/$SCAN_DIR/super-linter.report" /tmp/super-linter.report
# Convert reports to JUNIT
echo Converting Test Results to JUNIT
cd /tmp/super-linter.report || exit 1
ls
npm install -g tap-junit
FILES=/tmp/super-linter.report/*
for f in $FILES
do
    FILENAME=$(basename "$f")
    echo "Converting file: $FILENAME from $f"
    tap-junit -o /tmp/test_results -n "$FILENAME" -i "$FILENAME"
done