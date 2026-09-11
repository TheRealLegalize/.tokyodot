set -gx CLICOLOR 1
set -g fish_color_valid_path --underline
set -gx LS_COLORS (vivid generate ~/.bin/vivid/void-spectra.yml)
set -gx EDITOR nvim

test -s /etc/grc.fish; and source /etc/grc.fish



# TokyoNight Color Palette
# set -l foreground c0caf5
# set -l selection 283457
# set -l comment 565f89
# set -l red f7768e
# set -l orange ff9e64
# set -l yellow e0af68
# set -l green 9ece6a
# set -l purple 9d7cd8
# set -l cyan 7dcfff
# set -l pink bb9af7

set -l foreground c4e0ff
set -l selection 2f2f2f
set -l comment 768699
set -l red eb0000
set -l orange eb8700
set -l yellow eb8700
set -l green 00eb07
set -l purple 7900eb
set -l cyan 00beeb
set -l pink 9514ff

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_option $pink
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection



#set -g fish_pager_color_prefix 5e95ff
#set -g fish_pager_color_completion f2f4f8
#set -g fish_pager_color_description 8d8d8d
#set -g fish_pager_color_progress 262626
#set -g fish_color_command 5e95ff


alias n="nvim"
alias sn="sudoedit"
alias hh="hexhog"
alias i="paru -Sy"
alias d="paru -Rns"
alias s="paru -Ss"
alias u="nice -n 19 ionice -c 2 -n 7 paru --sudo=pkexec -Syu"
alias pt="sudo -v && paru -Slq | fzf --preview='paru -Sii {}' --preview-window='top:30%:border-bottom' --reverse --cycle | xargs -ro paru -Sy"
alias exp="sudo pacman -D --asexplicit"
alias reflect="sudo reflector --verbose --latest 10 --age 24 --sort rate --save /etc/pacman.d/mirrorlist"
alias ls="eza --tree --level=1 --icons=always --no-time --no-permissions --no-user -s type"
alias cat="bat --paging=never"
alias cd="z"
alias ..="cd .."
alias ...="cd $HOME"
alias ytmp3="yt-dlp -x --audio-format mp3 --remux-video mp3"
alias ytdl="yt-dlp --no-playlist -x --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail -o '%(title)s.%(ext)s'"
alias ytmp4="yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 --cookies ~/.cookies.txt"
alias yd="yt-dlp"
alias fetch="c;fastfetch --color blue --color-title blue"
alias py="python"
alias toPng="~/.bin/toPng"
alias venc='sh -c "$(curl -sS https://vencord.dev/install.sh)"'
alias st="stow ."
alias t='tmux attach -t 0 || tmux new -s 0'
alias uni="unimatrix -s 95 -c yellow -a"
alias cpufreq="sudo $HOME/.bin/cpuFreq"
alias fbat="fzf --preview='bat {}' --preview-window='up:60%:wrap' '$FZF_COLORS'"
alias sysctl="sudo systemctl"
alias oc="opencode"
alias c='printf "\033[2J\033[3J\033[1;1H"'
alias ni="nitchrevived"
alias suka="sudo"
alias nmc="ncmpcpp"

if status is-interactive
    starship init fish | source
    zoxide init fish | source
    set -g fish_greeting
    # fetch
end

if status is-interactive; and string match -qr '^/dev/tty\d+$' (tty)
  clear
  uwsm start -e -D Hyprland hyprland.desktop
end

