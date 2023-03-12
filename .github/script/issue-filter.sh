# comment
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $4"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$1/$2/issues/$3/comments \
  -d '{"body":"Sorry, I don'\''t accept other people'\''s issues now. So the issue was automatically closed and locked. Thanks and good luck."}'

# close
curl -L \
  -X PATCH \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $4"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$1/$2/issues/$3 \
  -d '{"state":"close","state_reason":"not_planned"}'
# lock
curl -L \
  -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $4"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$1/$2/issues/$3/lock \
  -d '{"lock_reason":"off-topic"}'