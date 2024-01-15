# USB-Rubber-Ducky-scripts
These are three attack examples using USB Rubber ducky. Each attack has a process description, the attack objectives, and what this attack will compromise (Confidentiality, Integrity, Availability). All attacks are demonstrated in the demo video.
Demo video link: https://drive.google.com/file/d/1LGZDMH8PWYl0N4D5zjK6A_FbCHO7DpX7/view?usp=sharing

# Attack one: Bank account credentials theft
The attack started with plugging a Rubber Ducky USB device into the Ubuntu machine (DHCP Server) with IP address 10.10.10.1/24. The Rubber Ducky USB was used to launch a – Script 1. that edited the configuration file of the DHCP server “/etc/dhcp/dhcpd.conf”. The script changed the DNS server information in the configuration file to point to the rogue DNS server on the Kali machine with IP address 10.10.10.99/24. After the configuration file was edited, the DHCP server began providing incorrect DNS server 
information to the victim system (10.10.10.99 instead of 10.10.10.200). When the victim system (Windows 11) attempted to resolve the name “sgbank.com”, the requests were 
redirected to the rogue DNS server. The rogue DNS server then responded with the IP address of a malicious website instead of the legitimate website the victim was attempting to access.
# Impact: 
The impact of the attack was significant as it allowed the attacker to redirect the victim's traffic to malicious websites. This result that the victim’s credentials were stolen via a phishing website which was running on the attacker machine kali (10.10.10.99). This attack violates users’ confidentiality, as it leaks users’ credentials and sensitive information.
# Mitigation: 
• Do not allow users with full administrative privileges to access systems without authentication.
• Usage of reputable and secure DNS resolver.
• Educating users to do not trust suspected pages and insecure http pages.
• Limiting physical access to servers’ room, or at least protecting the machine running critical services. 
• Disable USB ports when are not needed.

# Attack two: Credit card information theft
In this scenario, the attacker used a social engineering technique to gain access to the victim's sensitive information. The attacker waited for the victim to leave its computer unattended. The attacker then used his phone to access a target website and requested a password reset under the name of the victim. The website automatically sent a password reset email to the victim's email address. While the victim was away from their computer, the attacker quickly inserted the Rubber Ducky USB to execute - Script 2. that runs PowerShell commands that forwarded the reset email to his own email address and deleted it from the victim's Outlook agent.The entire attack took around 11 seconds, which was enough time for the attacker to plug and remove the USB from the victim's computer. The attacker could then access his own email account to retrieve the reset password email and reset the victim's account password.
# Impact: 
The impact of this attack is severe, as it allows the attacker to change the victim’s password and gain full access to his accounts and sensitive information. In this case, the attacker has gained access to the victim's account without their permission, which is a breach of the confidentiality.
This Microsoft Page https://learn.microsoft.com/en-us/archive/msdn-magazine/2013/march/powershell-managing-an-outlook-mailbox-with-powershell helped me to build the previous script and to extract e-mails from Outlook using PowerShell.
# Mitigation: 
• Enabling Multi-Factor Authentication. 
• Educating users to NEVER let their computers without login off.
• Enabling Bad USB prevention feature provided by the Antivirus.
• Forbid the usage of PowerShell without authentication.

# Attack 3: Shared folder information theft
The attacker’s aim is to gain access to a shared private folder stored in the SMB server with IP address of 192.168.248.138/24, as he knows that this folder is protected with a password. Therefore, he cannot access it as an ordinary user. The attacker plugs the USB Rubber Ducky in the Linux machine (Ubuntu). The USB runs a few commands - Script 3. in order to download some tools such sshpass (allows the attacker to include the SSH password in the same line of the scp command), and inotify-tools (this tool 
monitor any modification in a chosen directory). In the other side, the attacking machine (Kali) with IP address of 192.168.248.139/24 is running a Simple HTTP server to allow the USB to download a - Code 1. That compromise the system. When the - Code 1. is running in the background, it will monitor the shared folder and see if a 
user makes any modification within the folder or makes any updates, the SMB server will send a copy of the folder content to the attacker with the new information. As result, the attacker will receive a copy of the users’ credentials and any new sensitive information.
# Impact: 
This attack allows the attacker read unauthorised information by receiving updated copies from the SMB server, and this can result multiple and severe attacks, as he can pretend to be any user and use his privileges. This attack affects explicitly the confidentiality.
# Mitigation: 
• Do not allow users with full administrative privileges to access systems without authentication.
• Limiting physical access to servers’ room, or at least protecting the machine running critical services.
• Do not save passwords in files and in clear text.
• Disable USB ports when are not needed.
