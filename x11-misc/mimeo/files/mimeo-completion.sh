__mimeo_completion()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"
    dash_opts=$(mimeo -h | grep -E -- '(^  -)' | tr , $'\n' | awk '{ print $1 }' | grep -E '^-')
    if [[ ${cur} == -* ]]; then
        opts="$dash_opts"
    fi
		mapfile -t COMPREPLY < <(compgen -W "${opts}" -- "${cur}")
}
complete -F __mimeo_completion mimeo
