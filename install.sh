#!/bin/bash
path="$HOME/.env"
zshrc="$HOME/.zshrc"
bashrc="$HOME/.bashrc"

if [ $( ls -a $HOME | grep -w "\.env" | wc -l) -gt 0 ]; then
    echo "copying bashrc to .env"
    cp -r ./root/ $HOME/.env/
else
    echo "creating directory and copying bashrc into it"
    mkdir $HOME/.env
    cp -r ./root/ $HOME/.env/
fi

check_alias() {
	sh="$1"
	rc=$(grep "alias $ali=" "$sh")
	if [[ "$rc" != "" ]]
	then
		echo -e "The alias '$ali' already exists in $sh! You want to overwrite it? [y/N]:"
		read -r overwrite
		if [[ "$overwrite" == "y" ]]
		then
			sed -i '' -e "/alias $ali=/d" "$sh"
		fi
	fi
}
create_alias() {
	ali="$1"
	if [[ "$ali" == "" ]]
	then
		ali="$2"
	fi
	check_alias "$zshrc"
	check_alias "$bashrc"
}
insert_alias() {
	sh="$1"
	echo -e "$Creating aliases in $sh ....."
	echo "alias $ali_init=\"bash $path/init_docker.sh\"" >> "$sh"
	echo "alias $ali_valgrind=\"bash $path/start.sh\"" >> "$sh"
}

echo -en "Please enter an alias to init your dockercontainer [d_init]:"
read -r ali_init
create_alias "$ali_init" "d_init"
ali_init="$ali"

echo -en "Please enter an alias to start your dockercontainer [d_start]:"
read -r ali_valgrind
create_alias "$ali_valgrind" "d_start"
ali_valgrind="$ali"

insert_alias "$zshrc"
insert_alias "$bashrc"

echo "Please reload the shell for the scripts to work"
echo "source ~/.zshrc"
echo "source ~/.bashrc"