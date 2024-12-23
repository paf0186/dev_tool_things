-- Place this in ~/.config/nvim/lua/colorscheme.lua

local M = {}

function M.setup()
    vim.opt.background = 'dark'
    vim.opt.termguicolors = true
    
    local colors = {
        bg = '#000000',
        fg = '#cccccc',     -- soft white for general text
        blue = '#0044dd',   -- comments
        orange = '#b35900', -- control flow
        green = '#00aa00',  -- types
        red = '#cc0000',    -- string literals
        purple = '#991199', -- preprocessor directives and macros
    }
    
    local highlights = {
        -- Editor highlights
        Normal = { fg = colors.fg, bg = colors.bg },
        LineNr = { fg = colors.orange },
        CursorLine = { bg = colors.bg },
        NonText = { fg = colors.orange },
        
        -- General syntax
        Comment = { fg = colors.blue },
        String = { fg = colors.red },
        Number = { fg = colors.orange },
        Identifier = { fg = colors.fg },
        Operator = { fg = colors.fg },
        Special = { fg = colors.fg },
        Type = { fg = colors.green },
        
        -- C specific
        cPreProc = { fg = colors.purple },
        cDefine = { fg = colors.purple },
        cPreCondit = { fg = colors.purple },
        cInclude = { fg = colors.purple },
        cPreConditMatch = { fg = colors.purple },  -- Added for preprocessor conditionals
        cMacro = { fg = colors.purple },           -- Added for macro definitions
        cMacroName = { fg = colors.purple },       -- Added for macro names
        cDefine = { fg = colors.purple },
        
        -- Special handling for predefined macros
        cSpecial = { fg = colors.purple },         -- For special symbols like __STDC_VERSION__
        cSpaceError = { bg = colors.bg },          -- Remove background highlighting for spaces
        
        cType = { fg = colors.green },
        cStorageClass = { fg = colors.green },
        cStructure = { fg = colors.green },
        
        cStatement = { fg = colors.orange },
        cConditional = { fg = colors.orange },
        cRepeat = { fg = colors.orange },
        
        cString = { fg = colors.red },
        cConstant = { fg = colors.fg },
    }
    
    -- Additional C type keywords
    local type_keywords = {
        'cType',
        'Type',
        'StorageClass',
        'Structure',
        'TypeDef'
    }
    
    -- Apply consistent type highlighting
    for _, group in ipairs(type_keywords) do
        highlights[group] = { fg = colors.green }
    end
    
    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return M
