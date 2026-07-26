#!/usr/bin/env bash

set -euo pipefail

BASE_PKGS=(
  7zip
  adw-gtk-theme
  aria2
  ark
  awww
  bat
  btop
  cava
  cliphist
  cpupower
  duf
  eva
  eza
  fastfetch
  fd
  ffmpeg
  ffmpegthumbnailer
  fish
  flatpak
  fuse-common
  fuse2
  fuse3
  fzf
  git
  gpu-screen-recorder
  gpu-screen-recorder-notification
  gpu-screen-recorder-ui
  grc
  grub-btrfs
  gtk-layer-shell
  gvfs
  helium-browser-bin
  hyprland
  hyprpicker
  imagemagick
  inotify-tools
  intel-ucode
  jq
  kitty
  komikku
  librewolf
  linux-cachyos
  linux-cachyos-rc
  mpv
  ncdu
  neovim
  networkmanager
  niri
  noctalia-qs
  noctalia-shell
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  nwg-look
  obsidian
  ouch
  pacman-contrib
  python-curl_cffi
  qbittorrent
  qt5ct
  qt5-wayland
  qt6ct
  qt6-wayland
  reflector
  ripgrep
  rust
  rust-analyzer
  satty
  seatd
  slurp
  sof-firmware
  starship
  stow
  swayimg
  telegram-desktop
  tesseract
  tesseract-data-eng
  tesseract-data-osd
  tesseract-data-rus
  thunar
  thunar-archive-plugin
  thunar-volman
  timeshift
  tree
  ttf-cascadia-code-nerd
  tumbler
  unzip
  uwsm
  vivid
  waybar
  wget
  which
  wl-clipboard
  wlsunset
  wofi
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-wlr
  xdg-utils
  xorg-xwayland
  yazi
  ydotool
  yt-dlp
  zoxide
  zram-generator
)

AUR_PKGS=(
  appimagelauncher
  portproton
  rar
  throne
  vsreflector-manager
  unimatrix-git
)

STOW_FOLDERS=(
  bin
  eza
  fastfetch
  fish
  hyprland
  kitty
  niri
  noctalia
  nvim
  ohmyposh
  paru
  qt
  starship
  swayimg
  sys
  theme
  thunar
  Wallpapers
  waybar
  wofi
  yazi
)

install_chaotic() {
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  sudo pacman -U --needed --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U --needed --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
  if grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
    echo "Repository [chaotic-aur] already installed in /etc/pacman.conf. Skiping."
  else
    echo "Adding [chaotic-aur] in /etc/pacman.conf..."
    echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
  fi
  sudo pacman -Sy
}

ensure_gum() {
  if ! command -v gum &> /dev/null; then
    echo "No gum found. Installing..."
    sudo pacman -S --needed --noconfirm gum
    hash -r
  else
    return 0
  fi
}

ensure_paru() {
  if ! command -v paru &> /dev/null; then
    sudo pacman -S --needed --noconfirm paru-git
    hash -r
  else
    return 0
  fi
}

flashbang() {
  local warning_text="${1:-THINK FAST, CHUCKLENUTS!}"
  local display_time="${2:-2.5}"

  printf "\a"
  sleep 0.5
  printf "\033[7m\033[2J\033[H"
  if command -v gum &>/dev/null; then
    gum style \
      --background='#ffffff' \
      --foreground='#00ffff' \
      --padding='5' \
      --bold \
      "$warning_text"
  else
    printf "\033[33;47m\033[1m\n  %s  \n\033[0m\n" "$warning_text"
  fi
  sleep "$display_time"
  printf "\033[0m\033[2J\033[H"
}

spin() {
  local title="$1"
  shift
  gum spin \
    --show-stderr \
    --spinner line \
    --spinner.foreground='#7aa2f7' \
    --title="$title" \
    -- "$@"
}

confirm() {
  local title="$1"
  gum confirm \
    --selected.background='#7aa2f7' \
    "$title"
}

selector() {
  gum choose \
    --cursor.background='#262626' \
    --cursor.foreground='#7aa2f7' \
    --select-if-one \
    "$@"
}

ask_browser() {
  local BROWSER=""

  BROWSER=$(selector "zen-browser-bin" "firefox" || true)

  if [[ -z "$BROWSER" ]]; then
    flashbang "СЕЧАТКУС КРУЦИОС" 3
    gum style \
      --foreground "#f7768e" \
      --border normal \
      --border-foreground "#f7768e" \
      --padding "0 1" \
      "Are you deadass and can't pick between two things, so you need to press Esc?" "Fine, installing Zen by default."
   sleep 1.5

    BROWSER="zen-browser-bin"
  fi

  BASE_PKGS+=("$BROWSER")
}

ask_discord() {
  local CLIENT=""

  CLIENT=$(selector "vesktop" "discord" || true)

  if [[ -z "$CLIENT" ]]; then
    flashbang "СЕЧАТКУС КРУЦИОС" 3
    gum style \
      --foreground "#f7768e" \
      --border normal \
      --border-foreground "#f7768e" \
      --padding "0 1" \
      "Are you deadass and can't pick between two things, so you need to press Esc?" "Fine, installing Vesktop by default."
    sleep 1.5
   
    CLIENT="vesktop"
  fi
  
  BASE_PKGS+=("$CLIENT")
}

symlink() {
  local dot_dir="$HOME/.tokyodot/"
  if [[ ! -d "$dot_dir" ]]; then
    echo "Cant find $dot_dir folder!"
    return 1
  fi
  pushd "$dot_dir" > /dev/null || return 1
  #spin "Linking all the dotfiles..." 
  stow -R "${STOW_FOLDERS[@]}"
  popd > /dev/null
  echo "All dotfiles are succesfully linked!"
}

main() {
  sudo -v
  ensure_gum
  #spin "Installing Chaotic AUR repository..." bash -c 
  install_chaotic
  #spin "Installing paru..." bash -c 
  ensure_paru
  ask_browser
  ask_discord
  spin "Installing base packages..." paru -S --needed --noconfirm "${BASE_PKGS[@]}"
  confirm "Do you want to install AUR packages? You nee to wait for some of it to compile, and they're not important" && spin "Installing AUR packages..." paru -S --needed --noconfirm "${AUR_PKGS[@]}"
  spin "Stow will link your files" bash -c 'symlink'
}

main
