#!/usr/bin/env zsh

# if (( $+functions[zinit] )); then #DO_NOT_INCLUDE_LINE_IN_ZPM_CACHE
#   zinit load frandsoh/colors #DO_NOT_INCLUDE_LINE_IN_ZPM_CACHE
# fi #DO_NOT_INCLUDE_LINE_IN_ZPM_CACHE


# Dircolors
# Standarized $0 handling, following:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
_DIRNAME="${0:h}"

DIRCOLORS_CACHE_FILE="${_DIRNAME}/material-dircolors.zsh"

if (( $+commands[dircolors] )); then
  COMMAND="dircolors"
elif (( $+commands[gdircolors] )); then
  COMMAND="gdircolors"
fi

for file in "${_DIRNAME}/dircolors/"*.dircolors; do
  cat "$file"
done | $COMMAND - > "${DIRCOLORS_CACHE_FILE}"

source "${DIRCOLORS_CACHE_FILE}"


zstyle ':completion:*' list-dirs-first true
# Zsh colors
if [[ "$CLICOLOR" != '0' ]]; then
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

# # GCC Colors
# GCC_COLORS=''
# GCC_COLORS+="error=${c[raw_bold]};${c[raw_red]}"
# GCC_COLORS+=":warning=${c[raw_bold]};${c[raw_yellow]}"
# GCC_COLORS+=":note=${c[raw_bold]};${c[raw_white]}"
# GCC_COLORS+=":caret=${c[raw_bold]};${c[raw_white]}"
# GCC_COLORS+=":locus=${c[raw_bg_black]};${c[raw_bold]};${c[raw_magenta]}"
# GCC_COLORS+=":quote=${c[raw_bold]};${c[raw_yellow]}"

# export GCC_COLORS

# # Less Colors
# export LESS_TERMCAP_mb="${c[green]}"
# export LESS_TERMCAP_md="${c[bold]}${c[blue]}${c[bg_black]}"
# export LESS_TERMCAP_so="${c[bold]}${c[bg_yellow]}${c[black]}"
# export LESS_TERMCAP_us="${c[green]}"

# export LESS_TERMCAP_ue="${c[reset]}"
# export LESS_TERMCAP_me="${c[reset]}"
# export LESS_TERMCAP_se="${c[reset]}"

# # Grep Colors
# GREP_COLORS=''
# GREP_COLORS+=":mt=${c[raw_bold]};${c[raw_cyan]}"
# GREP_COLORS+=":ms=${c[raw_bg_red]};${c[raw_bold]};${c[raw_black]}"
# GREP_COLORS+=":mc=${c[raw_bold]};${c[raw_bg_red]}"
# GREP_COLORS+=':sl='
# GREP_COLORS+=':cx='
# GREP_COLORS+=":fn=${c[raw_bold]};${c[raw_magenta]};${c[raw_bg_black]}"
# GREP_COLORS+=':ln=32'
# GREP_COLORS+=':bn=32'
# GREP_COLORS+=":se=${c[raw_bold]};${c[raw_cyan]};${c[raw_bg_black]}"

# export GREP_COLORS

# # Ag Colors
# function ag() {
#   command ag \
#   --color-path "${c[raw_bg_black]};${c[raw_bold]};${c[raw_magenta]}"      \
#   --color-match "${c[raw_bg_red]};${c[raw_bold]};${c[raw_black]}"         \
#   --color-line-number "${c[raw_bg_black]};${c[raw_bold]};${c[raw_green]}" \
#   $@
# }

# FSH Colors
zstyle :plugin:fast-syntax-highlighting theme "material"
# typeset -g FAST_THEME_NAME="material"
typeset -Ag FAST_HIGHLIGHT_STYLES

