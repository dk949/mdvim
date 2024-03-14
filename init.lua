require "plugins" ()

vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoLeave",
    command = "norm! ZZ",
    nested = true,
})

local function reset_status() return vim.fn.ResetStatus(select(2, OD_getHighlights(OD_current))) end

local mdvim_group = vim.api.nvim_create_augroup("mdvim", {})

-- Run the initial setup when entering Goyo, then unregister the autocmd
-- If the autogroup is created immediately it gets overriden when goyo is loaded (after this script)
vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoEnter",
    callback = function()
        reset_status()
        vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave", "BufWinEnter" }, {
            pattern = "*",
            callback = reset_status,
            group = mdvim_group,
        })
    end,
    nested = true,
    once = true,
})
-- tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true

-- statusline
vim.opt.laststatus = 3
vim.opt.showmode = false

-- lines
vim.api.nvim_create_autocmd("FileType", {
    pattern = "bib",
    callback = function()
        vim.opt_local.formatoptions = ""
        vim.opt_local.textwidth = 0
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.tabstop = 4
    end,
    group = mdvim_group,
})
vim.opt.formatoptions = "atn1"
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.breakat:remove('@') -- Don't break after '@', for citations
vim.opt.list = false
vim.opt.wrap = true

-- mouse
vim.opt.mouse = nil

-- spelling
vim.opt.spell = true
vim.opt.spelllang = 'en_gb'

-- split behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true

-- conceal
vim.opt.conceallevel = 2

vim.g.mapleader = " "

vim.keymap.set({ 'v', 'n', 'o' }, "j", "gj", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "gj", "j", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "k", "gk", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "gk", "k", { silent = true })

vim.keymap.set({ 'v', 'n', 'o' }, "0", "g0", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "$", "g$", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "g0", "0", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "g$", "$", { silent = true })

vim.keymap.set('n', "A", "g$a", { silent = true })
vim.keymap.set('n', "gA", "A", { silent = true })
vim.keymap.set('n', "I", "g0i", { silent = true })
vim.keymap.set('n', "gI", "I", { silent = true })

vim.keymap.set('n', "G", "Gzz", { silent = true })
vim.keymap.set('n', "vv", "V", { silent = true })
vim.keymap.set('n', "V", "v$", { silent = true })
vim.keymap.set('n', "Y", "y$", { silent = true })

vim.keymap.set('v', "<C-C>", [["*y :let @+=@*<CR>]], { silent = true })

vim.keymap.set('n', "<leader>m", ":Make!<CR>", {})
vim.keymap.set('n', "<leader>s", ":update<CR>", { silent = true })
vim.keymap.set('n', "<leader>b", ":e #<CR>", { silent = true })
vim.keymap.set('n', "<leader>nn", ":NvimTreeFindFileToggle<CR>", { silent = true })


vim.keymap.set('n', "<leader>o", OdToggle, { silent = true })
