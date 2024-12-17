-- Place this in ~/.config/nvim/lua/colorscheme.lua

local M = {}

function M.setup()
    -- Set background to dark mode
    vim.opt.background = 'dark'
    
    -- Enable true color support
    vim.opt.termguicolors = true
    
    -- Basic color definitions
    local colors = {
        bg = '#000000',
        fg = '#ffffff',
        black = '#121212',
        red = '#ff5555',
        green = '#50fa7b',
        yellow = '#f1fa8c',
        blue = '#bd93f9',
        magenta = '#ff79c6',
        cyan = '#8be9fd',
        white = '#f8f8f2',
        bright_black = '#6272a4',
        bright_red = '#ff6e6e',
        bright_green = '#69ff94',
        bright_yellow = '#ffffa5',
        bright_blue = '#d6acff',
        bright_magenta = '#ff92df',
        bright_cyan = '#a4ffff',
        bright_white = '#ffffff',
    }
    
    -- Set highlight groups
    local highlights = {
        -- Editor highlights
        Normal = { fg = colors.fg, bg = colors.bg },
        LineNr = { fg = colors.bright_black },
        CursorLine = { bg = colors.black },
        CursorLineNr = { fg = colors.yellow },
        Visual = { bg = colors.bright_black },
        
        -- Syntax highlighting
        Comment = { fg = colors.bright_black, italic = true },
        Constant = { fg = colors.magenta },
        String = { fg = colors.yellow },
        Identifier = { fg = colors.cyan },
        Function = { fg = colors.green },
        Statement = { fg = colors.magenta },
        Keyword = { fg = colors.magenta },
        PreProc = { fg = colors.magenta },
        Type = { fg = colors.blue },
        Special = { fg = colors.cyan },
        
        -- UI elements
        StatusLine = { fg = colors.white, bg = colors.black },
        StatusLineNC = { fg = colors.bright_black, bg = colors.black },
        VertSplit = { fg = colors.bright_black },
        Pmenu = { fg = colors.white, bg = colors.black },
        PmenuSel = { fg = colors.black, bg = colors.cyan },
    }
    
    -- Apply highlights
    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return M
