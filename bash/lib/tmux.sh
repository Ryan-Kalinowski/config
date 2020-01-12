function attach(){
	if [ ${#@} != 0 ]
	then
		tmux attach-session -t $@
	else
		tmux attach-session -t default
	fi
}
