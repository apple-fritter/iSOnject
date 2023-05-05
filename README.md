# iSOnject
This bash script performs operations related to modifying and repackaging an ISO image file. Here's a step-by-step breakdown of the script:

1. `#!/bin/bash`: This line specifies that the script should be run using the Bash shell.

2. `chrootDir="./chrootDir"`: This line sets the variable `chrootDir` to the path "./chrootDir", which will be used as the temporary directory for the chroot environment.

3. Prompt user for input and output paths.

4. Set the default output path if not specified by the user.

5. Create temporary directories for mount and chroot.

6. Mount the input ISO file to the "isomount" directory.

7. Extract the ISO contents to the chroot directory using `unsquashfs`.

8. Bind-mount necessary directories to provide network connectivity inside the chroot environment.

9. Mount the input ISO file to a temporary directory.

10. Chroot into the environment and execute commands. The area for commands has been left commented, and the indentation is exclusively for aesthetics and readability. The user will need to modify this section, for their purposes.

11. Exit the chroot environment and unmount the bind-mounted directories.

12. Repack the updated chroot directory into a new squashfs file.

13. Create the new ISO image using `xorriso`.

14. Cleanup temporary directories by unmounting and removing them.

> Please note that this script includes commands that require superuser (root) privileges, as indicated by the use of `sudo`. Ensure that you have the necessary permissions to execute these commands or adjust the script accordingly.

## Prerequisites
The requirements for running this bash script include:
- `Bash`: The script is written in Bash, so you need to have Bash installed on your system.
- `squashfs-tools`: The script utilizes the unsquashfs command from the squashfs-tools package. Make sure you have this package installed.
- `xorriso`: The script uses xorriso command to create the new ISO image. Ensure that you have xorriso installed.

Input ISO file: You need to provide the path to the input ISO file when prompted by the script.

These are the basic requirements for running the script. It's also essential to ensure that your system meets any additional dependencies or prerequisites specific to the operations you want to perform within the chroot environment.

## [Disclaimer](DISCLAIMER)
**This software is provided "as is" and without warranty of any kind**, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

**The authors do not endorse or support any harmful or malicious activities** that may be carried out with the software. It is the user's responsibility to ensure that their use of the software complies with all applicable laws and regulations.

## License

These files released under the [MIT License](LICENSE).
