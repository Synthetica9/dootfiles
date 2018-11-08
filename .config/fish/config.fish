cat /tmp/notifications/*.md |  pandoc --to gfm --from markdown | pygmentize -l md

thefuck --alias | source

# Single-letters abbrs
abbr a atom
abbr f fuck
abbr n new_term
abbr p pygmentize
abbr i import
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
