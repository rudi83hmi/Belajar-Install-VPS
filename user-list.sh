#!/bin/bash
echo -e "\e[37;1m=[-------------------------------]="
echo -e "\e[34;1m[USERNAME]        \e[34;1m  [EXP DATE]   "
echo -e "\e[37;1m=[-------------------------------]="
echo -e "\e[31;1m"
while read expired
do
        AKUN="$(echo $expired | cut -d: -f1)"
        ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 1000 ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp"
        fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "\e[37;1m=[-------------------------------]="
echo -e "\e[34;1m=[Jumlah akun: $JUMLAH user]="
echo -e "\e[37;1m=[-------------------------------]="
echo -e "\e[36;1mBorneo Cyber Phreak | www.borneocyberphreak.tk"
echo -e "\e[30;1m"