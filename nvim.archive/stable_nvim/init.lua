require('config.base')
require('config.lazy')
require('config.keymaps')
require('config.after')
if vim.g.neovide then
    require('config.neovide')
end
