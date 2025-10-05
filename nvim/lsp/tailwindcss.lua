return {
    workspace_required = true,
    root_markers = {
	'tailwind.config.js',
	"package.json"
    },
    root_dir = function(bufnr, on_dir)
	local root_files = {
	    "package.json",
	    "tsconfig.json",
	    'tailwind.config.js',
	    'tailwind.config.cjs',
	    'tailwind.config.mjs',
	    'tailwind.config.ts',
	    'postcss.config.js',
	    'postcss.config.cjs',
	    'postcss.config.mjs',
	    'postcss.config.ts',
	}
	local fname = vim.api.nvim_buf_get_name(bufnr)
	root_files = util.insert_package_json(root_files, 'tailwindcss', fname)
	root_files = util.root_markers_with_field(root_files, { 'mix.lock', 'Gemfile.lock' }, 'tailwind', fname)
	on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
    end,
}
