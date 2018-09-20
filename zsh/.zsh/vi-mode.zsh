zle -N zle-keymap-select geometry_prompt_vi-mode_render

geometry_prompt_vi-mode_setup() {}
geometry_prompt_vi-mode_check() {}
geometry_prompt_vi-mode_render() {
  NORMAL_MODE=$(prompt_geometry_colorize "magenta" " ")
  RPROMPT="${RPROMPT/$NORMAL_MODE /}"
  if [[ $KEYMAP = "vicmd" ]]; then
    RPROMPT="${NORMAL_MODE} ${RPROMPT}"
  fi
  zle && zle reset-prompt || echo -n $RPROMPT
}
