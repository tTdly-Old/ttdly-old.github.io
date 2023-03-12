# $1 title $2 body $3 date $4 number
# $1 title $2 body $3 date $4 number
HEADYML="---\ntitle: $1\ndate: $3\n---"
if [ ! -d "pages" ];then
    mkdir pages
fi
echo -e $HEADYML > pages/$4.md
echo -e $2 >> pages/$4.md