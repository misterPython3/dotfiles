local vim = vim

vim.g.OmniSharp_server_use_mono = 1
vim.g.OmniSharp_server_use_net6 = 1

local roulette = {
    {
	"rose-pine-moon",
	"nightfox",
	"duskfox",
	"catppuccin-macchiato",
    },
    {
	"kanagawa",
	"everforest",
	"gruvbox",
	"miasma",
    }
}
local set_index = math.random(1, table.maxn(roulette))
local theme_set = roulette[set_index]
local pick = theme_set[math.random(1, table.maxn(theme_set))]
if not vim.cmd.colorscheme(pick) then
    pick = "default"
    vim.cmd.colorscheme(pick)
end
print(string.format("Colorscheme (Set %d): %s", pick~="default" and set_index or 0,pick))
