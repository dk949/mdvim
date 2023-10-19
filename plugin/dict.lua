local function dict(word)
    local out = vim.fn.system([[curl -s dict://dict.org/d:]] .. word .. [[ | awk '!/[0-9]/' | sed 's/\r//g']])
    assert(vim.v.shell_error == 0, "Could not submit request to dict.org")
    return out
end

vim.api.nvim_create_user_command("Dict", function(cmd) print(dict(cmd.args)) end, { nargs = 1 })

vim.keymap.set('n', '<S-k>', function()
    local word = vim.fn.expand("<cword>")
    vim.cmd[[below new]]
    vim.opt_local.buftype = "nofile"
    vim.opt_local.bufhidden = "hide"
    vim.opt_local.swapfile = false
    vim.g.mdvim_dict_output = dict(word)
    vim.cmd[[put =mdvim_dict_output]]
    vim.g.mdvim_dict_output = nil
    -- vim.cmd[[0]]
end)


