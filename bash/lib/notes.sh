export notes="$HOME/misc/notes"
alias notes="e $notes"
if [ -f "$notes" ]; then
	mkdir "$notes"
fi
