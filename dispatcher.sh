
#!/bin/bash
path="./logs/latest.log"
CURRENTEXP=""
while true
do
OUT=$( tail -n 1 logs/latest.log | grep "Donation" )
#echo "tail = $OUT"



exp=$(echo $OUT |awk '{print $1}')
SERVER=$(echo $OUT |awk -F'-' '{print $2}')
Username=$(echo $OUT |awk -F'-' '{print $3}')
TODO=$(echo $OUT |awk -F'-' '{print $4}')




#echo "$exp = $CURRENTEXP"
 if [ "$exp" == "$CURRENTEXP" ];
        then
                echo found
        else
                        echo "EXP = $exp"
                        echo "SERVER = $SERVER"
                        echo "user = $Username"
                        echo "TODO = $TODO"

                        tmux send-keys -t $SERVER "say Thanks for donating $Username" ENTER
                        tmux send-keys -t $SERVER "$TODO" ENTER

                CURRENTEXP=$(echo $OUT |awk '{print $1}')
        fi


done

