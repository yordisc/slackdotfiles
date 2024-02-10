<p align="center">
 
[//]: <> (site para ícones: https://shields.io/ )
 
<img alt="Maintained" src="https://img.shields.io/badge/Maintained%3F-Yes-green">
<ime alt="GitHub last commit" src="https://img.shields.io/github/last-commit/yordisc/slackdotfiles">
<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/yordisc/slackdotfiles">
<img alt="GitHub commit activity (branch)" src="https://img.shields.io/github/commit-activity/y/yordisc/slackdotfiles">

<hr>

#  :penguin: Dotfiles :place_of_worship:

![dotfiles01](https://raw.githubusercontent.com/yordisc/slackdotfiles/master/dotfilesimages/dotfiles.sh01.png)

Slackware is one of the most comfortable systems to use if you already have some practice in Linux. 
For a comfortable installation I recommend [Salix 64 bit](https://www.salixos.org/download.html) in its latest version since it comes installed with most of the things necessary for its use, this already includes a package manager and an alternative to synatic in slackware (gslapt).
Install the system in Full to avoid compatibility problems and fully update and install proprietary codecs.
Install slackpkg separately to use it as an installer.

[Slackbuilds](https://slackbuilds.org/)

Slackbuilds is one of the things that will allow compatibility with different important applications that other distributions have.

![dotfiles02](https://raw.githubusercontent.com/yordisc/slackdotfiles/master/dotfilesimages/dotfiles.sh02.png)
[sboui](https://github.com/montagdude/sboui) It is the most convenient installer for slackbulids that salix provides us, 
to install it it can be done from gslapt and start in the terminal using
```bash
sudo sboui
```
 to synchronize properly and install from "sudo sboui".
 
## You can install:

### Teamviewer:
from sboui

### Github desktop:
from sboui github-desktop

### vscode:
from sboui vscode-bin

## deb2tgz
Install deb2tgz on sboui to install .deb on slackware

```bash
sbopkg -B -i deb2tgz
```

### Google Chrome: from deb using deb2tgz https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

```bash
deb2tgz google-chrome-stable_current_amd64.deb
```

```bash
sudo /sbin/installpkg google-chrome-stable_current_amd64.txz
```

### packet tracer

```bash
curl -s https://raw.githubusercontent.com/marcelobaptista/packettracer/master/install_pt.sh | sudo bash

```

## Flatpack

### Skype
```bash
flatpak install flathub com.skype.Client
```
### Slack
```bash
flatpak install flathub com.slack.Slack
```
### Zoom
```bash
flatpak install flathub us.zoom.Zoom
```
### Telegram
```bash
flatpak install flathub org.telegram.desktop
```
### Teams: desde slackbuilds sboui
```bash
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux
```

## :loudspeaker: Pages of interest 
* [Install packeges automatically](https://medium.com/netdef/build-install-slackware-packages-automatically-b2986d2f86f9)

## :venezuela: Social Media 
* [Stackoverflow](https://stackoverflow.com/users/19875787/yordisc)
* [Reddit](https://www.reddit.com/user/yordiscujar)
* [Linkedin](https://www.linkedin.com/in/yordiscujar/)
