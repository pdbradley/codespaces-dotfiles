function g {
   if [[ $# > 0 ]]; then
     git $@
   else
     git status
   fi
}

# to alter priority of tasks in task warrior
function taskh {
  t modify $1 priority:H
}
function taskm {
  t modify $1 priority:M
}
function taskl {
  t modify $1 priority:L
}
function taskp {
  t modify $1 priority:$2
}

function ezf {
  find . -name $1 -print
}
