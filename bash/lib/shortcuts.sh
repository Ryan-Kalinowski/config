function shortcut(){
	if [ ${#@} != 1 ]
	then
		echo "Usage: shortcut [Name]"
	else
		currentpath=`pwd`
		varname=$1
		path=`{ env & alias; } | grep "^$varname="`
		if [ -n "$path" ]
		then
			echo "$varname is not set"
		else
			echo "export $1=$currentpath" >> $BASHSHORTCUTS
			echo "alias $1='cd \$$1'" >> $BASHSHORTCUTS
			echo "" >> $BASHSHORTCUTS
			source $BASHSHORTCUTS
			echo "Current directory saved as $1"
		fi
	fi
}

export BASHSHORTCUTS="$HOME/.config/bash/shortcuts"
if [ -f "$BASHSHORTCUTS" ]; then
	touch "$BASHSHORTCUTS"
fi

source "$BASHSHORTCUTS"

