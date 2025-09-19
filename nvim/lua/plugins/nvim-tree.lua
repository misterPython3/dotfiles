local keymap_f = require("config.util.keymap_functions")
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
	"nvim-tree/nvim-web-devicons",
    },
    config = function ()
	local on_attach = function(bufnr)
	    local api = require("nvim-tree.api")
	    local opt_t = keymap_f.formatter_opt_desc({buffer=bufnr, noremap=true, silent=true, nowait=true},"NvimTree")

	    api.config.mappings.default_on_attach(bufnr)

	    keymap_f.map("n","<Leader>E", api.tree.toggle, opt_t"Toggle")
	    keymap_f.map("n","E", api.tree.toggle, opt_t"Toggle")
	    keymap_f.map("n","h", api.tree.change_root_to_parent, opt_t"Navigate To Parent")
	    keymap_f.map("n","l", api.node.open.edit, opt_t"Open")
	end
    	require("nvim-tree").setup{
	    on_attach = on_attach
	}
    end
}
