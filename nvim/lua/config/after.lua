local vim = vim

vim.g.OmniSharp_server_use_mono = 1
vim.g.OmniSharp_server_use_net6 = 1

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
