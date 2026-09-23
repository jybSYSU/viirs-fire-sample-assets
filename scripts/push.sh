#!/bin/bash
# 一键推送脚本：在 github/ 目录内运行。需先完成 gh auth login 授权。
set -e
cd "$(dirname "$0")/.."
REPO="${1:-viirs-fire-sample-assets}"
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git init -b main
  git add -A
  git commit -m "VIIRS fire sample assets: index + sampled audit figures"
fi
gh repo create "$REPO" --public --source=. --remote=origin --push
gh repo edit "$REPO" --enable-pages 2>/dev/null || \
  gh api repos/{owner}/"$REPO"/pages -X POST -f "build_type=workflow" -f "source[branch]=main" -f "source[path]=/" || true
echo "完成: https://github.com/$(gh api user -q .login)/$REPO"
echo "Pages 开启后访问: https://$(gh api user -q .login).github.io/$REPO/"
