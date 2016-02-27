set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'

set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_untrackedfiles '?'

set fish_greeting ""
function fish_prompt
  if [ "~" = (prompt_pwd) ]
    set __prompt_pwd "~"
  else
    set __prompt_pwd (basename (pwd))
  end
  if set -q VIRTUAL_ENV
    set __virtualenv (printf '[%s]' (basename "$VIRTUAL_ENV"))
  else
    set __virtualenv ""
  end
  if [ (__fish_git_prompt) ]
    printf 'MacBook Pro:%s%s %s $ ' $__prompt_pwd (__fish_git_prompt | tr -d '[[:space:]]') $LOGNAME  
  else
    printf 'MacBook Pro:%s %s $ ' $__prompt_pwd $LOGNAME
  end
end
function fish_right_prompt
  if set -q VIRTUAL_ENV
    set __virtualenv (echo -n -s (set_color blue) (basename "$VIRTUAL_ENV") (set_color normal))
    printf '(%s)' $__virtualenv
  end
end
function diff
  command diff -u $argv | colordiff | less
end
function less
  command less -F -R $argv
end
function nosetests
  command nosetests --rednose $argv
end
eval (python -m virtualfish auto_activation)
set PATH ~/bin/ $PATH
rvm default

