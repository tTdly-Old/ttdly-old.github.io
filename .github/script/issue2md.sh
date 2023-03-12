
curl -L \
  -X PATCH \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $4"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$1/$2/issues/$3 \
  -d '{"body":"Not accepting other people'\''s issues. So the issue was automatically closed and locked. Thanks and good luck.","state":"close","state_reason":"not_planned"}'
echo "Lock it !!!!!!"
curl -L \
  -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $4"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$1/$2/issues/$3/lock \
  -d '{"lock_reason":"off-topic"}'