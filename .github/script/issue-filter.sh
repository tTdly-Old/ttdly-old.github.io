ONWER=$1
REPO=$2
ISSUE_NUMBER=$3
TOKEN=$4
# comment
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $TOKEN"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$OWNER/$REPO/issues/$ISSUE_NUMBER/comments \
  -d '{"body":"Sorry, I don't accept other people'\''s issues now. So the issue was automatically closed and locked. Thanks and good luck."}'
# close
curl -L \
  -X PATCH \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $4"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$OWNER/$REPO/issues/$ISSUE_NUMBER \
  -d '{"state":"close","state_reason":"not_planned"}'
# lock
curl -L \
  -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $4"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$ONWER/$REPO/issues/$ISSUE_NUMBER/lock \
  -d '{"lock_reason":"off-topic"}'