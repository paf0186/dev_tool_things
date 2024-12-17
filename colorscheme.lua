-- Place this in ~/.config/nvim/lua/colorscheme.lua

local M = {}

function M.setup()
    -- Set background to dark mode
    vim.opt.background = 'dark'
    
    -- Enable true color support
    vim.opt.termguicolors = true
    
    -- Balanced, rich color matches
    local colors = {
        bg = '#000000',
        fg = '#ffffff',
        blue = '#0044dd',      -- balanced blue for comments
        orange = '#b35900',    -- balanced orange for keywords
        green = '#77aa00',     -- balanced green for hex colors
        white = '#ececec',     -- slightly muted white
        red = '#b30000',       -- balanced red
    }
    
    -- Set highlight groups
    local highlights = {
        -- Editor highlights
        Normal = { fg = colors.white, bg = colors.bg },
        LineNr = { fg = colors.orange },
        CursorLine = { bg = colors.bg },
        NonText = { fg = colors.orange },    -- for the tilde markers
        
        -- Syntax highlighting
        Comment = { fg = colors.blue },
        Statement = { fg = colors.orange },   -- keywords like 'local', 'function'
        Identifier = { fg = colors.white },   -- variable names
        Operator = { fg = colors.white },     -- equals signs and operators
        String = { fg = colors.red },         -- basic string literals
        SpecialString = { fg = colors.green }, -- hex color strings
        Number = { fg = colors.orange },
        Special = { fg = colors.white },      -- special chars like brackets
        Boolean = { fg = colors.red },        -- for 'true' and 'false'
        
        -- Lua specific
        luaFunction = { fg = colors.orange },
        luaStatement = { fg = colors.orange },
        luaTable = { fg = colors.white },     -- table brackets
        luaOperator = { fg = colors.white },
        luaString = { fg = colors.red },
    }
    
    -- Apply highlights
    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return M
