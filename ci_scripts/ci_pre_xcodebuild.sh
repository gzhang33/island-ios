#!/bin/sh
set -e
echo "Island iOS - Pre build starting"

# Inject Xcode Cloud environment variables into xcconfig
REPO_ROOT="${CI_PRIMARY_REPOSITORY_PATH:-$(pwd)}"
CONFIG_PATH="${REPO_ROOT}/Island/Config.xcconfig"

if [ ! -f "$CONFIG_PATH" ]; then
  echo "Config file not found at $CONFIG_PATH"
  exit 1
fi

if [ -n "$SUPABASE_URL" ]; then
  echo "SUPABASE_URL = ${SUPABASE_URL}" >> "$CONFIG_PATH"
fi

if [ -n "$SUPABASE_ANON_KEY" ]; then
  echo "SUPABASE_ANON_KEY = ${SUPABASE_ANON_KEY}" >> "$CONFIG_PATH"
fi

echo "Config injected successfully"
