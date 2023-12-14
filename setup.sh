trap "echo -e '\n'; exit " SIGINT

themesArray=($(ls ./themes/))
numberOfThemes="${#themesArray[@]}"
selectedTheme="${themesArray[0]}"
error_color='\e[38;2;255;0;0m'
valid_color='\e[38;2;0;255;0m'
warning_color='\e[38;2;255;255;0m'
nc='\e[0m'
configPath=$HOME/.config

getTheme() {
	PS3="Select a theme: "
	select theme in "${themesArray[@]}"; do
		if ((0 < REPLY && REPLY <= $numberOfThemes)); then
			echo -e "$valid_color Excellent You chose $theme.$nc"
			selectedTheme=$theme
			break
		else
			echo -e "$error_color Invalid input. To select a theme choose a number between 1 and $numberOfThemes .$nc"
			exit 1
		fi
	done
}

copyI3() {
	if [[ -d $configPath/i3 ]]; then
		cp ./config $configPath/i3/ 2>>/dev/null
		cp ./assets/images/$selectedTheme.jpg $configPath/i3/bg.jpg 2>>/dev/null
	else
		mkdir $configPath/i3 2>>/dev/null
		cp ./config $configPath/i3/ 2>>/dev/null
		cp ./assets/images/$selectedTheme.jpg $configPath/i3/bg.jpg 2>>/dev/null
	fi
	if [[ $? = 0 ]]; then
		echo -e "$valid_color Successfully copying i3 configuration.$nc"
	else
		echo -e "$error_color something went wrong while copying i3 configuration.$nc"
	fi
}

copyUtils() {
	if [[ -d $configPath/$1 ]]; then
		cp ./themes/$selectedTheme/$1/* $configPath/$1/ 2>>/dev/null
	else
		cp -r ./themes/$selectedTheme/$1/ $configPath 2>>/dev/null
	fi
	if [[ $? = 0 ]]; then
		echo -e "$valid_color Successfully copying $1 configuration.$nc"
	else
		echo -e "$error_color something went wrong while copying $1 configuration. $nc"
	fi
}

copyScripts() {
	if [[ -d $configPath/i3Scripts ]]; then
		cp ./scripts/* $configPath/i3Scripts/ 2>>/dev/null
	else
		mkdir $configPath/i3Scripts
		cp -r ./scripts/* $configPath/i3Scripts/ 2>>/dev/null
	fi
	if [[ $? = 0 ]]; then
		echo -e "$valid_color Successfully copying configuration scripts.$nc"
	else
		echo -e "$error_color something went wrong while copying configuration scripts .$nc"
	fi
}

echo -e "$warning_color Warning:This will override your current configurations for i3,polybar,kitty,betterlockscreen,rofi.$nc"

getTheme "$@"

copyI3

copyUtils kitty

copyUtils polybar

copyUtils rofi

copyUtils betterlockscreen

copyScripts