export FAST_HIGHLIGHT_STYLES[materialdefault]=none
export FAST_HIGHLIGHT_STYLES[materialunknown-token]=fg=red,bold
export FAST_HIGHLIGHT_STYLES[materialreserved-word]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialalias]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialsuffix-alias]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialbuiltin]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialfunction]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialcommand]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialprecommand]=fg=green,bold,underline
export FAST_HIGHLIGHT_STYLES[materialcommandseparator]=fg=magenta,bold
export FAST_HIGHLIGHT_STYLES[materialhashed-command]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialpath]=fg=cyan,bold
export FAST_HIGHLIGHT_STYLES[materialpath_pathseparator]=fg=red,bold
export FAST_HIGHLIGHT_STYLES[materialglobbing]=fg=magenta,bold
export FAST_HIGHLIGHT_STYLES[materialglobbing-ext]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialhistory-expansion]=fg=blue,bold
export FAST_HIGHLIGHT_STYLES[materialsingle-hyphen-option]=fg=cyan,bold
export FAST_HIGHLIGHT_STYLES[materialdouble-hyphen-option]=fg=cyan,bold
export FAST_HIGHLIGHT_STYLES[materialback-quoted-argument]=none,bold
export FAST_HIGHLIGHT_STYLES[materialsingle-quoted-argument]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialdouble-quoted-argument]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialdollar-quoted-argument]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialback-or-dollar-double-quoted-argument]=fg=cyan,bold
export FAST_HIGHLIGHT_STYLES[materialback-dollar-quoted-argument]=fg=cyan,bold
export FAST_HIGHLIGHT_STYLES[materialassign]=fg=blue,bold
export FAST_HIGHLIGHT_STYLES[materialredirection]=fg=magenta,bold
export FAST_HIGHLIGHT_STYLES[materialcomment]=fg=black,bold
export FAST_HIGHLIGHT_STYLES[materialvariable]=fg=cyan,bold
export FAST_HIGHLIGHT_STYLES[materialmathvar]=fg=blue,bold
export FAST_HIGHLIGHT_STYLES[materialmathnum]=fg=magenta,bold
export FAST_HIGHLIGHT_STYLES[materialmatherr]=fg=red,bold
export FAST_HIGHLIGHT_STYLES[materialassign-array-bracket]=fg=cyan,bold
export FAST_HIGHLIGHT_STYLES[materialfor-loop-variable]=fg=blue,bold
export FAST_HIGHLIGHT_STYLES[materialfor-loop-number]=fg=magenta,bold
export FAST_HIGHLIGHT_STYLES[materialfor-loop-operator]=fg=red,bold
export FAST_HIGHLIGHT_STYLES[materialfor-loop-separator]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialexec-descriptor]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialhere-string-tri]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialhere-string-text]=fg=blue,bold
export FAST_HIGHLIGHT_STYLES[materialhere-string-var]=fg=cyan,bg=black
export FAST_HIGHLIGHT_STYLES[materialcase-input]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialcase-parentheses]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialcase-condition]=bg=blue,none,bold
export FAST_HIGHLIGHT_STYLES[materialcorrect-subtle]=fg=blue,bold,bg=black
export FAST_HIGHLIGHT_STYLES[materialincorrect-subtle]=fg=red,bold,bg=black
export FAST_HIGHLIGHT_STYLES[materialsubtle-separator]=bg=black,fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialsubtle-bg]=bg=black
export FAST_HIGHLIGHT_STYLES[materialpath-to-dir]=fg=blue,bold
export FAST_HIGHLIGHT_STYLES[materialpaired-bracket]=bg=blue
export FAST_HIGHLIGHT_STYLES[materialbracket-level-1]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialbracket-level-2]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialbracket-level-3]=fg=cyan,bold
export FAST_HIGHLIGHT_STYLES[materialglobal-alias]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialsubcommand]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialsingle-sq-bracket]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialdouble-sq-bracket]=fg=green,bold
export FAST_HIGHLIGHT_STYLES[materialdouble-paren]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialoptarg-string]=fg=yellow,bold
export FAST_HIGHLIGHT_STYLES[materialoptarg-number]=fg=magenta,bold
export FAST_HIGHLIGHT_STYLES[materialrecursive-base]=fg=default

export FAST_HIGHLIGHT_STYLES[materialsecondary]=default
