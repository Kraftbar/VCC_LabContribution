ONE="000012"
TIME="2013-02-19 15:31:06"
echo -e "$ONE\n$TIME">translog.txt;

eval $(cat translog.txt)

echo $ONE
echo $TIME