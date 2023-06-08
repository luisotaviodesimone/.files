# create an array of plugins
plugins_array=(git autojump zsh-autosuggestions banana isso-aqui issoMais)
plugins_string=""

for plugin in "${plugins_array[@]}"
do
  echo $plugin
  plugins_string="$plugins_string\n  $plugin"
done

sed -i '' "s/plugins=(\([^)]*\)/plugins=(${plugins_string}\n/g" aliases.sh