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

prompt_geometry_git_remote_check() {
  local_commit=$(git rev-parse "@" 2>/dev/null)
  remote_commit=$(git rev-parse "@{u}" 2>/dev/null)
  remote_branch_name=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)

  if [[ $remote_branch_name == "" || $local_commit == "@" || $local_commit == $remote_commit ]]; then
    echo ""
  else
    common_base=$(git merge-base "@" "@{u}" 2>/dev/null) # last common commit
    if [[ $common_base == $remote_commit ]]; then
      echo $GEOMETRY_GIT_UNPUSHED
    elif [[ $common_base == $local_commit ]]; then
      echo $GEOMETRY_GIT_UNPULLED
    else
      echo "$GEOMETRY_GIT_UNPUSHED $GEOMETRY_GIT_UNPULLED"
    fi
  fi
}
