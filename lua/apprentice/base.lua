local lush = require("lush")
local colors = require("apprentice.colors")
local styles = require("apprentice.settings").styles
local utils = require("apprentice.utils")

-- options (dark mode by default)
local bg0 = colors.dark0
local bg1 = colors.dark1
local bg2 = colors.dark2
local bg3 = colors.dark3
local bg4 = colors.dark4

local fg0 = colors.light0
local fg1 = colors.light1
local fg2 = colors.light2
local fg3 = colors.light3
local fg4 = colors.light4

local red = colors.bright_red
local green = colors.bright_green
local yellow = colors.bright_yellow
local blue = colors.bright_blue
local purple = colors.bright_purple
local aqua = colors.bright_aqua
local orange = colors.bright_orange
local gray = colors.gray

local bg = vim.o.background
if bg == nil then
  bg = "dark"
  vim.o.background = bg
end

-- swap colors if light mode
if bg == "light" then
  bg0 = colors.light0
  bg1 = colors.light1
  bg2 = colors.light2
  bg3 = colors.light3
  bg4 = colors.light4
  fg0 = colors.dark0
  fg1 = colors.dark1
  fg2 = colors.dark2
  fg3 = colors.dark3
  fg4 = colors.dark4
  red = colors.faded_red
  green = colors.faded_green
  yellow = colors.faded_yellow
  blue = colors.faded_blue
  purple = colors.faded_purple
  aqua = colors.faded_aqua
  orange = colors.faded_orange
end

-- handle light/dark contrast settings
local contrast = vim.g["apprentice_contrast_" .. bg]
if contrast == "hard" then
  bg0 = colors[bg .. "0_hard"]
elseif contrast == "soft" then
  bg0 = colors[bg .. "0_soft"]
end

-- extending colors table with basic names for easy customization in g:apprentice_* options
colors.bg0 = bg0
colors.bg1 = bg1
colors.bg2 = bg2
colors.bg3 = bg3
colors.bg4 = bg4
colors.fg0 = fg0
colors.fg1 = fg1
colors.fg2 = fg2
colors.fg3 = fg3
colors.fg4 = fg4
colors.red = red
colors.green = green
colors.yellow = yellow
colors.blue = blue
colors.purple = purple
colors.aqua = aqua
colors.orange = orange

local hls_cursor = utils.get_color_from_var(vim.g.apprentice_hls_cursor, aqua, colors)
local hls_highlight = utils.get_color_from_var(vim.g.apprentice_hls_highlight, yellow,
  colors)
local number_column = utils.get_color_from_var(vim.g.apprentice_number_column, nil, colors)
local color_column = utils.get_color_from_var(vim.g.apprentice_color_column, bg1, colors)
local vert_split = utils.get_color_from_var(vim.g.apprentice_vert_split, bg0, colors)
local win_separator = utils.get_color_from_var(vim.g.apprentice_win_separator, bg0, colors)
local tabline_sel = utils.get_color_from_var(vim.g.apprentice_tabline_sel, blue, colors)
local sign_column = utils.get_color_from_var(vim.g.apprentice_sign_column, bg1, colors)

local improved_strings_fg = fg1
local improved_strings_bg = bg1
local improved_strings_gui = styles.italic_strings

local special_string_fg = green
local special_string_bg = bg1
local special_string_gui = styles.italic_strings

if not utils.tobool(vim.g.apprentice_improved_strings) then
  improved_strings_fg = green
  improved_strings_bg = nil
  special_string_bg = nil
  special_string_gui = nil
end

local background = nil

if not utils.tobool(vim.g.apprentice_transparent_bg) then
  background = bg0
end

-- neovim terminal mode colors
vim.g.terminal_color_0 = bg0.hex
vim.g.terminal_color_8 = gray.hex
vim.g.terminal_color_1 = colors.neutral_red.hex
vim.g.terminal_color_9 = red.hex
vim.g.terminal_color_2 = colors.neutral_green.hex
vim.g.terminal_color_10 = green.hex
vim.g.terminal_color_3 = colors.neutral_yellow.hex
vim.g.terminal_color_11 = yellow.hex
vim.g.terminal_color_4 = colors.neutral_blue.hex
vim.g.terminal_color_12 = blue.hex
vim.g.terminal_color_5 = colors.neutral_purple.hex
vim.g.terminal_color_13 = purple.hex
vim.g.terminal_color_6 = colors.neutral_aqua.hex
vim.g.terminal_color_14 = aqua.hex
vim.g.terminal_color_7 = fg4.hex
vim.g.terminal_color_15 = fg1.hex

vim.g.colors_name = "apprentice"

