#!/bin/bash
# Hecho por Yordis Cujar
# Version 1


tmp_dir=/tmp/dis
########################################################
##  Variables definidas del Diestro
########################################################

installdeb='slapt-get --install'
desinstalldeb='slapt-get --remove '
updatedeb='slapt-get --update'
upgradedeb='slapt-get --upgrade'
autoremovedeb='slapt-get --autoclean'
reparardeb='slackpkg repair --all'
unpackdeb='slackpkg install'

###########################################################
##  Variables DEFINIBLES del sistema nombre
############################################################
#User=$(getent passwd 1000 | awk -F: '{ print $1}')
user=$USER
install=$installdeb
desinstall=$desinstalldeb
update=$updatedeb
upgrade=$upgradedeb
autoremove=$autoremovedeb
reparar=$reparardeb
unpack=$unpackdeb
###############Definibles de programas#########################



########################################################
#################   MENUS DE INSTALACION   #############
########################################################


	cmdslack=(dialog --title "Slackware" --separate-output --checklist "ESPACIO para seleccionar/ENTER para continuar" 22 80 16)

	slackmenu=(
			0_basic "	Basicos Obligatorios" off
		#B "<----Category: Alternate Installers---->" on
			1_installer "	Flatpak" off
			2_installer "	PIP" off
		#C "<----Category: Text Editors---->" on
			1_editor "	Nano" off
			2_editor "	Vim" off
			3_editor "	Paquete Nano / nVim" off
		#E "<----Category: Terminal Customization---->" on
			1_customize "	Bash" off
			2_customize "	Zsh" off
			3_customize_U "	Oh my Zsh" off
			4_customize "	Paquete Terminal" off
		#J "<----Category: Fonts---->" on
			1_font "	Microsoft fonts" off
			2_font_U "	NerdFonts" off
		#K "<----Category: Media Viewing/Editing/Converting---->" on
			1_media "	VLC" off
		#N "<----Category: File Explorer---->" on
			1_files "	Paquete Hogar" off
			2_files "	BalenaEtcher" off
			3_files "	XAMPP" off
		#Ñ "<----Category: Desktop Customization---->" on
			1_desktop_U "	QT matches GTK" off
			2_desktop "	Paquete i3" off
			3_desktop "	Paquete Bspwm" off
		#O "<----Category: Themes/Icons Customization---->" on
			1_themes_U "	Wallpapers" off
			2_themes_U "	Infinity/Candy/Gruvbox Themes" off
		#P "<----Category: System---->" on
			1_system_U "	Swappiness=10" off
			V "Post Install Auto Clean Up & Update" off)


########################################################
#################   NOMBRE DE FUNCIONES    #############
########################################################


#installflatpak
#installpip
#installnano
#installvim
#installnvim
#installvscode
#installbash
#installzsh
#installohmyzsh
#installpackterminal
#installmsfonts
#installnerdfonts
#installvlc
#installpcloud
#installpackhome
#installgtk
#installbspwm
#installwmdependence
#installpolybar
#installwallpapers
#installinfinitythemes
#installxampp
#limpiar


########################################################
#################       FUNCIONES          #############
########################################################

function update()

{
	echo "Updating"
	sudo $update

}


function installflatpak()

{
			echo "#----------------------------Instalando Flatpak----------------------------#"
			sleep 1s
			sudo $install flatpak flatpak-builder flatpak-tools
			echo "#----------------------------Instalado Flatpak----------------------------#"
			sleep 2s

}

function installpip()

{
			echo "#----------------------------Instalando PIP----------------------------#"
			sleep 1s
			sudo $install python-pip
			echo "#----------------------------Instalado PIP----------------------------#"
			sleep 1s

}

function installnano()

{
			echo "#----------------------------Instalando Nano----------------------------#"
			sleep 1s
			sudo $install nano nano-syntax-highlighting
			cp -rf $usuario/dotfiles/.nanorc $usuario &&
			sudo chmod -R 775 $usuario/.nanorc
			sudo chown -R $nombre:$nombre $usuario/.nanorc
			echo "#----------------------------Instalado Nano----------------------------#"
			sleep 2s

}

function installvim()

{
			echo "#----------------------------Instalando Vim----------------------------#"
			sleep 1s
			sudo $install vim
			echo "#----------------------------Instalado Vim----------------------------#"
			sleep 2s

}


function installnvim()

