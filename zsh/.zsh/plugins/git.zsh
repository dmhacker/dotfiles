prompt_geometry_git_status() {
  # Adjust the git status command so that it starts at the top level rather than the current subdirectory 
  if test -z "$(git status --porcelain --ignore-submodules)"; then
    if test -z "$(git ls-files --others --modified --exclude-standard)"; then
      echo $GEOMETRY_GIT_CLEAN
    else
      echo $GEOMETRY_GIT_DIRTY
    fi
  else
    echo $GEOMETRY_GIT_DIRTY
  fi
}
