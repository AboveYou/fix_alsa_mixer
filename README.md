# Audio Button Fix
This repo contains a small script, which fixes the volume control bug of the Lenovo 82Y8 Yoga Pro 7 14APH8 (Gen8) running Linux.

The bug is described [here](https://gist.github.com/then4p/d0579cde2fb7729eddfd28ff4a160930) and the fix [here](https://askubuntu.com/questions/1119938/audio-volume-doesnt-change/1204558#1204558).

Because the config have to be updated after every update the process is automated.
It was tested on Fedora 38 but can be generally applied with changes to the config path.

## Usage
You can run the script as it is after an update to fix the volume controls.
Note that root privileges are needed to edit the alsa-mixer config files.

```bash
sudo chmod u+x fix_alsa_mixer.sh
sudo ./fix_alsa_mixer.sh
```

## Automation
To run the script automated "without" root privileges you can set the SUID bit on the file. However this is only supported on executables so you need to cross-compile it into C code first to get a binary.

```bash
# adapt this to your package manager
sudo dnf install shc
shc -Sf fix_alsa_mixer.sh
```

Finally, change the owner and add the SUID bit to the executable.
```bash
sudo chown root:root fix_alsa_mixer.sh.x
sudo chmod 4701 fix_alsa_mixer.sh.x
```

You can now run the binary as your normal user! 