# Load Paths
PATH="${PATH}:/node_modules/.bin:/var/cache/dotnet/tools:/usr/share/dotnet"
# Set directory
export DEFAULT_WORKSPACE=$(echo $PWD/$SCAN_DIR)
echo Scanning $DEFAULT_WORKSPACE
# Create report directory
mkdir $PWD/$SCAN_DIR/super-linter.report
# Run Linter
bash /action/lib/linter.sh
# Copy reports for artifacts
cp -R $PWD/$SCAN_DIR/super-linter.report /tmp/super-linter.report
# Convert reports to JUNIT
npm install -g tap-junit
FILES=/tmp/super-linter.report/*
for f in $FILES
do
    FILENAME=$(basename "$f")
    tap-junit -o /tmp/test_results -n "$FILENAME" -s "$FILENAME" -i "$f"
done