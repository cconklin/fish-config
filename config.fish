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
  if [ (__fish_git_prompt) ]
    printf 'MacBook Pro:%s%s %s $ ' $__prompt_pwd (__fish_git_prompt | tr -d '[[:space:]]') $LOGNAME  
  else
    printf 'MacBook Pro:%s %s $ ' $__prompt_pwd $LOGNAME
  end
end
function diff
  command diff -u $argv | colordiff | less
end
function less
  command less -F -R $argv
end
rvm default
