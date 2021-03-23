# Load Paths
PATH="${PATH}:/node_modules/.bin:/var/cache/dotnet/tools:/usr/share/dotnet"
# Set directory
DEFAULT_WORKSPACE=$(echo "$PWD/$SCAN_DIR")
export DEFAULT_WORKSPACE
# Create artifact directory
mkdir -p "/tmp/artifacts/test_results" "/tmp/test_results"
# Run Linter
set +e
bash /action/lib/linter.sh
set -e
# Copy reports for artifacts
cp -R "$PWD/$SCAN_DIR/super-linter.report" /tmp/artifacts/reports
# Convert reports to JUNIT
echo Converting Test Results to JUNIT
cd /tmp/artifacts/test_results || exit 1
echo "Test Result Files:"
ls
echo Installing tap-junit
npm install -g tap-junit
FILES=(/tmp/artifacts/test_results/*)
for f in "${FILES[@]}"
do
    FILE=$(basename "$f")
    NAME=$(basename "$f" .tap)
    echo "Converting file: $NAME from $f"
    tap-junit -o /tmp/test_results -n "$NAME" -i "$FILE"
done
# Copy tests for artifacts
cp -R /tmp/test_results /tmp/artifacts/test_results