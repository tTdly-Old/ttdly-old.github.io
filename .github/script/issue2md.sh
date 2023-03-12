RESULT=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $4"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$1/$2/issues/$3
)

TITLE=$(echo $RESULT | jq .title)
NUMBER=$(echo $RESULT | jq .number)
BODY=$(echo $RESULT | jq .body)
BODY=$(echo ${BODY:1:-1})
TIME=$(echo $RESULT | jq .created_at)
HEADYML="---\ntitle: $TITLE\ndate: $TIME\n---"
if [ ! -d "pages" ];then
    mkdir pages
fi
if [ ! -d "pages/posts" ];then
    mkdir pages/posts
fi
echo -e $HEADYML > pages/posts/$NUMBER.md
echo -e $BODY >> pages/posts/$NUMBER.md