source $DOT_FILES_DIR/utils.sh

if ! isCommandInstalled "pip"; then
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py --user
	rm get-pip.py
fi

if ! isCommandInstalled "ansible"; then
	python3 -m pip install --user ansible
	python3 -m pip install --user ansible-lint
	return
fi

echo -e " $RED ansible is already installed $RESET" 
