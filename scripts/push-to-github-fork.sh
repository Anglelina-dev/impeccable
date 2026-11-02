#!/usr/bin/env bash
# Push this Origin checkout's current branch to github.com/Anglelina-dev/impeccable
# Usage (WSL):
#   export GITHUB_TOKEN=ghp_...   # or fine-grained PAT with Contents: write
#   ./scripts/push-to-github-fork.sh
set -euo pipefail
BRANCH=${1:-$(git branch --show-current)}
REMOTE_URL=${GITHUB_REMOTE:-https://github.com/Anglelina-dev/impeccable.git}
if [[ -z "${GITHUB_TOKEN:-}" ]]; then
  echo "Set GITHUB_TOKEN to a PAT that can write Anglelina-dev/impeccable" >&2
  exit 1
fi
git push "https://x-access-token:${GITHUB_TOKEN}@github.com/Anglelina-dev/impeccable.git" \
  "HEAD:refs/heads/${BRANCH}"
echo "Pushed HEAD -> Anglelina-dev/impeccable:${BRANCH}"
