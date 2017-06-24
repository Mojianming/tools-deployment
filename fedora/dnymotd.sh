#!/bin/bash
set -e
# set -x

DATE=$(date "+%F %T")
HEAD="System infomation as of: ${DATE}"
# base info
Kernal=$(uname -r)
distribution=$(cat /etc/*release|grep -E '^PRETTY_NAME='|awk -F= '{print $2}')
hostName=${HOSTNAME}

# CPU load
load1=$(cat /proc/loadavg|awk '{print $1}')
load5=$(cat /proc/loadavg|awk '{print $2}')
load15=$(cat /proc/loadavg|awk '{print $3}')

# uptime
uptime=$(cat /proc/uptime|cut -f1 -d.)
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))
up_lastime=`date -d "$(awk -F. '{print $1}' /proc/uptime) second ago" +"%Y-%m-%d %H:%M:%S"`

# User
userCount=$(users|wc -w)
user=$(whoami)
users=$(w -f|grep -vE "LOGIN|load average"|awk 'BEGIN{print "\\e[33;1mUser \t\t TTY \t\t LOGIN\\e[0m"}{print ($1,"\t\t",$2,"\t\t",$3)}')
# users=$(w -f|grep -vE "LOGIN|up"|awk 'BEGIN{print "\\e[33;1mUser \t\t\t LOGIN \t\t\t TTY \\e[0m"}{printf("%-24s %-22s %-20s\n",$1,$3,$2)}')

# processes
processes=$(ps aux|wc -l)

# Memory Usage
# mem_usage=$(free -m | awk 'BEGIN{print "\\e[33;1mMemory \t\t Total \t\t Used \t\t Rate \\e[0m"} /Mem:/{total=$2} /Mem:/ {used=$3} END {printf("%-16s %-15s %-15s %3.2f%%","Mem:",total"(M)",used"(M)",used/total*100)}')
# swap_usage=$(free -m | awk '/Swap:/{total=$2} /Swap:/ {used=$3} END {printf("%-16s %-15s %-15s %3.2f%%","Swap:",total"(M)",used"(M)",used/total*100)}')
Memory=$(free -m | grep -vE "total" | awk '{print $1}')

#System fs usage
Filesystem=$(df -h | awk '/^\/dev/{print $6}')

echo "###############################################################"
echo -e "\t"${HEAD}
echo "###############################################################"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "\tSystem distribution: ${distribution//\"/''}"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo
# printf "System distribution: %s\n" ${distribution//\"/''}
printf "Kernel Version:\t%s\n" ${Kernal}
printf "HostName:\t%s\n" ${HOSTNAME}
printf "Processes:\t%s\n" $processes
printf "System Load:\t%s %s %s\n" $load1, $load5, $load15
printf "System Uptime:\t%s "days" %s "hours" %s "min" %s "sec"\n" $upDays $upHours $upMins $upSecs
echo "-----------------------------------------------------------"
printf "\033[33;1mFilesystem\tTotal\tFree\tUsage\n\033[0m"
for f in $Filesystem
do
    Usage=$(df -h | awk '{if($NF=="'''$f'''") print $5}')
    Total=$(df -h | awk '{if($NF=="'''$f'''") print $2}')
    Free=$(df -h | awk '{if($NF=="'''$f'''") print $4}')
    if [[ ${Usage::-1} -ge 80 ]];then
      echo -e "\e[31;1m$f\t\t$Total\t$Free\t$Usage\e[0m"
    else
      echo -e "$f\t\t$Total\t$Free\t$Usage"
    fi
done
echo "-----------------------------------------------------------"
# echo -e "${mem_usage}"
# echo -e "${swap_usage}"
printf "\033[33;1mType\t\tTotal\tFree\tRate\n\033[0m"
for m in ${Memory}
do
  total=$(free -m | awk '{if($1=="'''$m'''") print $2}')
  used=$(free -m | awk '{if($1=="'''$m'''") print $3}')
  rate=$(printf "%3.2f%%" `echo "scale=5;${used}/${total}*100"|bc`)
  if [[ ${rate::-4} -ge 80 ]];then
    echo -e "\e[31;1m${m}\t\t${total}\t${used}\t${rate}\e[0m"
  else
    echo -e "${m}\t\t${total}\t${used}\t${rate}"
  fi
done
echo "-----------------------------------------------------------"
printf "Login User:\t%s\n" ${userCount}
printf "Current User:\t%s\n" ${user}
echo -e "${users}"













