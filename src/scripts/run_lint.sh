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
# Copy reports for artifacts
cp -a "$PWD/$SCAN_DIR/super-linter.report/." /tmp/artifacts/reports