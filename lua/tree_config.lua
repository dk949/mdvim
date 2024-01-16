-- https://github.com/nvim-tree/nvim-tree.lua
return function()
    local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', 'o', api.node.run.system, opts('Run System'))
        vim.keymap.set('n', '<space>mi', api.node.show_info_popup, opts('Info'))
        vim.keymap.set('n', '/', api.live_filter.start, opts('Filter'))
        vim.keymap.set('n', '<space>/', api.live_filter.clear, opts('Clean Filter'))
    end

    -----------------------------------------------------
    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.5
    require("nvim-tree").setup {
        -- changed
        on_attach = on_attach,
        sort_by = "case_sensitive",
        -- hijack_unnamed_buffer_when_opening = true,
        hijack_unnamed_buffer_when_opening = false,
        hijack_cursor = true,
        hijack_netrw = true,
        modified = { enable = true },
        -- remove_keymaps = { "s", "<C-k>", "f", "F" },
        view = {
            float = {
                enable = true,
                open_win_config = function()
                    local screen_w = vim.opt.columns:get()
                    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                    local window_w = screen_w * WIDTH_RATIO
                    local window_h = screen_h * HEIGHT_RATIO
                    local window_w_int = math.floor(window_w)
                    local window_h_int = math.floor(window_h)
                    local center_x = (screen_w - window_w) / 2
                    local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

                    return {
                        border = 'rounded',
                        relative = 'editor',
                        row = center_y,
                        col = center_x,
                        width = window_w_int,
                        height = window_h_int,
                    }
                end,
            },
            width = function()
                return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
            end,
        },
        renderer = {
            highlight_git = true,
            group_empty = true,
            highlight_opened_files = "icon",
            indent_markers = { enable = true },
            special_files = {
                "Makefile", "README.md",
                "readme.md", "LICENSE", "CMakeLists.txt",
                "vcpkg.json", "package,json", "dub.json",
                "dub.sdl", "build.zig", "Cargo.toml",
            }
        },
        actions = {
            use_system_clipboard = false,
            open_file = { quit_on_open = false },
        },
        tab = { sync = { open = true, close = true } },
    }
end
