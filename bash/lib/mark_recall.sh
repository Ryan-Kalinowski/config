alias recall='cd $MARKED_DIRECTORY'
alias r=recall
alias m=mark
function mark(){
	export MARKED_DIRECTORY=`pwd`
}

