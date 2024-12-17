-- Place this in ~/.config/nvim/lua/colorscheme.lua

local M = {}

function M.setup()
    vim.opt.background = 'dark'
    vim.opt.termguicolors = true
    
    local colors = {
        bg = '#000000',
        fg = '#cccccc',     -- even softer white for general text
        blue = '#0044dd',   -- comments
        orange = '#b35900', -- control flow
        green = '#00aa00',  -- types
        red = '#b30000',    -- string literals
        purple = '#aa44ff', -- preprocessor directives
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
