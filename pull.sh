trap "echo -e '\n'; exit " SIGINT

themesArray=($(ls ./themes/))
numberOfThemes="${#themesArray[@]}"
selectedTheme="${themesArray[0]}"
error_color="\e[38;2;255;0;0m"
valid_color="\e[38;2;0;255;0m"
warning_color="\e[38;2;255;255;0m"
nc="\e[0m"
theme=""
configPath=$HOME/.config

copyStatic() {
	cp $configPath/i3/config .
	cp $configPath/i3Scripts/* ./scripts/
}

copyTheme() {
	echo -e "$valid_color Either update existing theme or add new theme. $nc"
	select option in "${themesArray[@]}" new; do
		if [[ ! $REPLY =~ ^[0-9]+$ ]]; then
			echo -e "$error_color for god sake enter a number. $nc"
			break
		fi
		if ((REPLY <= 0 || REPLY > numberOfThemes + 1)); then
			echo -e "$error_color Invalid input.$nc"
			break
		else
			if ((REPLY == numberOfThemes + 1)); then
				echo -e "$valid_color Very well adding new theme $nc"
				read -p "Please enter the name for this new theme : " newTheme
				theme=$newTheme
				mkdir ./themes/$newTheme
			else
				((REPLY--))
				theme="${themesArray[$REPLY]}"
			fi
			cp -r $configPath/kitty/ ./themes/$theme/
			cp -r $configPath/polybar/ ./themes/$theme/
			cp -r $configPath/betterlockscreen/ ./themes/$theme/
			cp -r $configPath/rofi/ ./themes/$theme/
			copyimage $theme
			break
		fi
	done
}

copyimage() {
	read -p "Enter the absolute path for the background image: " imgpath
	extension=$(basename "$imgpath" | awk -F "." '{print $2}')
	echo "$extension"
	if [[ -f "$imgpath" && "$extension" == "jpg" ]]; then
		cp "$imgpath" "./assets/images/$1.jpg"
		echo "Image copied successfully."
	else
		echo "Invalid image path or extension. Make sure the file exists and has a '.jpg' extension."
	fi
}

gitCommit() {
	read -p "Do you want to commit and push these changes (y/n) : " commiting

	if [[ $commiting == "y" ]]; then
		read -p "Very well write a commit message : " commitMsg
		git add .
		git commit -m "$commitMsg"
	fi
}

copyStatic

copyTheme

gitCommit
