export REPO_ROOT="$PWD"

DIR="./tests"
if [ "$1" != "" ]; then
	DIR="$DIR/$1"
fi
echo ">>> $DIR <<<"
FLG=0
for path in $(find "$DIR" -type f -name "test.sh");
do
	echo "=== $path ==="
	bash "$path"
	if [ $? -eq 0 ]; then
		printf "\e[1;32m%s\n\e[m" "$path OK!"
	else
		printf "\e[1;31m%s\n\e[m" "$path KO!"
		FLG=1
	fi
done
if [ $FLG -eq 0 ]; then
	printf "\e[1;32m%s\n\e[m" "ALL TEST> OK!"
else
	printf "\e[1;31m%s\n\e[m" "ALL TEST> KO!"
	FLG=1
fi
exit $FLG
