-- ==================== AUTOSTART / EXEC-ONCE (Hyprland 0.55 Lua) ====================

hl.on("hyprland.start", function()
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("qs -c noctalia-shell")
    -- hl.exec_cmd("qs -c noctalia-shell & awww-daemon & hyprsunset & dunst & hypridle")
--    hl.exec_cmd('sh "$HOME/.bin/lWpp"')
    hl.exec_cmd("hyprctl setcursor Future 32")
    -- hl.exec_cmd("systemctl --user start hyprpolkitagent")
    -- hl.exec_cmd("syshud -p bottom -o h -m '0 0 100 0' &")
    hl.exec_cmd("gsr-ui launch-hide 2>&1 > /dev/null & gsr-notify --text 'Press Alt+Z to open the Shadowplay' --timeout 2 2>&1 > /dev/null &")
end)
