# if [[ -n ${INSIDE_EMACS} ]]; then
#     # This shell runs inside an Emacs *shell*/*term* buffer.
#     prompt walters
#     unsetopt zle
# fi

# Start emacs in background from terminal
em() { emacs $@ &>/dev/null & disown }
