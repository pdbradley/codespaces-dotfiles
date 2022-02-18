transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
  tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 



# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


bindkey "^P" up-line-or-search
bindkey "^A" vi-beginning-of-line


. $HOME/.asdf/asdf.sh


# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/philip/.netlify/helper/path.zsh.inc' ]; then source '/Users/philip/.netlify/helper/path.zsh.inc'; fi



