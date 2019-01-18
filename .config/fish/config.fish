cat /tmp/notifications/*.md |  pandoc --to gfm --from markdown | pygmentize -l md

thefuck --alias | source

# Single-letters abbrs
abbr b bat
abbr v code
abbr f fuck
abbr i import
abbr g git
abbr gf git fzf
alias config 'git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# General tool abbrs
abbr lower tr '[:upper:]' '[:lower:]'
abbr upper tr '[:lower:]' '[:upper:]'
abbr aesthetics tr '[:lower:]' 'ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ'
abbr map xargs -n 1 -P 1
abbr fileswithout xargs grep --files-without-match
abbr fileswith xargs grep --files-with-match

abbr build nix-build -j 4 . -A

abbr vscode code

# Git abbrs
abbr add git add
abbr branch git branch
abbr checkout git checkout
abbr cherry git cherry
abbr clone git clone
abbr commit git commit
abbr log git log
abbr merge git merge
abbr pull git pull
abbr push git push
abbr fetch git fetch
abbr stash git stash

function fish_greeting
end

set PATH $PATH ~/go/bin
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"

function fish_user_key_bindings
  bind \ch "commandline (history --null | fzf -q (commandline) --read0 --preview '' --multi --tiebreak=index; commandline -f repaint)"
  bind \ce "nohup thunar > /dev/null ^ /dev/null &"
end

set TFALIASFILE /tmp/tfalias.fish

if [ ! -f TFALIASFILE ]
  thefuck --alias > $TFALIASFILE
end

source $TFALIASFILE