{
			echo "#----------------------------Instalando NVim personalizado-----------------------------#"
			sleep 1s
			sudo $install curl xterm ranger fzf rxvt-unicode neovim python-pip powerline-status tmux python3-neovim &&
			pip3 install pipenv
			#Install jupyter (requiere PIP)
			sudo pip install jupyter
			wget -P $usuario/.local/share/nvim/site/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			wget -P $usuario/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			cd $usuario
			sudo mkdir -m 755 $usuario/.nvm
			sudo mkdir -m 755 $usuario/.local/share/nvim/site/autoload/
			sudo mkdir -m 755 $usuario/.vim/autoload/
			git clone https://github.com/nvm-sh/nvm.git $usuario/.nvm
			cd $usuario
			sudo $install npm &&
			sudo npm install --global yarn &&
			sudo npm install -g n latest
			sudo npm install -g npm@latest
			# Locally in your project.
			#sudo npm install -D typescript
			#sudo npm install -D ts-node
			#sudo npm install -D tslib @types/node
			# Or globally with TypeScript.
			sudo npm install -g live-server
			sudo npm install -g typescript
			sudo npm install -g ts-node
			sudo npm install -g tslib @types/node
			sudo npm install -g neovim
			#Install Rust
			#curl https://sh.rustup.rs -sSf | sh
			#Copy Config
			cd $tmp_dir
			git clone https://github.com/yordisc/Vimconfig.git
			sudo chown -R $nombre:$nombre Vimconfig/
			sudo rm -r $usuario/.vim
			#chmod -R 775 $usuario/.vim
			sudo cp Vimconfig/* $usuario
			sudo chown -R 775 $usuario/.vim
			sudo chown -R 775 $usuario/.config/coc
			sudo chown -R 775 $usuario/.config/samnvim
			sudo chown -R 775 $usuario/.config/github-copilot
			sudo chmod -R 775 $usuario/.vim/maps.vim
			sudo chmod -R 775 $usuario/.vim/plugins.vim
			sudo chmod -R 775 $usuario/.vim/pluginsconfig.vim
			sudo chmod -R 775 $usuario/.vimrc
			cd $usuario
			#Open IA key api
			touch .open_ai
			echo '### KEY API OPEN-IA ### export OPENAI_API_KEY=""' >> example.sh
			sudo chown -R 775 $usuario/.config/.open_ai
			cd $usuario
			echo "#----------------------------Instalado NVim personalizado-----------------------------#"
			sleep 2s

}

function installbash()

{
			echo "#----------------------------Instalando Bash----------------------------#"
			sleep 1s
			sudo $install bash-completion fzf
			cd $usuario
			cp -rf $usuario/dotfiles/.bashrc $usuario
			sudo chmod -R 775 .bashrc
			sudo chown -R $nombre:$nombre .bashrc
			echo "#----------------------------Instalado Bash----------------------------#"
			sleep 2s

}

function installzsh()

{
			echo "#----------------------------Instalando Zsh----------------------------#"
			sleep 1s
			sudo $install zsh powerline-status zsh-completions zsh-syntax-highlighting
			sudo usermod -s /usr/bin/zsh $(whoami)
			# clone
			git clone https://github.com/powerline/fonts.git --depth=1
			# install
			cd fonts
			./install.sh
			# clean-up a bit
			cd ..
			rm -rf fonts
			fc-cache -vf
			echo "#----------------------------Instalado Zsh----------------------------#"
			sleep 2s

}

function installohmyzsh()

{
echo "#----------------------------Instalando Oh my Zsh----------------------------#"
			sleep 1s
			rm -rf $usuario/.oh-my-zsh
			git clone https://github.com/ohmyzsh/ohmyzsh.git $usuario/.oh-my-zsh
			git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$usuario/.oh-my-zsh/custom}/themes/powerlevel10k &&
			git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$usuario/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
			git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$usuario/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
			sudo git clone https://github.com/kutsan/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$usuario/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting &&
			sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting			
			cp -rf $usuario/dotfiles/.zshrc $usuario
			sudo chmod -R 775 .zshrc
			sudo chown -R $nombre:$nombre .zshrc
			cp -rf $usuario/dotfiles/.p10k.zsh $usuario
			sudo chmod -R 775 .p10k.zsh
			sudo chown -R $nombre:$nombre .p10k.zsh
			cp -rf $usuario/dotfiles/.p10k-portable.zsh $usuario
			sudo chmod -R 775 .p10k-portable.zsh
			sudo chown -R $nombre:$nombre .p10k-portable.zsh
			zsh
			chsh -s $(which zsh)
			touch $usuario/Abrir
			echo "
chsh -s $(which zsh) && # Cambiar de Bash a Zsh" >> $usuario/Abrir
			#
			zsh
			chsh -s $(which zsh) &  y # Cambiar de Bash a Zsh
			echo "#--------------------------------Oh my ZSH habilitado--------------------------------#"
			sleep 2s

}

function installpackterminal()

{
			echo "#----------------------------Instalando Pack Personal Terminal----------------------------#"
			sleep 1s
			sudo $install jq curl cmake terminator pcmanfm htop feh neofetch ncmpcpp cmatrix nmap httpie ranger mc googler youtube-dl lynx powerline-status calc w3m ueberzug gcal lolcat Sl fzf p7zip  unrar
			curl -sS https://webi.sh/lsd | sh
			#chsh -s $(which zsh)
			mkdir -p $usuario/.config/terminator/plugins
			#Ranger
			sudo mkdir -m 755 $usuario/.config/ranger
			sudo chown -R 755 $usuario/.config/ranger
			sudo chown -R $nombre:$nombre $usuario/.config/ranger
			cp -rf $usuario/dotfiles/personalconfig/ranger $usuario/.config/ranger
			wget https://git.io/v5Zwz -O $usuario"/.config/terminator/plugins/terminator-themes.py"
### Youtube por terminal
			cd $tmp_dir
			git clone https://github.com/pystardust/ytfzf
			cd ytfzf
			sudo make install
			cd $usuario
			mkdir -p ~/.config/ytfzf
			echo "cache_dir="$usuario/.cache/ytfzf"
history_file="$YTFZF_CACHE/ytfzf_hst"
current_file="$YTFZF_CACHE/ytfzf_cur"
thumb_dir="$YTFZF_CACHE/thumb"
YTFZF_HIST=1
YTFZF_LOOP=0
video_pref="360p"
YTFZF_ENABLE_FZF_DEFAULT_OPTS=1
YTFZF_PLAYER="mpv"
thumbnail_viewer="chafa-16"
show_thumbnails="1"">> ~/.config/ytfzf/conf.sh
### traductor
cd ~
git clone https://github.com/soimort/translate-shell
cd translate-shell
make
sudo make install
cd ~
rm -r translate-shell
cd ~
####
			echo "#----------------------------Instalado Pack Personal Terminal------------------------------#"
			sleep 2s

}

function installmsfonts()

{
			echo "#----------------------------Instalando Microsoft fonts----------------------------#"
			sleep 1s
			cd $tmp_dir
			wget https://gist.github.com/maxwelleite/10774746/raw/ttf-vista-fonts-installer.sh -q -O - | sudo bash
			wget https://gist.githubusercontent.com/maxwelleite/913b6775e4e408daa904566eb375b090/raw/cbfd8eb70184fa509fcab37dad7905676c93d587/ttf-ms-tahoma-installer.sh -q -O - | sudo bash
			sudo mkdir -p /usr/share/fonts/truetype/msttcorefonts/ &&
			cd /usr/share/fonts/truetype/msttcorefonts/ &&
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeui.ttf?raw=true -O segoeui.ttf &&# regular
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuib.ttf && # bold
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuii.ttf && # italic
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuiz.ttf?raw=true -O segoeuiz.ttf && # bold italic
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuil.ttf?raw=true -O segoeuil.ttf && # light
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguili.ttf?raw=true -O seguili.ttf && # light italic
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuisl.ttf?raw=true -O segoeuisl.ttf && # semilight
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisli.ttf?raw=true -O seguisli.ttf && # semilight italic
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisb.ttf?raw=true -O seguisb.ttf && # semibold
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisbi.ttf?raw=true -O seguisbi.ttf && # semibold italic
fc-cache -f /usr/share/fonts/truetype/msttcorefonts/ &&
			cd $usuario
			echo "#----------------------------Instalado Microsoft fonts----------------------------#"
			sleep 2s

}

function installnerdfonts()

{
##----------------------------------#
##----Version NerdFonts DEFINIBLE---##
##----------------------------------#
nerdfontsversion='v2.2.2'
			echo "#------------------------Instalar fuentes NerdFonts-------------------------#"
			sleep 1s
			cd $tmp_dir
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Ubuntu.zip
			unzip Ubuntu.zip
			rm Ubuntu.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/ubuntu
			sudo mv *.ttf /usr/share/fonts/nerd-fonts/ubuntu
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Inconsolata.zip
			unzip Inconsolata.zip
			rm Inconsolata.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/inconsolata
			sudo mv Inconsolata* /usr/share/fonts/nerd-fonts/inconsolata
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/IBMPlexMono.zip
			unzip IBMPlexMono.zip
			rm IBMPlexMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/IBM-Plex-Mono
			sudo mv Blex* /usr/share/fonts/nerd-fonts/IBM-Plex-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/BitstreamVeraSansMono.zip &&
			unzip BitstreamVeraSansMono.zip
			rm BitstreamVeraSansMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Bit-stream-Vera-Sans-Mono
			sudo mv Bit* /usr/share/fonts/nerd-fonts/Bit-stream-Vera-Sans-Mono
			rm LICENSE*
			rm readme*
			cd $tmp_dir
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Meslo.zip
			wget -P $tmp_dir https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
			wget -P $tmp_dir https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
			wget -P $tmp_dir https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
			wget -P $tmp_dir https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
			unzip Meslo.zip
			rm Meslo.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Meslo
			sudo mv Meslo* /usr/share/fonts/nerd-fonts/Meslo
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/FantasqueSansMono.zip
			unzip FantasqueSansMono.zip
			rm FantasqueSansMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Fantasque-Vera-Sans-Mono
			sudo mv Fantasque* /usr/share/fonts/nerd-fonts/Fantasque-Vera-Sans-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/FiraCode.zip
			unzip FiraCode.zip
			rm FiraCode.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/FiraCode
			sudo mv Fira* /usr/share/fonts/nerd-fonts/FiraCode
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/DejaVuSansMono.zip
			unzip DejaVuSansMono.zip
			rm DejaVuSansMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/DejaVu-Sans-Mono
			sudo mv DejaVu* /usr/share/fonts/nerd-fonts/DejaVu-Sans-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/DroidSansMono.zip
			unzip DroidSansMono.zip
			rm DroidSansMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Droid-Sans-Mono
			sudo mv Droid* /usr/share/fonts/nerd-fonts/Droid-Sans-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Hack.zip
			unzip Hack.zip
			rm Hack.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Hack
			sudo mv Hack* /usr/share/fonts/nerd-fonts/Hack
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/LiberationMono.zip
			unzip LiberationMono.zip
			rm LiberationMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Liberation-Mono
			sudo mv Literation* /usr/share/fonts/nerd-fonts/Liberation-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/JetBrainsMono.zip
			unzip JetBrainsMono.zip
			rm JetBrainsMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/JetBrainsMono
			sudo mv JetBrains* /usr/share/fonts/nerd-fonts/JetBrainsMono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Iosevka.zip
			unzip Iosevka.zip
			rm Iosevka.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Iosevka
			sudo mv Iose* /usr/share/fonts/nerd-fonts/Iosevka
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Noto.zip
			unzip Noto.zip
			rm Noto.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/noto
			sudo mv Noto* /usr/share/fonts/nerd-fonts/noto
			rm LICENSE*
			rm readme*
			fc-cache -f -v
			cd $usuario
			echo "#--------------------------------NerdFonts Instaladas--------------------------------#"
			sleep 2s
echo "#------------------------Instalar fuentes Sistema-------------------------#"
			sleep 1s
			cd $tmp_dir
			#Scientifica
			wget https://github.com/NerdyPepper/scientifica/releases/download/v2.3/scientifica.tar
			tar xf scientifica-v1.2.tar.gz
			# ttfs are recommended
			sudo mv ttf/* /usr/share/fonts/
			# but you may install the otbs if you want to
			sudo mv otb/* /usr/share/fonts
			# bdfs are not recommended
			sudo mv bdf/* /usr/share/fonts
			rm scienti*
			#Archcraft
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/archcraft.ttf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv archcraft.ttf /usr/share/fonts/icon-fonts/
			#Google mdi
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/google-mdi.ttf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv google-mdi.ttf /usr/share/fonts/icon-fonts/
			#Icomoon
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/Icomoon-Feather.ttf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv Icomoon-Feather.ttf /usr/share/fonts/icon-fonts/
			#MaterialIcons
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/MaterialIconsOutlined-Regular.otf
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/MaterialIconsRound-Regular.otf
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/MaterialIconsTwoTone-Regular.otf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv MaterialIcons* /usr/share/fonts/icon-fonts/
			#Siji
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/Siji.bdf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv Siji.bdf /usr/share/fonts/icon-fonts/
			#Typecons
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/typicons.ttf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv typicons.ttf /usr/share/fonts/icon-fonts/
			#Waffle
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/Waffle.bdf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv Waffle.bdf /usr/share/fonts/icon-fonts/
			#Typewrite
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/normal-fonts/Typewriter.ttf
			sudo mkdir -p /usr/share/fonts/normal-fonts/
			sudo mv Typewriter.ttf /usr/share/fonts/normal-fonts/
			#Confortaa
			wget https://www.wfonts.com/download/data/2016/02/15/comfortaa/comfortaa.zip
			unzip comfortaa
			sudo mkdir -p /usr/share/fonts/normal-fonts/Comfortaa
			sudo mv Comfortaa* /usr/share/fonts/normal-fonts/Comfortaa/
#https://github.com/oblador/react-native-vector-icons/tree/master/Fonts
						#FontAwesome
			wget https://github.com/oblador/react-native-vector-icons/blob/master/Fonts/FontAwesome.ttf
			sudo mkdir -p /usr/share/fonts/normal-fonts/
			sudo mv FontAwesome.ttf /usr/share/fonts/normal-fonts/
									#Feather
			wget https://github.com/oblador/react-native-vector-icons/blob/master/Fonts/Feather.ttf
			sudo mkdir -p /usr/share/fonts/normal-fonts/
			sudo mv Feather.ttf /usr/share/fonts/normal-fonts/
			rm Comfortaa*
			rm sharefonts*
			cd $usuario
			echo "#--------------------------------Fuentes de Sistema Instaladas--------------------------------#"
			sleep 2s

}

function installvlc()

{
			echo "#--------------------------------Instalando VLC--------------------------------#"
			sleep 1s
			sudo $install vlc vlsub
			echo "#--------------------------------Instalado VLC--------------------------------#"
			sleep 2s

}

function installpackhome()

{
			echo "#--------------------------------Instalando Paquete Hogar--------------------------------#"
			sleep 1s
			sudo $install pcmanfm alien bleachbit perl aspell catfish peek galculator gparted mousepad feh mpv putty ristretto hplip simple-scan smartmontools tlp yad firewalld
			echo "#--------------------------------Instalado Paquete Hogar--------------------------------#"
			sleep 2s

}

function installgtk()

{
			echo "#--------------------------------Make QT match GTK Themes--------------------------------#"
			sleep 1s
			sudo chown $nombre /etc/environment
			sudo chmod -R 755 /etc/environment
			sudo echo "QT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment
			sudo chown root:root /etc/environment
			sudo chmod -R 600 /etc/environment
			echo "#--------------------------------Instalado QT/GTK--------------------------------#"
			sleep 2s

}

function installbspwm()

{
echo "#-----------------------------Habilitar BSPWM---------------------------------#"
			sleep 1s
			installwmdependence
			### BSPWM
			sudo $install bspwm sxhkd rofi dmenu polybar
			### bspwm config
			sudo chown 777 $usuario/dotfiles/bspwm/
			cp -rf $usuario/dotfiles/bspwm/.config/* $usuario/.config
			installpolybar
			sudo chown -R $nombre:$nombre ~/.config/bspwm
			sudo chown -R $nombre:$nombre ~/.config/networkmanager-dmenu
			sudo chown -R $nombre:$nombre ~/.config/rofi
			sudo chown -R $nombre:$nombre ~/.config/sxhkd
			installgtk
			echo "#-----------------------------BSPWM habilitado--------------------------------#"
			sleep 2s

}

function installwmdependence()

{
echo "#----------------------------Instalando dependencias de Gestión de ventanas-----------------------------#"
			sleep 1s
			### Dependencias
			sudo $desinstall pipewire-pulse
			sudo $install gtk2 gtk3 zstd xterm terminator rxvt-unicode inxi dunst cava maim bmon nitrogen ffmpegthumbnailer toilet xbacklight gpick light xsettingsd parcellite pcmanfm lxappearance fzf viewnior zenity arandr polkit-gnome xfce4-screenshooter pulseaudio pavucontrol
			### Agregar Dotfiles
			sudo cp -rf $usuario/dotfiles/personalconfig/.Xresources.d $usuario
			sudo chmod -R 775 $usuario/Xresources.d
			sudo chown -R $nombre:$nombre $usuario/Xresources.d
			cp -rf $usuario/dotfiles/personalconfig/.Xresources $usuario
			sudo chown 775 $usuario/Xresources
			sudo chown -R $nombre:$nombre $usuario/Xresources
			sudo cp -rf $usuario/dotfiles/personalconfig/.xsettingsd $usuario
			sudo chmod -R 775 $usuario/.xsettingsd
			sudo chown -R $nombre:$nombre $usuario/.xsettingsd
			sudo cp -rf $usuario/dotfiles/personalconfig/.gtkrc-2.0 $usuario
			sudo chmod -R 775 $usuario/.gtkrc-2.0
			sudo chown -R $nombre:$nombre $usuario/.gtkrc-2.0
			sudo cp -rf $usuario/dotfiles/personalconfig/.hidden $usuario
			sudo chmod -R 775 $usuario/.hidden
			sudo chown -R $nombre:$nombre $usuario/.hidden
			sudo cp -rf $usuario/dotfiles/personalconfig/.dmrc $usuario
			sudo chmod -R 775 $usuario/.dmrc
			sudo chown $nombre:$nombre $usuario/.dmrc
			sudo cp -rf $usuario/dotfiles/personalconfig/.fehbg $usuario
			sudo chmod -R 775 $usuario/.fehbg
			sudo chown -R $nombre:$nombre $usuario/.fehbg
			sudo chown 775 $usuario/.config
			sudo chown -R $nombre:$nombre $usuario/.config
			### Fonts
			cd $tmp_dir
			wget https://github.com/archcraft-os/packages/raw/main/x86_64/archcraft-fonts-1.0-3-any.pkg.tar.zst
			tar -xf archcraft-fonts-1.0-3-any.pkg.tar.zst
			sudo cp -r usr /
			### Configurar servicios
			cd $tmp_dir
			sudo systemctl disable mpd
			sudo systemctl disable bluetooth
			sudo systemctl enable NetworkManager
			sudo systemctl start NetworkManager
			### Extras
			#installi3lock
			#installpicom
			installwallpapers
			### Fuentes
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Hack.zip
			unzip Hack.zip
			rm Hack.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Hack
			sudo mv Hack* /usr/share/fonts/nerd-fonts/Hack
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/LiberationMono.zip
			unzip LiberationMono.zip
			rm LiberationMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Liberation-Mono
			sudo mv Literation* /usr/share/fonts/nerd-fonts/Liberation-Mono
			rm LICENSE*
			rm readme*
			###
			cd $usuario
			bash $usuario/.config/bspwm/polybar/configbspwm.sh
			echo "#----------------------------Base de dependencias de Gestión de ventanas instaladas------------------------------#"
			sleep 2s

}

function installpolybar()

{
			echo "#---------Agregando Polybar---------#"
			mkdir $tmp_dir/polybar
			git clone https://github.com/yordisc/polybar $tmp_dir/polybar
			### Polybar
			sudo mkdir -m 755 $usuario/.config/polybar
			sudo cp -r $tmp_dir/polybar/* $usuario/.config/polybar
			sudo chown 755 $usuario/.config/polybar
			sudo chown -R $nombre:$nombre $usuario/.config/polybar
			echo "#---------------------Polybar agregados-------------------#"
			sleep 3s
			clear

}

function installwallpapers()

{
			echo "#---------Agregando Wallpapers---------#"
			mkdir $tmp_dir/backgrounds
			git clone https://github.com/yordisc/Wallpapers $tmp_dir/backgrounds
			sudo cp -r $tmp_dir/backgrounds/* /usr/share/backgrounds
			### nitrogen
			echo "
dirs=/usr/share/backgrounds;
" >> $usuario/.config/nitrogen/nitrogen.cfg
			### Feh
			echo "
feh --no-fehbg --bg-fill '/usr/share/backgrounds/gruvbox.png'
" >> $usuario/.fehbg
			echo "#---------------------Wallpapers agregados-------------------#"
			sleep 3s
			clear

}

function installinfinitythemes()

{
			echo "Installing Infinity themes"
#Infinity Icons themes
			cd $tmp_dir
			wget https://codeload.github.com/L4ki/Infinity-Plasma-Themes/zip/refs/heads/main
			unzip main
			cd $tmp_dir/Infinity-Plasma-Themes-main/Infinity-Icons
			sudo mv -v Infinity* /usr/share/icons
			cd $tmp_dir/Infinity-Plasma-Themes-main/Infinity-Plasma-Themes
			sudo mv -v Infinity* /usr/share/themes
			cd $tmp_dir
			rm Infinity-Plasma-Themes*
			echo "Installing Candy themes"
#Candy Icons themes
			sudo mkdir /usr/share/icons/candy-icons
			cd $tmp_dir
			wget https://codeload.github.com/EliverLara/candy-icons/zip/refs/heads/master
			unzip master
			sudo mv candy-icons-master/* /usr/share/icons/candy-icons
			rm master*
			rm candy*
			cd $usuario
			echo "Installing Gruvbox themes"
#Gruvbox themes
			wget -P $tmp_dir https://codeload.github.com/TheGreatMcPain/gruvbox-material-gtk/zip/refs/heads/master
			cd $tmp_dir
			unzip master
			rm master
			cd $tmp_dir/gruvbox-material-gtk-master/icons
			sudo mv Gruvbox* /usr/share/icons
			cd $tmp_dir/gruvbox-material-gtk-master/themes
			sudo mv Gruvbox* /usr/share/themes
			cd $tmp_dir
			rm gruvbox*
			sleep 2s

}


function installxampp()

{
#Desistalar XAMPP
			sudo /opt/lampp/lampp stop
			sudo /opt/lampp/uninstall
			sudo rm -rf /opt/lampp
#Instalar XAMPP
xamppversion='8.1.2'
			cd $tmp_dir
			echo "Installing XAMPP"
			wget -O xampp.run https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/$xamppversion/xampp-linux-x64-$xamppversion-0-installer.run
			sudo chmod -R 755 $tmp_dir/xampp.run
			sudo $tmp_dir/xampp.run  > /dev/null
			### Lanzador
			sudo rm -rf /usr/share/applications/xampp-control-panel.desktop
			sudo touch /usr/share/applications/xampp-control-panel.desktop
			sudo chmod -R 755 /usr/share/applications/xampp-control-panel.desktop
			sudo chown -R $nombre:$nombre /usr/share/applications/xampp-control-panel.desktop
			echo "Name=XAMPP Control Panel
GenericName=XAMPP Control Panel
Comment=Start and Stop XAMPP
Exec=/opt/lampp/manager-linux-x64.run
Encoding=UTF-8
Terminal=true
Icon=/opt/lampp/htdocs/favicon.ico
Type=Application
Categories=Development;
Comment=Start and Stop XAMPP
StartupNotify=true">> /usr/share/applications/xampp-control-panel.desktop
####reparar permisos
			#sudo chmod 755 /opt/lampp
			#sudo chown -R $USER /opt/lampp
			#sudo chown -R nobody:nogroup /opt/lampp/htdocs
			#sudo chmod -R 777 /opt/lampp/
			#sudo chmod 644 /opt/lampp/etc/my.cnf
			#sudo chown -R mysql:mysql /opt/lampp/var/mysql
			#####
# Permisos de xampp
			sudo groupadd xamppusers
			sudo usermod -a -G xamppusers $USER
			cd /opt/lampp
			sudo chown root.xamppusers htdocs
			sudo chmod -R 777 htdocs
			groupadd gitusers
			usermod -a -G gitusers $USER
			cd /opt/lampp
			chown root.gitusers htdocs
# Permisos de Servidor
			sudo groupadd ftp
			usermod -a -G xamppusers $USER
			cd /opt/lampp
			sudo chown root.ftp htdocs
			sudo chmod -R 777 htdocs
# Config
			sudo /usr/sbin/setenforce 0
			sudo mkdir /opt/lampp/phpmyadmin/tmp/
			sudo chmod 777 -R /opt/lampp/phpmyadmin/tmp/
			sudo chown -R mysql:mysql /tmp/user/0/
# firewall
			sudo ufw allow 3306/tcp
			sudo ufw allow mysql
		### Arreglo
cd /opt/lampp/phpmyadmin/
sudo sed -i "29s/\/\/ //" config.inc.php
sudo sed -i "30s/\/\/ //" config.inc.php
sudo sed -i "32s/\/\/ //" config.inc.php
sudo sed -i "43s/\/\/ //" config.inc.php
sudo sed -i "28s/config/cookie/g" config.inc.php
sudo sed -i "32s/localhost/127.0.0.1:3306/g" config.inc.php
sudo sed -i "43s/pma//g" config.inc.php
cd ~
			#### Wordpress ####
						echo Instalar wordpress
			sudo rm -rf /tmp/dis/latest*
			sudo rm -rf /opt/lampp/htdocs/wordpress
			cd /tmp/dis
			wget https://wordpress.org/latest.zip
			sudo unzip -d /opt/lampp/htdocs ./latest.zip
			# Permisos de Servidor
			sudo groupadd ftp
			usermod -a -G xamppusers $USER
			cd /opt/lampp
			sudo chown root.ftp htdocs
			sudo chmod -R 777 htdocs
			#sudo echo "define( 'FS_METHOD','direct');" >> /opt/lampp/htdocs/wordpress/wp-config.php
			cd $usuario
			echo "#---------------------XAMPP Instalado-------------------#"
			sudo /opt/lampp/lampp start
}

function limpiar()

{
			#Cleanup
			echo "Cleaning up"
			sudo $update
			sudo $autoremove
			sudo $upgrade
			sudo $autoremove
			sudo $reparar
			rm -rf $tmp_dir

}


########################################################
#################     Start script        ##############
########################################################


# cp /etc/apt/sources.list /etc/apt/sources.list.original

function chiguire()

{
		clear
			echo -e "\033[33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@%#++*###*=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@#***++=-===+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@=-=-+*++++*+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@%*++-+*+**+**+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@#=++#*+++=+++**%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@*====--:-=++*####%%@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@=   :=++*****+**####%%%%%@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@#::-=++****+=+++*###########%@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@*-==+++**++++++++*********#####%%@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@*=++++++++++++++******************%@@@@@@@"
			echo -e "\033[33m@@@@@@@@@+++**+===++++=++****#***********++%@@@@@@"
			echo -e "\033[33m@@@@@@@@@#=++**=-+====+****************++*+=#@@@@@"
			echo -e "\033[33m@@@@@@@@@@#=+++==---:-=+++***+*++*++***+**+==@@@@@"
			echo -e "\033[33m@@@@@@@@@@@*--.-==: .-=-==++++++++**+*****+==%@@@@"
			echo -e "\033[33m@@@@@@@@@@@@+:.:-==:..:--======*++**+**++*+==%@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@=.:-=-%%-...::::-+**++*+++=++==-#@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@*::=-=@@@%*=:..:=+++++=++==+==-:#@@@@"
			echo -e "\033[33m@@@@@@@@@%%*==.-=--+***+*+:  :-=--=:----:::.-@@@@@"
			echo -e "\033[33m@@@@@@@@%%*++--=----+====-:... ..::::---==+*@@@@@@"
			echo -e "\033[33m@@@@@@@@@@@@%%##**####%%%##****##%%%@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			sleep 2s
		clear
}

		clear
		echo " "
			echo -e "\033[4mhttps://github.com/yordisc/"
			sleep 2s
		clear
		chiguire
			sleep 2s
		clear

dialog --title "https://github.com/yordisc/slack-dotfiles" \
       --msgbox "En este dotfiles se encuentra mi configuración personal." 0 0 


		clear
#nombre="admin"
nombre=$(dialog --title "Escribe el nombre del usuario" \
		--stdout \
		--inputbox "Nombre" 0 0)

usuario=/home/$nombre

if [[ $EUID -ne 0 ]]; then
	echo "Este script funciona tipeando: sudo bash ./dotfiles.sh"
	1s
else


	echo "Creating temporary folder"
	rm -rf /tmp/dis
	mkdir -m 755 $tmp_dir

diestro=$(dialog --title "Elige el tipo de paquete: slack" \
		--stdout \
		--inputbox "Diestro" 0 0)

	slack=$("${cmdslack[@]}" "${slackmenu[@]}" 2>&1 >/dev/tty)

function slack()

{
choices=$slack

}

	inicio dialog
		$diestro
		sudo chown -R $nombre:$nombre $usuario
		clear
		for choice in $choices
		do
			case $choice in




# Section A -----------------------INSTALADORES----------------------------

		0_basic)
		#Update and Upgrade	
		LANG=es_ES slapt-get
		echo "Updating"
		sudo $update
		sudo $reparar
		sudo $autoremove
			;;

# Section B ---------------------Alternate Installers----------------------------

		1_installer)
			installflatpak
			;;

		2_installer)
			installpip
			;;

# Section C ------------------------Text Editors------------------------------

		1_editor)
			installnano
			;;

		2_editor)
			installvim
			;;

		3_editor)
			installnvim
			cd $usuario
			;;

# Section E -------------------------Terminal Customization--------------------------

		1_customize)
			installbash
			;;

		2_customize)
			installzsh
			sudo $install zsh-doc zsh-static fzf zplug zsh-autosuggestions thefuck
			;;

		3_customize_U)
			installohmyzsh
			;;

		4_customize)
			installpackterminal
			sudo $install zsh-common fake piu-piu ncat ytfzf pup tty-clock links2 powerline-gitstatus lr zplug p7zip-full
			;;

# Section J -------------------------------------Fonts------------------------------------------------

		1_font)
			installmsfonts
			;;

		2_font_U)
			installnerdfonts
			;;

# Section K --------------------------Media Viewing/Editing/Converting---------------------------------

		1_media)
			installvlc
			;;

# Section N -----------------------------------File Explorers-----------------------------------------------

		1_files)
			installpackhome
			sudo $install telegram exfat-utils
			;;

		2_files)
			curl -1sLf \
   'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
   | sudo -E bash
            sudo $update
            sudo $install balena-etcher-electron
            sudo $install git p7zip-full python3-pip python3-wxgtk4.0
sudo pip3 install WoeUSB-ng
			;;

		3_files)
			installxampp
			;;

# Section Ñ ----------------------------------Desktop Customization---------------------------------------------


		1_desktop_U)
			installgtk
			;;

		2_desktop)
			installi3
			sudo $install i3 i3-gaps i3minator i3status i3block i3-py dmenu suckless-tools
			;;

		3_desktop)
			sudo $install xfce4-clipman mpd nm-tray light suckless-tools network-manager network-manager network-manager-openvpn lxappearance feh policykit-1-gnome pulseaudio pulseaudio-utils pulseaudio-equalizer gstreamer1.0-pulseaudio toilet
			installbspwm
			;;

# Section O ---------------------Themes personal----------------------------

		1_themes_U)
			installwallpapers
			;;

		2_themes_U)
			installinfinitythemes
			;;

# Section P ---------------------System----------------------------

		V)
			limpiar
			;;

		1_system_U)
			swappiness10
			;;


		esac
	done
fi



# Hecho por Yordis Cujar
