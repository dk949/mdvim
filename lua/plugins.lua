local PACKER_LOCATION = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function ensure_packer()
    if vim.fn.isdirectory(PACKER_LOCATION) ~= 0 then return true end
    print("Cloning packer")
    vim.fn.system(
        "git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. PACKER_LOCATION
    )
    if vim.v.shell_error == 0 then
        print("done. please restart mdvim")
        return false
    else
        error "failed. Something went wrong"
    end
end

vim.g.highlightedyank_highlight_duration = 1000

return function()
    if not ensure_packer() then return end

    if not ensure_packer() then error "could not initialise packer" end
    return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use { 'navarasu/onedark.nvim', config = require("onedark_config") }
        use 'godlygeek/tabular'
        use 'junegunn/goyo.vim'
        use 'tpope/vim-dispatch'
        use 'machakann/vim-highlightedyank'
        use 'tpope/vim-surround'
    end)
end
