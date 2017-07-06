#!/usr/bin/env bash

echo "Linking configuration"

FILES=(bashrc bash_profile bash_prompt bash_aliases gitconfig gitignore)

function backup_or_unlink {
  DEST=$1 ; shift
  if [[ -d ${DEST} || -e ${DEST} ]] ; then
    COPY="${DEST}-backup-$(date +%Y%m%d%H%I%S)"

    echo "Copying file: ${DEST} to ${COPY}"
    mv ${DEST} ${COPY}
  elif [[ -L ${DEST} ]] ; then
    echo "Unlinking file: ${DEST}"
    unlink ${DEST}
  fi
}


# Link in regular dotfiles (from a to ~/.a)

for FILE in ${FILES[@]}
do
  DEST="${HOME}/.${FILE}"
  SRC="$(pwd)/${FILE}"

  backup_or_unlink ${DEST}

  echo "Linking file: ${FILE}"
  ln -sf ${SRC} ${DEST}
done
echo "Done installing dotfiles"
