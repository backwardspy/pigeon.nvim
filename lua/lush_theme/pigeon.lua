-- :Lushify this file.
local lush = require('lush')
local hsluv = lush.hsluv

-- light grey on black is the basis of everything.
local bg = hsluv(0, 0, 0)
local fg = hsluv(0, 0, 90)

-- colours are reserved for things of most importance.
local emphasis = hsluv(270, 60, 60)
local negative = hsluv(0, 60, 50)
local positive = hsluv(120, 60, 60)

---@diagnostic disable: undefined-global
local theme = lush(function(_)
    return {
        Normal { bg = bg, fg = fg },
        NormalFloat { Normal },
        Title { Normal, gui = "bold" },
        Underlined { Normal, gui = "underline" },
        CursorLine { bg = Normal.bg.li(10) },
        CursorColumn { CursorLine },
        LineNr { fg = Normal.bg.li(35) },
        CursorLineNr { fg = LineNr.fg.li(50) },
        SignColumn { Normal },
        FoldColumn { Normal },
        Visual { fg = Normal.fg, bg = Normal.bg.li(40) },
        Search { Visual },
        IncSearch { Search, gui = "underline" },
        Pmenu { bg = bg.li(10), fg = Normal.fg },
        PmenuSel { Pmenu, bg = Pmenu.bg.li(10) },

        Keyword { fg = Normal.fg.da(35) },
        Include { Keyword },
        Comment { fg = Normal.fg.da(50) },
        Statement { Comment },
        Special { Comment },
        Delimiter { Comment },
        Identifier { Normal },
        Type { fg = Normal.fg.da(10) },
        TypeDef { Type },
        Constant { fg = emphasis },

        DiagnosticError { fg = negative, gui = "italic" },
        DiagnosticWarn { fg = negative, gui = "italic" },
        DiagnosticInfo { Normal, gui = "italic" },
        DiagnosticOk { fg = positive, gui = "italic" },

        DiffAdd { DiagnosticOk },
        DiffChange { DiagnosticInfo },
        DiffDelete { DiagnosticError },
        DiffText { Normal },
    }
end)

return theme
