 #!/bin/bash

function parse_csv() {
	while IFS=',' read -r id name hp mp str int def res spd luck race class rarity
        do 
             echo "$id $name $hp $mp $str $int $def $res $spd $luck $race $class $rarity"  

	done < "players.csv"
}
parse_csv


