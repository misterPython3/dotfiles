return {
    'stevearc/oil.nvim',
    opts = {
	float = {
	    max_width = 0.5,
	    max_height = 0.5,
	    preview_split = "right",
	},
	keymaps = {
	      ["?"] = { "actions.show_help", mode = "n" },
	      ["l"] = "actions.select",
	      ["<CR>v"] = { "actions.select", opts = { vertical = true } },
	      ["<CR>h"] = { "actions.select", opts = { horizontal = true } },
	      ["<CR>t"] = { "actions.select", opts = { tab = true } },
	      ["<CR>p"] = "actions.preview",
	      ["q"] = { "actions.close", mode = "n" },
	      ["<C-r>"] = "actions.refresh",
	      ["h"] = {
		  "actions.parent",
		  mode = "n",
		  silent = false,
		  nowait = true
	      },
	      ["_"] = { "actions.open_cwd", mode = "n" },
	      ["`"] = { "actions.cd", mode = "n" },
	      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
	      ["gs"] = { "actions.change_sort", mode = "n" },
	      ["gx"] = "actions.open_external",
	      ["."] = { "actions.toggle_hidden", mode = "n" },
	      ["g\\"] = { "actions.toggle_trash", mode = "n" },
	  },
	  use_default_keymaps = false,
	  view_options = {
	      show_hidden = true
	  },
    },
    dependencies = {
	{
	    "echasnovski/mini.icons",
	    opts = {}
	}
    },
}
