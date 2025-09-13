local vim = vim

local roulette = {
    "rose-pine-moon",
    "nightfox",
    "duskfox",
    "catppuccin-macchiato",
    "yorumi"
}
local pick = roulette[math.random(1, table.maxn(roulette))]
if not vim.cmd.colorscheme(pick) then
    pick = "default"
    vim.cmd.colorscheme(pick)
end
print("Colorscheme: "..pick)
