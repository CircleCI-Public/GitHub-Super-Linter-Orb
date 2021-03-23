# Load Paths
PATH="${PATH}:/node_modules/.bin:/var/cache/dotnet/tools:/usr/share/dotnet"
# Set directory
DEFAULT_WORKSPACE="$PWD/$SCAN_DIR"
export DEFAULT_WORKSPACE
# Create artifact directory
mkdir -p "$PWD/$SCAN_DIR/super-linter.report/" "/tmp/artifacts/reports"
# Run Linter
set +e
bash /action/lib/linter.sh
LINTER_ERROR_STATUS=$?
# Copy reports for artifacts
echo "Copying reports to artifacts"
cp -a "$PWD/$SCAN_DIR/super-linter.report/." /tmp/artifacts/reports
cp -a "$PWD/$SCAN_DIR/super-linter.log/." /tmp/artifacts/logs
# Exit with proper exit code
exit "$LINTER_ERROR_STATUS"