PROMPT_GEOMETRY_GIT_UNTRACKED_DIRTY=${PROMPT_GEOMETRY_GIT_UNTRACKED_DIRTY:-true}

prompt_geometry_git_status() {
  if [[ $PROMPT_GEOMETRY_GIT_UNTRACKED_DIRTY = false ]]; then
    if command git diff --no-ext-diff --quiet --exit-code; then
      echo $GEOMETRY_GIT_CLEAN
    else
      echo $GEOMETRY_GIT_DIRTY
    fi
  else
    if test -z "$(command git status --porcelain --ignore-submodules -unormal)"; then
      echo $GEOMETRY_GIT_CLEAN
    else
      echo $GEOMETRY_GIT_DIRTY
    fi
  fi
}
