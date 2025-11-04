local vim = vim
-- vim highlight
local api_highlight = vim.api.nvim_set_hl
local function api_hl(lhs, rhs)
    return api_highlight(0, lhs, rhs)
end

local li_color = {
    ["background"] = "#FFFFFF",
    ["foreground"] = "#000000",
    ["special"] = "#808080",
}
local dk_color = {
    ["background"] = "#000000",
    ["foreground"] = "#FFFFFF",
    ["special"] = "#808080",
}

local li_default_attr = {
    bg = li_color["background"],
    fg = li_color["foreground"],
    sp = li_color["special"],
    blend = 0,

    bold = false,
    standout = false,

    underline = false,
    undercurl = false,
    underdouble = false,
    underdotted = false,
    underdashed = false,

    strikethrough = false,
    italic = false,

    reverse = false,
    nocombine = false,

    link = "CustomHighlight",
    default = false,

    ctermbg = 15,
    ctermfg = 0,
    cterm = {},
    force =  true
}
local dk_default_attr = {
    bg = dk_color["background"],
    fg = dk_color["foreground"],
    sp = dk_color["special"],
    blend = 0,

    bold = false,
    standout = false,

    underline = false,
    undercurl = false,
    underdouble = false,
    underdotted = false,
    underdashed = false,

    strikethrough = false,
    italic = false,

    reverse = false,
    nocombine = false,

    link = "CustomHighlight",
    default = false,

    ctermbg = 0,
    ctermfg = 15,
    cterm = {},
    force = true
}

local li_attr_meta = {}
li_attr_meta.prototype = li_default_attr
li_attr_meta.mt = {}
local function lihl(attr)
    setmetatable(attr,li_attr_meta.mt)
    return attr
end
li_attr_meta.mt.__index = function(table, key)
    return li_attr_meta.prototype[key]
end
local dk_attr_meta = {}
dk_attr_meta.prototype = dk_default_attr
dk_attr_meta.mt = {}
local function dkhl(attr)
    setmetatable(attr,dk_attr_meta.mt)
    return attr
end
dk_attr_meta.mt.__index = function(table, key)
    return dk_attr_meta.prototype[key]
end

local default_attr, hl
if vim.o.background == 'light' then
    default_attr = li_default_attr
    hl =  lihl
else
    default_attr = dk_default_attr
    hl =  dkhl
end


local custom_highlights = {
    ["Comment"] = {},

    ["Constant"] = {},
    ["String"] = {},
    ["Character"] = {},
    ["Number"] = {},
    ["Boolean"] = {},
    ["Float"] = {},

    ["Identifier"] = {},
    ["Function"] = {},

    ["Statement"] = {},
    ["Conditional"] = {},
    ["Repeat"] = {},
    ["Label"] = {},
    ["Operator"] = {},
    ["Keyword"] = {}, 
    ["Exception"] = {}, 

    ["PreProc"] = {}, -- generic Preprocessor
    ["Include"] = {}, 
    ["Define"] = {}, 
    ["Macro"] = {}, 
    ["PreCondit"] = {}, -- preprocessor conditionals

    ["Type"] = {},
    ["StorageClass"] = {},
    ["Structure"] = {},
    ["Typedef"] = {},


    ["Special"] = {},
    ["SpecialChar"] = {},
    ["Tag"] = {},
    ["Delimiter"] = {},
    ["SpecialComment"] = {},
    ["Debug"] = {},

    ["Underlined"] = {},

    ["Error"] = {},
    ["Todo"] = {},

    ["Added"] = {},
    ["Changed"] = {},
    ["Removed"] = {},
}

-- for hi_name, hi_attr in pairs(custom_highlights) do
--     if table.getn(hi_attr) then
--     	hi_attr = default_attr
--     end
--     api_hl(hi_name, hi_attr)
-- end
