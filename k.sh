#!bin/bash
###################################################################################################
###################################################################################################
#Tite		:RTT by Casino data 
#Date		:20-DEC-20
#Version 	:V1
#Company	:Pragmatic Play
###################################################################################################
###################################################################################################
#Pre-req
mkdir -p /home/$USER/Desktop/RTT
mkdir -p /home/$USER/Desktop/RTT/output

touch -a /home/$USER/Desktop/RTT/rttnew.csv
 

#taking original sheet from Kibana
if [ -s /home/$USER/Downloads/'RTT by Casino.csv' ]
then
cp /home/pp-in-110/Desktop/RTT/pnew.csv /home/pp-in-110/Desktop/RTT/pold.csv
>/home/$USER/Desktop/RTT/percentage.txt
>/home/pp-in-110/Desktop/RTT/pnew.csv
mv /home/$USER/Downloads/'RTT by Casino.csv' /home/$USER/Desktop/RTT/new.csv
>/home/$USER/Desktop/RTT/rttnew.csv

#sort the fields in decending order
while IFS=, read -r field1 field2 field3 field4 field5
do
	echo "$field2 \t $field3" >> /home/$USER/Desktop/RTT/rttnew.csv

done < /home/$USER/Desktop/RTT/new.csv

#Compare data with required
while IFS=, read -r data
do
	cat rttnew.csv | grep $data >> /home/$USER/Desktop/RTT/output/`date +"%m-%d-%Y"-"%R"`.csv
	cat rttnew.csv | grep $data >> /home/pp-in-110/Desktop/RTT/pnew.csv

        cat rttnew.csv | grep $data
done < /home/$USER/Desktop/RTT/rtt_names

echo "###############################################################################################"
#Percentage the data

join -a1 -a2 pold.csv pnew.csv > /home/$USER/Desktop/RTT/percentage.csv

while IFS=, read -r field
do
a=`echo $field |awk '{print $2}'`

b=`echo $field |awk '{print $3}'`
#c=`echo $field|awk '{print $1}'`
p=`echo "scale=2; $b / $a" | bc`
#echo $p
q=`echo "$p - 1" | bc`
#echo $p
r=`echo "$q * 100" | bc`
#echo $r
echo "`echo $field|awk '{print $1}'` is \t $r% \t change." >> /home/$USER/Desktop/RTT/percentage.txt

done < /home/$USER/Desktop/RTT/percentage.csv
cat /home/$USER/Desktop/RTT/percentage.txt


#Backup of old data
mv /home/$USER/Desktop/RTT/rttnew.csv /home/$USER/Desktop/RTT/rttold.csv
echo "Please get the output data in /home/$USER/Desktop/RTT/output/ "
else
	echo "Please download the data from Kibana"
fi

###################################################################################################
