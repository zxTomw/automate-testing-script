sf=$1
pr=$2

if [ $# -ne 2 ]; then
	echo Usage: $0 [suite-file] [program] >&2
	exit 4
fi
for stem in $(cat $1); do
	actual=$(mktemp)


	
	if [ -r $stem.in ] && [ -r $stem.args ]; then
		./$2 $(cat $stem.args) <$stem.in >$actual
		
	elif [ -r $stem.in ]; then
		./$2 <$stem.in >$actual

	elif [ -r $stem.args ]; then
		./$2 $(cat $stem.args) >$actual

	else
		./$2 >$actual
	fi
	diff $actual $stem.out >/dev/null
	if [ $? -ne 0 ]; then 
		echo Test failed: $stem
		echo Args: 
		if [ -r $stem.args ]; then
			cat $stem.args
		fi
		echo Input: 
		if [ -r $stem.in ]; then
			cat $stem.in
		fi
		echo Expected:
		cat $stem.out
		echo Actual:
		cat $actual
	fi
done

