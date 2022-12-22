# Build Guide for TheDarkist

## Status

**NTP**: Off  
**Firewall**: On  
**Updates**: Off  
**ICMP**: On  
**IPv6**: Off  
**AV or Security**: Off

## Overview

**OS**: Ubuntu Server 22.04.1 LTS  
**Hostname**: darkist    (passsword:darkist1) if asked
**Vulnerability 1**:   OSINT GATHERING FROM SOCIAL MEDIA (ID: T1589) , FTP ANONYMOUS ACCESS (ID: S0095)
**Vulnerability 2**: Misconfigured SUID Binary(ID: T1548.001) ,SPECIAL PRIVILEGE TO CERTAIN FILE/PROGRAM IN SUDOER FILE(ID: T1548.003),Log Injection-Tampering-Forging (CAPEC-93)
**Admin Username**: root  
**Admin Password**: darkist1
**Low Priv Username**: Ghyophoggua  
**Low Priv Password**: Super1337P@$$
**Location of local.txt**: /home/Ghyophoggua/local.txt  
**Value of local.txt**: 8cfdd9239ccb9deea5f6618934cea489  
**Location of proof.txt**: /root/proof.txt  
**Value of proof.txt**: e13d693f3664fbec169c3244c9d1578d

## Required Settings

**CPU**: 2 CPU  
**Memory**: 2GB  
**Disk**: 8GB

## Build Guide

1. Install Ubuntu Server 22.04.1 LTS 
2. Enable network connectivity
3. Upload the following files to `/var/`
    - `Build.sh`
    - `TheDarkistFiles.zip`
4.  Switch to root user & Give permission to Build.sh
    - chmod +x Build.sh    
5. Change to `/var` and run `./Build.sh`
