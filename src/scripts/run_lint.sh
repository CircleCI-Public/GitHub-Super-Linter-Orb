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
cp -a "$PWD/$SCAN_DIR/super-linter.report/." /tmp/artifacts/reports
# Convert reports to JUNIT
echo Converting Test Results to JUNIT
npm install -g tap-junit
export FILES=(/tmp/artifacts/reports/*)
echo "Conversion list: "
echo "${FILES[*]}"
echo "${#FILES[@]} files found"
for f in "${FILES[@]}"
do
    set +e
    NAME=$(basename "$f" .tap)
    echo "Converting file: $NAME from $f"
    tap-junit -o /tmp/artifacts/test_results -n "$NAME" -s "$NAME" -c "$NAME" < "$f"
done
