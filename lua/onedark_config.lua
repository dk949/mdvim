-- these have to be global, to be accessible after packer compiles this config

OD_dstyle = 'warm'
OD_lstyle = 'light'
OD_current = OD_dstyle

function OD_getHighlights(style)
    local p = require('onedark.palette')
    return {
        SpellBad    = { fg = '$red' },
        SpellCap    = { fg = '$cyan' },
        SpellLocal  = { fg = "$orange" },
        NormalFloat = { fg = p[style].fg, bg = p[style].bg_d },
    }
end

function OdToggle()
    local od = require('onedark')
    -- NOTE: This is set *BEFORE* changing the OD_current style
    --       I'm not sure why
    od.set_options('highlights', OD_getHighlights(OD_current))
    if OD_current == OD_dstyle then OD_current = OD_lstyle else OD_current = OD_dstyle end
    od.toggle()
    od.load()
end

return function()
    local od = require('onedark')
    -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' or 'light'

    od.setup {
        -- Main options --
        style = OD_current,
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        cmp_itemkind_reverse = true,

        toggle_style_list = { OD_dstyle, OD_lstyle },

        -- italic, bold, underline, none
        -- or any combination e.g. 'italic,bold'
        code_style = {
            comments  = 'none',
            keywords  = 'none',
            functions = 'none',
            strings   = 'none',
            variables = 'none'
        },

        lualine = {
            transparent = false, -- lualine center bar transparency
        },

        colors = {},                              -- Override default colors
        highlights = OD_getHighlights(OD_lstyle), -- Override highlight groups

        diagnostics = {
            darker     = true, -- darker colors for diagnostic
            undercurl  = true, -- use undercurl instead of underline for diagnostics
            background = true, -- use background color for virtual text
        },
    }
    od.load()
end
