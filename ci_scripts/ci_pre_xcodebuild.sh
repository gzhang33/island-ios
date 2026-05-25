#!/bin/sh
set -e
echo "Island iOS - Pre build starting"

# Inject Xcode Cloud environment variables into xcconfig
CONFIG_PATH="${CI_PRIMARY_REPOSITORY_PATH}/ios-swift/Island/Config.xcconfig"

if [ -n "$SUPABASE_URL" ]; then
  echo "SUPABASE_URL = ${SUPABASE_URL}" >> "$CONFIG_PATH"
fi

if [ -n "$SUPABASE_ANON_KEY" ]; then
  echo "SUPABASE_ANON_KEY = ${SUPABASE_ANON_KEY}" >> "$CONFIG_PATH"
fi

echo "Config injected successfully"