local table_concat = table.concat
local base_group = lush(function()
    return {
        -- Base groups
        ApprenticeFg0 { fg = colors.light0 },
        ApprenticeFg1 { fg = colors.light1 },
        ApprenticeFg2 { fg = colors.light2 },
        ApprenticeFg3 { fg = colors.light3 },
        ApprenticeFg4 { fg = colors.light4 },
        ApprenticeGray { fg = colors.gray },
        ApprenticeBg0 { fg = colors.dark0 },
        ApprenticeBg1 { fg = colors.dark1 },
        ApprenticeBg2 { fg = colors.dark2 },
        ApprenticeBg3 { fg = colors.dark3 },
        ApprenticeBg4 { fg = colors.dark4 },

        ApprenticeError { fg = colors.error },
        ApprenticeWarning { fg = colors.bright_red },
        ApprenticeRed { fg = colors.neutral_red },
        ApprenticeRedBold { fg = colors.neutral_red, gui = styles.bold },
        ApprenticeGreen { fg = colors.neutral_green },
        ApprenticeGreenBold { fg = colors.neutral_green, gui = styles.bold },
        ApprenticeYellow { fg = colors.neutral_yellow },
        ApprenticeYellowBold { fg = colors.neutral_yellow, gui = styles.bold },
        ApprenticeBlue { fg = colors.neutral_blue },
        ApprenticeBlueBold { fg = colors.neutral_blue, gui = styles.bold },
        ApprenticePurple { fg = colors.neutral_purple },
        ApprenticePurpleBold { fg = colors.neutral_purple, gui = styles.bold },
        ApprenticeAqua { fg = colors.neutral_aqua },
        ApprenticeAquaBold { fg = colors.neutral_aqua, gui = styles.bold },
        ApprenticeOrange { fg = colors.neutral_orange },
        ApprenticeOrangeBold { fg = colors.neutral_orange, gui = styles.bold },

        -- Signs and underlines
        ApprenticeErrorSign { fg = colors.error, bg = sign_column, gui = styles.invert_signs },
        ApprenticeWarningSign { fg = colors.bright_red, bg = sign_column, gui = styles.invert_signs },
        ApprenticeRedSign { fg = colors.neutral_red, bg = sign_column, gui = styles.invert_signs },
        ApprenticeGreenSign { fg = colors.neutral_green, bg = sign_column, gui = styles.invert_signs },
        ApprenticeYellowSign { fg = colors.neutral_yellow, bg = sign_column, gui = styles.invert_signs },
        ApprenticeBlueSign { fg = colors.neutral_blue, bg = sign_column, gui = styles.invert_signs },
        ApprenticePurpleSign { fg = colors.neutral_purple, bg = sign_column, gui = styles.invert_signs },
        ApprenticeAquaSign { fg = colors.neutral_aqua, bg = sign_column, gui = styles.invert_signs },
        ApprenticeOrangeSign { fg = colors.neutral_orange, bg = sign_column, gui = styles.invert_signs },

        -- Underlines
        ApprenticeRedUnderline { gui = styles.undercurl, sp = colors.neutral_red },
        ApprenticeGreenUnderline { gui = styles.undercurl, sp = colors.neutral_green },
        ApprenticeYellowUnderline { gui = styles.undercurl, sp = colors.neutral_yellow },
        ApprenticeBlueUnderline { gui = styles.undercurl, sp = colors.neutral_blue },
        ApprenticePurpleUnderline { gui = styles.undercurl, sp = colors.neutral_purple },
        ApprenticeAquaUnderline { gui = styles.undercurl, sp = colors.neutral_aqua },
        ApprenticeOrangeUnderline { gui = styles.undercurl, sp = colors.neutral_orange },

        -- UI elements
        ColorColumn { bg = colors.dark1 },
        Conceal { fg = colors.dark4 },
        Cursor { gui = styles.inverse },
        lCursor { Cursor },
        iCursor { Cursor },
        vCursor { Cursor },
        CursorIM { Cursor },
        CursorLine { bg = colors.dark1 },
        CursorColumn { CursorLine },
        Directory { ApprenticeAquaBold },
        DiffAdd { fg = colors.neutral_green, bg = colors.dark0, gui = styles.inverse },
        DiffChange { fg = colors.neutral_purple, bg = colors.dark0, gui = styles.inverse },
        DiffDelete { fg = colors.neutral_red, bg = colors.dark0, gui = styles.inverse },
        DiffText { fg = colors.neutral_orange, bg = colors.dark0, gui = styles.inverse },
        ErrorMsg { fg = colors.dark0, bg = colors.error, gui = styles.bold },
        VertSplit { fg = colors.dark3, bg = colors.dark1 },
        WinSeparator { fg = colors.dark3, bg = colors.dark1 },
        Folded { fg = colors.dark3, bg = colors.dark1, gui = styles.italic_strings },
        FoldColumn { fg = colors.dark3, bg = colors.dark1 },
        SignColumn { bg = colors.dark1 },
        IncSearch { bg = colors.bright_orange, fg = colors.dark0, gui = styles.inverse },
        LineNr { fg = colors.dark4, bg = colors.dark1 },
        CursorLineNr { fg = colors.neutral_aqua, bg = colors.dark1 },
        MatchParen { bg = colors.dark3, gui = styles.bold },
        NonText { ApprenticeBg2 },
        Normal { fg = colors.light1, bg = colors.dark0 },
        Pmenu { fg = colors.light1, bg = colors.dark2 },
        PmenuSel { fg = colors.dark2, bg = colors.neutral_aqua, gui = styles.bold },
        PmenuSbar { bg = colors.dark2 },
        PmenuThumb { bg = colors.dark4 },
        Question { ApprenticeGreenBold },
        QuickFixLine { fg = colors.dark0, bg = colors.dark3, gui = styles.bold },
        Search { bg = colors.bright_yellow, fg = colors.dark0, gui = styles.inverse },
        SpecialKey { ApprenticeFg4 },
        SpellRare { ApprenticeOrangeUnderline },
        SpellBad { ApprenticeRedUnderline },
        StatusLine { fg = colors.dark2, bg = colors.light1, gui = styles.inverse },
        StatusLineNC { fg = colors.dark1, bg = colors.light4, gui = styles.inverse },
        TabLineFill { fg = colors.dark4, bg = colors.dark1, gui = styles.invert_tabline },
        TabLine { fg = colors.dark4, bg = colors.dark1, gui = styles.invert_tabline },
        TabLineSel { fg = colors.light0, bg = colors.dark1, gui = styles.invert_tabline },
        Title { fg = colors.light0, gui = styles.bold },
        Visual { bg = colors.dark4 },
        VisualNOS { Visual },
        WildMenu { fg = colors.neutral_blue, bg = colors.dark2, gui = styles.bold },

        -- Syntax
        Constant { ApprenticeOrange },
        Special { fg = colors.neutral_orange, bg = colors.dark1, gui = styles.italic_strings },
        String { fg = colors.neutral_green, bg = colors.dark1, gui = styles.italic_strings },
        Character { ApprenticeOrange },
        Number { ApprenticeOrange },
        Boolean { fg = colors.neutral_orange, gui = styles.italic_booleans },
        Float { ApprenticeOrange },
        Identifier { fg = colors.neutral_blue },
        Function { ApprenticeYellow },
        Statement { ApprenticeBlue },
        Conditional { ApprenticeBlue },
        Repeat { ApprenticeBlue },
        Label { ApprenticeBlue },
        Exception { ApprenticeBlue },
        Keyword { ApprenticeBlue },
        Operator { ApprenticeBlue },
        PreProc { fg = colors.neutral_yellow },
        Include { PreProc },
        Define { PreProc },
        Macro { PreProc },
        PreCondit { PreProc },
        Type { ApprenticePurple },
        StorageClass { Type },
        Structure { Type },
        Typedef { Type },
        SpecialChar { PreProc },
        Tag { PreProc },
        Delimiter { Special },
        Comment { fg = colors.dark3, gui = styles.italic_comments },
        Debug { PreProc },
        Underlined { fg = colors.neutral_aqua, gui = styles.underline },
        Bold { gui = styles.bold },
        Italic { gui = styles.italic },
        Ignore {},
        Error { fg = colors.error, gui = table_concat({ styles.bold, styles.underline }, ",") },
        Todo { fg = colors.light0, gui = table_concat({ styles.bold, styles.italic_comments }, ",") },

        -- Diffs
        diffAdded { ApprenticeGreen },
        diffRemoved { ApprenticeRed },
        diffChanged { ApprenticeAqua },
        diffFile { ApprenticeOrange },
        diffNewFile { ApprenticeYellow },
        diffLine { ApprenticeBlue },

        -- Plugins
        SignatureMarkText { ApprenticeBlueSign },
        SignatureMarkerText { ApprenticePurpleSign },

        -- Git
        gitcommitSelectedFile { ApprenticeGreen },
        gitcommitDiscardedFile { ApprenticeRed },

        -- Health
        healthError { fg = colors.dark0, bg = colors.error },
        healthSuccess { fg = colors.dark0, bg = colors.neutral_green },
        healthWarning { fg = colors.dark0, bg = colors.neutral_yellow },
    }
end)

return base_group

