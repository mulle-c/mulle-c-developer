#! /bin/sh
#
# (c) 2015, coded by Nat!, Mulle KybernetiK
#
[ "${TRACE}" = "YES" ] && set -x

if [ "${MULLE_NO_COLOR}" != "YES" ]
then
   # Escape sequence and resets
   C_RESET="\033[0m"

   # Useable Foreground colours, for black/white white/black
   C_RED="\033[0;31m"     C_GREEN="\033[0;32m"
   C_BLUE="\033[0;34m"    C_MAGENTA="\033[0;35m"
   C_CYAN="\033[0;36m"

   C_BR_RED="\033[0;91m"
   C_BOLD="\033[1m"

   #
   # restore colors if stuff gets wonky
   #
   trap 'printf "${C_RESET} >&2 ; exit 1"' TERM INT
fi


fail()
{
   printf "${C_BR_RED}Error: $*${C_RESET}\n" >&2
   exit 1
}

#
# https://github.com/hoelzro/useful-scripts/blob/master/decolorize.pl
#

#
# stolen from:
# http://stackoverflow.com/questions/1055671/how-can-i-get-the-behavior-of-gnus-readlink-f-on-a-mac
# ----
#
_prepend_path_if_relative()
{
   case "$2" in
      /*)
         echo "$2"
      ;;

      *)
         case "$1" in
            */)
               echo "$1$2"
            ;;

            *)
               echo "$1/$2"
            ;;
         esac
      ;;
   esac
}


resolve_symlinks()
{
   local dir_context
   local path

   path="`readlink "$1"`"
   if [ $? -eq 0 ]
   then
      dir_context=`dirname -- "$1"`
      resolve_symlinks "`_prepend_path_if_relative "$dir_context" "$path"`"
   else
      echo "$1"
   fi
}


canonicalize_path()
{
   if [ -d "$1" ]
   then
   (
      cd "$1" 2>/dev/null && pwd -P
   )
   else
      local dir
      local file

      dir="`dirname -- "$1"`"
      file="`basename -- "$1"`"
      (
         cd "${dir}" 2>/dev/null &&
         echo "`pwd -P`/${file}"
      )
   fi
}


realpath()
{
   canonicalize_path "`resolve_symlinks "$1"`"
}


get_windows_path()
{
   local directory

   directory="$1"
   if [ -z "${directory}" ]
   then
      return 1
   fi

   ( cd "$directory" ; pwd -PW ) || fail "failed to get pwd"
   return 0
}


get_sh_windows_path()
{
   local directory

   directory="`which sh`"
   directory="`dirname -- "${directory}"`"
   directory="`get_windows_path "${directory}"`"

   if [ -z "${directory}" ]
   then
      fail "could not find sh.exe"
   fi
   echo "${directory}/sh.exe"
}


sed_mangle_escape_slashes()
{
   sed -e 's|/|\\\\|g'
}


main()
{
   local prefix
   local mode

   prefix=${1:-"/usr/local"}
   [ $# -eq 0 ] || shift
   mode=${1:-755}
   [ $# -eq 0 ] || shift

   if [ -z "${prefix}" -o "${prefix}" = "--help" ] || [ -z "${mode}" ]
   then
      fail "usage: install.sh [prefix] [mode]"
   fi

   prefix="`realpath "${prefix}"`"
   if [ ! -d "${prefix}" ]
   then
      fail "\"${prefix}\" does not exist"
   fi

   local bin
   local libexec
   local share

   cd "`dirname -- "$0"`"

   bin="${prefix}/bin"
   share="${prefix}/share/mulle-sde/mulle"

   if [ ! -d "${bin}" ]
   then
      mkdir -p "${bin}" || fail "could not create ${bin}"
   fi

   install -m "${mode}" "mulle-c-sourcetree-update" "${bin}/mulle-c-sourcetree-update" || exit 1
   printf "install: ${C_MAGENTA}${C_BOLD}%s${C_RESET}\n" "${bin}/mulle-c-sourcetree-update" >&2

   EXTENSION_DIR="${share}/extensions"
   mkdir -p "${EXTENSION_DIR}" || exit 1

   for i in src/extensions/*
   do
      cp -Rav "${i}" "${EXTENSION_DIR}/" || exit 1
   done
}

main "$@"

