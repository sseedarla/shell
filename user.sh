script_path=$(dirname $0)
source ${script_path}/common.sh
echo ${app_user}

echo $script_path
echo -e "\e[37m»>>>>>>>> copy user.service to  /etc/systemd/system/<<<<<<<<\e[0m"

cp ${script_path}/user.service /etc/systemd/system/
Function1
