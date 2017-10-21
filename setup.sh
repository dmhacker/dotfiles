shopt -s dotglob
for filepath in dotfiles/*
do
  filename="$(basename $filepath)"
  abspath="$(realpath $filepath)"
  ln -sv "$abspath" "$HOME/$filename"
done

