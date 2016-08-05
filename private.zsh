if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM="$ZSH/custom"
fi
for config_file ($ZSH_CUSTOM/private/*.zsh(N)); do
  source $config_file
done
unset config_file
