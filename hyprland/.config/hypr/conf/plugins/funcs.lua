local M = {}

M.spawnFloatWithSlurp = function(cmd)
    local run_cmd = string.format(
        "(res=$(slurp -d -b 15151540 -c d1d7e8ff -w 2 -f '%%x %%y %%w %%h' 2>/dev/null); " ..
        "[ -n \"$res\" ] && set -- $res && " ..
        "hyprctl dispatch \"hl.dsp.exec_cmd('%s', { float = true, size = { $3, $4 }, move = { $1, $2 } })\") &",
        cmd
    )

    os.execute(run_cmd)
end

M.process_exists = function(name)
    local handle = io.popen("pgrep -x " .. name)
    if not handle then return false end

    local result = handle:read("*a")
    handle:close()

    return result ~= nil and result ~= ""
end

return M
