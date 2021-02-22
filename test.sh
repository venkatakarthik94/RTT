join -a1 -a2 pold.csv pnew.csv > /home/pp-in-110/Desktop/RTT/percentage.csv

while IFS=, read -r field
do
a=`echo $field |awk '{print $2}'`

b=`echo $field |awk '{print $3}'`
#c=`echo $field|awk '{print $1}'`
p=`echo "scale=2; $a / $b" | bc`
#echo $p
q=`echo "$p - 1" | bc`
#echo $p
r=`echo "$q * 100" | bc`
#echo $r
echo "`echo $field|awk '{print $1}'`  is $r % change."

#echo $field | awk '{print $2 " " $3}'
done < /home/pp-in-110/Desktop/RTT/percentage.csv


curl --user pplive:99JdbqOI23ht class="euiButton__text" https://kibana.pragmaticplaylive.net/app/kibana#/dashboard/6f3f2ae0-45a2-11e9-9f5b-7759dded6c19?_a=h@6b3392a&_g=h@c823129
