-- Place this in ~/.config/nvim/lua/colorscheme.lua

local M = {}

function M.setup()
    -- Set background to dark mode
    vim.opt.background = 'dark'
    
    -- Enable true color support
    vim.opt.termguicolors = true
    
    -- Exact color matches from your screenshot
    local colors = {
        bg = '#000000',
        fg = '#ffffff',
        blue = '#3465ff',      -- comments
        orange = '#ff8800',    -- keywords, line numbers
        green = '#b8ff00',     -- long strings (like hex colors)
        white = '#ffffff',     -- variables, operators
        red = '#ff0000',       -- string literals like 'dark' and 'true'
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
        -- Special case for hex color strings in Lua
        luaString = { fg = colors.green, sp = colors.red },
    }

    -- Custom logic to handle different types of strings
    local function handle_lua_string(match)
        if match:match('^#%x+$') then
            return { fg = colors.green }  -- hex colors
        else
            return { fg = colors.red }    -- regular strings
        end
    end

    -- Apply highlights
    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return M
