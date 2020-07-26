#!/usr/bin/env bash


## Find true directory script resides in, true name, and true path
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"
__DIR_NAME__="${__DIR__##*/}"
__NAME__="${__SOURCE__##*/}"
__PATH__="${__DIR__}/${__NAME__}"
__AUTHOR__='S0AndS0'
__DESCRIPTION__='Symbolically links plugin and documentation files'


__license__(){
    _year="$(date +'%Y')"
    cat <<EOF
${__DESCRIPTION__}
Copyright (C) ${_year:-2020} ${__AUTHOR__:-"S0AndS0"}

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
EOF
}


__usage__() {
    local _message="${1}"
    cat <<EOF
${__DESCRIPTION__}


--help      -h

    Prints this message and exists


--license   -l

    Prints license and exits


--verbose   -v

    Prints messages about skipped actions
EOF

  (("${#_message}")) && {
    printf >&2 '\n## Error: %s\n' "${_message}"
  }
}


(("${#@}")) && {
  case "${@}" in
    '-h'|'--help'|'help')
      __usage__
      exit 0
    ;;
    '-l'|'--license'|'license')
      __license__
      exit 0
    ;;
    '-v'|'--verbose'|'verbose')
      _verbose=1
    ;;
    *)
      __usage__ "Unrecognized argument(s): ${@}"
      exit 1
    ;;
  esac
}


[[ -d "${HOME}/.vim" ]] || {
  printf >&2 '\n'
  exit 1
}


[[ -d "${HOME}/.vim/plugin" ]] || {
  mkdir -pv "${HOME}/.vim/plugin"
}


[[ -L "${HOME}/.vim/plugin/${__DIR_NAME__}" ]] && {
  if ((_verbose)); then
    printf 'Skipped linking plugin: %s\n' "${__DIR_NAME__}"
  fi
} || {
  printf 'Linking: %s\n' "${__DIR_NAME__}"
  ln -s "${__DIR__}" "${HOME}/.vim/plugin/"
}


[[ -d "${__DIR__}/doc" ]] && {
  [[ -d "${HOME}/.vim/doc" ]] || {
    mkdir -pv "${HOME}/.vim/doc"
  }

  while read -r _doc_path; do
    _doc_name="${_doc_path##*/}"
    [[ -L "${HOME}/.vim/doc/${_doc_name}" ]] && {
      if ((_verbose)); then
        printf 'Skipped linking documentation: %s\n' "${_doc_name}"
      fi
    } || {
      printf 'Linking documentation: %s\n' "${_doc_name}"
      ln -s "${_doc_path}" "${HOME}/.vim/doc/"
    }
  done < <(ls "${__DIR__}/doc/"*.txt)

  vim -c ":helptags ${HOME}/.vim/doc" -c ':q'
}

