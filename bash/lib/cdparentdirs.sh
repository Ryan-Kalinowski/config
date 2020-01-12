alias ..=cdparentdirs
function cdparentdirs(){
	path="../"
	for ((i=0; i < $[$1-1]; ++i))
	do
		path="$path../"
	done
	cd $path
}
