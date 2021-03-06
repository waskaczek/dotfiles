######################################
#   File: ZSH functions.             #
#   __    __          _              #
#  / / /\ \ \__ _ ___| | ___   _     #
#  \ \/  \/ / _` / __| |/ | | | |    #
#   \  /\  | (_| \__ |   <| |_| |    #
#    \/  \/ \__,_|___|_|\_\\__, |    #
#                          |___/     #
#   https://github.com/waskaczek     #
######################################

#########################################
# extract: extract of compressed-files  #
#########################################
extract()
{
  if [ -f $1 ] ; then
    local lower=$(ls $1)

    case $lower in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar e $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.lha)       lha e $1        ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *.rar)       unrar $1        ;;
      *)           echo "'$1' cannot be extracted via >extract<"
                   return 1        ;;
    esac

  else
    echo "'$1' is not a valid file"
  fi
}

#########################################
# os-info: show some                    #
#          info about your system       #
#########################################
os-info()
{
  lsb_release -a
  uname -a

  if [ -z /etc/lsb-release ]; then
    cat /etc/lsb-release;
  fi;

  if [ -z /etc/issue ]; then
    cat /etc/issue;
  fi;

  if [ -z /proc/version ]; then
    cat /proc/version;
  fi;
}

#########################################
# find-txt: find text in path           #
#########################################
find-txt()
{
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: find-text [pattern] [path]"
  
    elif [ ! -z "$1" ]; then

    local pattern=$1
    local xpath=''
    
    if [ ! -z "$2" ]; then
      xpath=$2
    else
      xpath='.'
    fi

    grep -rnw $xpath -e $pattern;
   
  fi
}

