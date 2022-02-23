#!/bin/bash
echo "WELCOME TO HYRULE CASTLE !"


function parseplayers_csv() {
while IFS=',' read -r id name hp mp str int def res spd luck race class rarity
do
		echo "$id $name $hp $mp $str $int $def $res $spd $luck $race $class $rarity"


	done < "players.csv"
}
echo "====================PLAYERS===================="
parseplayers_csv

function parseenemies_csv() {
while IFS=',' read -r id name hp mp str int def res spd luck race class rarity
do
                echo "$id $name $hp $mp $str $int $def $res $spd $luck $race $class $rarity"

        done < "enemies.csv"

}
echo "====================ENEMIES===================="
parseenemies_csv

function parsebosses_csv() {
while IFS=',' read -r id name hp mp str int def res spd luck race class rarity
do
                echo "$id $name $hp $mp $str $int $def $res $spd $luck $race $class $rarity"

        done < "bosses.csv"

}
echo "====================BOSSES===================="
parsebosses_csv

turn=1
hpmax_link=60
hp_link=60
str_link=15
hp_bokoblin=30
str_bokoblin=5
hp_ganon=150
str_ganon=20
attack="attack"
heal="heal"
compteur_bokoblin=0
ganon_death=0
while [[ $compteur_bokoblin -ne 10 ]];
do
	if [[ $hp_link -eq 0 ]];
	then
		exit
	fi
	if [[ $hp_bokoblin -eq 0 ]];
	then
		echo "The bokoblin is fainted ! You can access to the next stage."
		hp_bokoblin=30
		turn=1
		compteur_bokoblin=$((compteur_bokoblin+1))
		echo "Vous avez tué ""$compteur_bokoblin" "bokoblins."
	fi
	echo "####################TOUR"$turn"####################"
	echo "You have"" $hp_link HP left"
	echo "Choose between attack or heal yourself."
	read answer
	echo "You chose $answer"
	if [[ $attack == $answer ]];
	then
		hp_bokoblin=$(($hp_bokoblin-$str_link))
		echo "Link has dealt 15 damage to the bokoblin !"
	fi
	if [[ $heal == $answer ]];
	then
			hp_link=$((($hpmax_link/2)+$hp_link))
			if [[ $hp_link -gt 60 ]];
			then
				hp_link=60
			fi
			echo "Link healed himself : $hp_link/60 !"
	fi
		hp_link=$(($hp_link-$str_bokoblin))
		echo "The bokoblin enemy dealt 5 damage !"
		turn=$((turn+1))
done
turn=1
while [[ $ganon_death -ne 1 ]];
do
        if [[ $hp_link -lt 1 ]];
        then
		echo "You're dead, retry !"
                exit
        fi
        if [[ $hp_ganon -eq 0 ]];
        then
                echo "You defeated Ganondorf !"
           	ganon_death=$((ganon_death+1))
        fi
        echo "####################TOUR"$turn"####################"
        echo "You have"" $hp_link HP left"
        echo "Choose between attack or heal yourself."
        read answer
        echo "You chose $answer"
        if [[ $attack == $answer ]];
        then
                hp_ganon=$(($hp_ganon-$str_link))
                echo "Link has dealt 15 damage to Ganon !"
	fi
        if [[ $heal == $answer ]];
        then
                        hp_link=$((($hpmax_link/2)+$hp_link))
                        if [[ $hp_link -gt 60 ]];
                        then
                                hp_link=60
                        fi
                        echo "Link healed himself : $hp_link/60 !"
        fi
                hp_link=$((hp_link-str_ganon))
                echo "Ganon dealt you 20 damage !"
		turn=$((turn+1))
done
echo "Congratulations, you won the game !"
