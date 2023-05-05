# iSOnject
This bash script performs operations related to modifying and repackaging an ISO image file. Absent user customization, iSOnject requires no user interaction beyond the prompts for paths to the input and output ISOs.

Inspired by [yawp](https://github.com/apple-fritter/yawp) and [yawp_2](https://github.com/apple-fritter/yawp_2).

## Step-by-step breakdown of the script:

```
┌─ Start
│
├─ Set chrootDir
│
├─ Prompt user for input and output paths
│
├─ Check if output path is specified
│  │
│  ├─ Set default output path
│
├─ Create temporary directories for mount and chroot
│
├─ Mount ISO to isomount directory
│
├─ Extract ISO contents to chrootDir
│
├─ Bind mount necessary directories for chroot environment
│
├─ Mount ISO to temporary directory
│
├─ Chroot into the environment and execute commands
│
├─ Exit chroot environment and unmount bind mounts
│
├─ Repack the updated chroot directory into a new squashfs file
│
├─ Create the new ISO image
│
├─ Cleanup temporary directories
│
└─ End
```
> The commands section has been left commented, and indentation is solely for aesthetics and readability.

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
