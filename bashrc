
# Don't enable any potentially breaking features
# if the shell session is non-interactive
if [[ $- != *i* ]] ; then
        return
fi

# Load dotfiles
for file in ~/dotfiles/{bash_prompt,bash_aliases,git-completion.sh}; do
  [ -r "$file" ] && source "$file"
done
unset file
