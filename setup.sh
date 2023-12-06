# !/bin/bash

trap "echo -e '\n';exit 0" SIGINT

i3=0

rofi=0

nvim=0

terminal="kitty"

copy() {
	if [[ -d $HOME/.config/$1 ]]; then
		read -p "It seems that you already have a $1 configuration do you want to preceed (y/n): " preceed
		while [[ ! $preceed =~ [yn] ]]; do
			read -p "Invalid input.Please enter 'y' or 'n': " preceed
		done
		if [[ $preceed = "y" ]]; then
			echo "Well done replacing the configs for $1"
			cp -r $2 $HOME/.config/$1
		else
			echo "Alright no problem..."
		fi
	else
		echo "Copying $1 config ..."
		cp -r $2 $HOME/.config/$1
	fi
}

setupI3() {
	read -p "Do you want to set up i3 (y/n): " intermediate
	while [[ ! $intermediate =~ [yn] ]]; do
		read -p "Invalid input. Please enter 'y' or 'n': " intermediate
	done
	[ $intermediate = "n" ]
	i3=$?
	if [[ $i3 = 1 ]]; then
		copy i3 ./linux/i3/
	fi
}
setupRofi() {
	read -p "Do you want to set up rofi (y/n): " intermediate
	while [[ ! $intermediate =~ [yn] ]]; do
		read -p "Invalid input. Please enter 'y' or 'n': " intermediate
	done
	[ $intermediate = "n" ]
	rofi=$?
	if [[ $rofi = 1 ]]; then
		copy rofi ./linux/rofi/
	fi
}

setupTerminal() {
	select choice in kitty no-terminal; do
		terminal=$choice
		break
	done

	if [[ $terminal != "no-terminal" ]]; then
		copy $terminal ./linux/terminals/$terminal
	fi
}

setupNvim() {
	read -p "Do you want to set up neovim (y/n): " intermediate
	while [[ ! $intermediate =~ [yn] ]]; do
		read -p "Invalid input. Please enter 'y' or 'n': " intermediate
	done
	[ $intermediate = "n" ]
	nvim=$?
	if [[ $nvim = 1 ]]; then
		copy nvim ./nvim/
	fi
}

setupI3

setupRofi

setupNvim

setupTerminal
