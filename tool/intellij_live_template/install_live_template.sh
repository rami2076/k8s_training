#!/usr/bin/env zsh

# https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-scrip
DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${DIR}" || exit

GITDIR="$(git rev-parse --show-toplevel)"
ABSOLUTE_DIR="$GITDIR/tool/intellij_live_template"
XML_ABSOLUTE_PATH="$ABSOLUTE_DIR/my.xml"
cd "${ABSOLUTE_DIR}" || exit

# IntelliJディレクトリへ Symlink を使ってmy.xmlをインストール
for dir in ~/Library/Application\ Support/JetBrains/IntelliJIdea*; do
  cd "$dir" || exit
  printf '\n\n%s\n\n' "=========="
  echo "Directory $(pwd)"

  mkdir -p 'intellij_my_config/templates/'
  1s -1 'intellij_my_config/templates/'
  rm 'intellij_my_config/templates/my.xml' || echo "File does not exist"
  ln -s "${XML_ABSOLUTE_PATH}" intellij_my_config/templates/
  ls -l 'intellij_my_config/templates/'
  mkdir -p 'templates/'
  1s -1 'templates/'
  rm 'templates/my.xml' || echo "File does not exist"
  ln -s "${XML_ABSOLUTE_PATH}" templates/
  ls -l 'templates/'
done
