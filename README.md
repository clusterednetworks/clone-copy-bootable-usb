# clone-copy-bootable-usb
This script was initially designed backing up the USB boot drive for a Xigmanas server.
However it can be used for any bootable UNIX/LINUX/ FreeBSD type server.

# Usage:

1. Pull up a terminal or SSH into the target server (e.g. xigmanas).

2. Logon as root

<code>sudo -i</code>

3. Download the clone-copy-bootable-usb.sh shell script.

<code>wget https://raw.githubusercontent.com/clusterednetworks/clone-copy-bootable-usb/master/clone-copy-bootable-usb.sh</code>

4. Make the script executable

<code>chmod +x clone-copy-bootable-usb.sh</code>

5. Edit the script to your environment.
<code>
 <pre>
 # Edit to suit your environment and options
DAYS_TO_KEEP=4    # 0 to keep forever
BOOT_USB=/dev/da0  # path to your USB device
BACKUP_USB=/dev/da1 # backup USB device
BACKUP_PATH=/mnt/Pool2/backup # backup path to create iso file
BS_SIZE=16k  # size 
  </pre>
  </code>

6. Run the script.

<code>./clone-copy-bootable-usb.sh</code>

6. Check to see if the ISO has been created at your specified backup location.

7. Burn the ISO to another USB Drive.

8. Make sure the newly created USB Drive boots properly

9. Setup a cronjob to run the script daily/weekly if you choose.

