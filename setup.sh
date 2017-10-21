shopt -s dotglob
for filepath in dotfiles/*
do
  filename="$(basename $filepath)"
  copytopath="$HOME/$filename"
  abspath="$(realpath $filepath)"
  if [ -L $copytopath ]; then
    echo "Unlinking ... $copytopath"
    unlink "$copytopath"
  fi
  echo "Linking ... $abspath -> $copytopath"
  ln -s "$abspath" "$copytopath"
done

