# Load Paths
PATH="${PATH}:/node_modules/.bin:/var/cache/dotnet/tools:/usr/share/dotnet"
# Set directory
DEFAULT_WORKSPACE="$PWD/$SCAN_DIR"
export DEFAULT_WORKSPACE
# Create artifact directory
mkdir -p "/tmp/artifacts/test_results" "/tmp/artifacts/reports" "/tmp/test_results"
# Run Linter
set +e
bash /action/lib/linter.sh
set -e
# Copy reports for artifacts
echo "State of /tmp/artifacts/reports before copy: "
ls /tmp/artifacts/reports
cp "$PWD/$SCAN_DIR/super-linter.report" /tmp/artifacts/reports
echo "State of /tmp/artifacts/reports after copy: "
ls /tmp/artifacts/reports
# Convert reports to JUNIT
echo Converting Test Results to JUNIT
echo "Test Report Files:"
ls /tmp/artifacts/reports
echo Installing tap-junit
npm install -g tap-junit
FILES=(/tmp/artifacts/reports/*)
echo "Found Files: ${FILES[*]}"
for f in "${FILES[@]}"
do
    FILE=$(basename "$f")
    NAME=$(basename "$f" .tap)
    echo "Converting file: $NAME from $f"
    tap-junit -o /tmp/test_results -n "$NAME" -i "$FILE"
done
# Copy tests for artifacts
cp /tmp/test_results /tmp/artifacts/test_results