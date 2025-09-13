local vim
return {
    settings = {
	["language-server"] = {
	    ["runtime-args"] = {"--max-semi-space-size=496", "--max-old-space-size=496"}
	},
	language_server = {
	    runtime_args = {"--max-semi-space-size=496", "--max-old-space-size=496"}
	}
    }
}
