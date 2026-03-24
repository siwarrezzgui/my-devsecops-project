#!/usr/bin/env bash
set -e

BC_URL="${BC_URL:-https://businesscentral.dynamics.com/}"

mkdir -p /config/chromium-profile/Default
mkdir -p /config/vscode

if ! pgrep -x chromium >/dev/null 2>&1; then
  chromium \
    --no-sandbox \
    --disable-dev-shm-usage \
    --user-data-dir=/config/chromium-profile \
    --new-window "$BC_URL" >/tmp/chromium.log 2>&1 &
fi

if ! pgrep -x code >/dev/null 2>&1; then
  code \
    --no-sandbox \
    --user-data-dir=/config/vscode \
    >/tmp/vscode.log 2>&1 &
fi
