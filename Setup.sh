read -p "Starting environment swap, press any key to resume ..."
sudo dnf swap @server-product-environment @minimal-environment -y
read -p "Starting pantheon install, press any key to resume ..."
sudo dnf group install pantheon-desktop -y

read -p "Disabling GDM, press any key to resume ..."
systemctl disable gdm
read -p "Enabling LightDM, press any key to resume ..."
systemctl enable lightdm
read -p "Setting default environment to graphical, press any key to resume ..."
systemctl set-default graphical.target

read -p "Uninstalling Pantheon bloat, press any key to resume ..."
sudo dnf remove elementary-music -y 
sudo dnf remove elementary-videos -y
sudo dnf remove elementary-files -y
sudo dnf remove elementary-calculator -y
sudo dnf remove elementary-calendar -y
sudo dnf remove elementary-code -y
sudo dnf remove elementary-camera -y
sudo dnf remove elementary-photos -y

read -p "Installing preferred apps, press any key to resume ..."
sudo dnf install dolphin -y
sudo dnf install gnome-boxes -y
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install vlc -y
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser -y

read -p "Press any key to reboot ..."
reboot
