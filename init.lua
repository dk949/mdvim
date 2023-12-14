require "plugins" ()

vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoLeave",
    command="norm! ZZ",
})

vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoEnter",
    callback=function()
        vim.opt.statusline = [[%=%{WordCount()}]]
        vim.cmd[[hi statusline ctermfg=white guifg=#abb2bf guibg=#2c2d30]]
    end,
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
vim.opt.laststatus = 2
vim.opt.showmode = false

-- lines
vim.opt.formatoptions = "tn1"
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.textwidth = 80
vim.opt.wrap = true

-- mouse
vim.opt.mouse=nil

-- spelling
vim.opt.spell = true
vim.opt.spelllang = 'en_gb'

-- split behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "

vim.keymap.set({ 'v', 'n', 'o' }, "j", "gj", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "gj", "j", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "k", "gk", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "gk", "k", { silent = true })

vim.keymap.set({ 'v', 'n', 'o' }, "0", "g0", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "$", "g$", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "g0", "0", { silent = true })
vim.keymap.set({ 'v', 'n', 'o' }, "g$", "$", { silent = true })

vim.keymap.set('n',  "A", "g$a", { silent = true })
vim.keymap.set('n', "gA",   "A", { silent = true })
vim.keymap.set('n',  "I", "g0i", { silent = true })
vim.keymap.set('n', "gI",   "I", { silent = true })

vim.keymap.set('n',  "G", "Gzz", {silent = true })
vim.keymap.set('n', "vv",   "V", {silent = true })
vim.keymap.set('n',  "V",  "v$", {silent = true })
vim.keymap.set('n',  "Y",  "y$", {silent = true })

vim.keymap.set('v', "<C-C>", [["*y :let @+=@*<CR>]], {silent = true })

vim.keymap.set('n', "<leader>m",  ":Make!<CR>", { })
vim.keymap.set('n', "<leader>s", ":update<CR>", { silent = true })
vim.keymap.set('n', "<leader>b",    ":e #<CR>", { silent = true })
