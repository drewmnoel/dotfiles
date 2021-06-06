#!/bin/bash

# Basic setup stuff
sudo apt update
sudo apt install 2to3 apt-file bind9-dnsutils binutils-x86-64-linux-gnu \
	bloodhound build-essential curl davtest dumpzilla enum4linux \
	exploitdb ffuf gobuster golang htop jq knockd lib32stdc++-10-dev \
	libc6-dev libc6-dev-i386 libc6-dev-i386-cross libfuse-dev \
	libmariadb-dev libpcap-dev libstdc++-10-dev linux-base \
	linux-image-amd64 make mingw-w64 mingw-w64-common mono-complete \
	mono-devel mono-mcs nbtscan ncat nikto nmap ntpdate onesixtyone \
	openssh-client oscanner perl-tk php-curl pipenv polenum powershell \
	pure-ftpd python3 python3-gevent python3-pip python3-venv \
	python3-virtualenv samba samdump2 seclists secure-delete \
	silversearcher-ag sipvicious smbclient smbmap smtp-user-enum \
	snmp snmpcheck sslscan strace telnet tmux tnscmd10g tree \
	virtualbox-guest-dkms virtualbox-guest-x11 whatweb wine32 \
	winetricks wkhtmltopdf

# Add our Kali key for fun
mkdir -p ~/.ssh/
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDZWolIn6hyq0SInuLKiCVfUPgd1uAaWcs0pH16/S0elVmqTvox6n9OtSZZ+NZKaPv1kZe/r4ctnuOefqONcQyHK9pGFN7H/k8UTih1IYtjD4tHuQSOebTi3t0g8RhxSMcQViF4pXonOa09DjZcfk8pnpfxPQ4OHbB+ZkmPBN57jS52qV7D4baXkCKVpK/PS8gwuT3L1UXXXpxU5refHVX9pKawRATAjYDsL8knYgshUSQbDOKYJyJiWfJnb3gDQbIJ33WzcrUlDJJj90d3r3+gpA5dpEKymtu7BeTVENohrwSib81uBQrHzfB5KO6rjQioNVFKkpV5EzeN5dKU2wnUbR8ntn9TlbNba+rJun+7AtdjeGqzQO8YnqfkKaWsalhbJZ7emiVWsd+WfOISpOuhrI975Hl+HPotpI7jQ0nq6x1GwcjI+TzjWuoup4hCVloQPFmMzgURcPxlwg9bDXeprPZkwl5tbkKdjFXVBTOIN7iw8vcRv65p7kTcJmRDME1Hu5Oeq2GRrlkbJunmmZOkp4CvsRmwmxOtvCB7Zy63FB7CwEIENqHhqEEUnURRvs8tFNxbPo+/vjxYdbCT80kU2NmINF0C6TJU8p1OiwTsZ4ERmiJsDMvnxG8h4nxseCpabNX4xxz62+QPhCEw5coYQ3Ui01uZTbOT/FuC0DIHoQ==' >> ~/.ssh/authorized_keys

# Pre-clone important repos
mkdir ~/tools/
git clone --recursive https://github.com/cobbr/Covenant.git ~/tools/Covenant

# Set up LPE
mkdir ~/tools/lpe
cp /usr/share/windows-resources/mimikatz/x64/mimikatz.exe ~/tools/lpe/mimi64.exe
cp /usr/share/windows-resources/mimikatz/Win32/mimikatz.exe ~/tools/lpe/mimi32.exe
curl https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/binaries/x64/Release/winPEASx64.exe -o ~/tools/lpe/winPEASx64.exe

# Get chisel
go get github.com/jpillora/chisel
GOOS=windows GOARCH=386 go get github.com/jpillora/chisel