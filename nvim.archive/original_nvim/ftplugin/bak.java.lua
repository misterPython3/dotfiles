local eclipse_path = "/home/genes/Applications/eclipse.jdt.ls"
local eclipse_jdtls_path = eclipse_path .. "/org.eclipse.jdt.ls.product/target/repository"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/genes/Personal/projects/' .. project_name
local config = {
  cmd = {
    '/home/genes/Applications/jdk-23.0.2/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', eclipse_jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.7.0.v20250411-1133.jar',
    '-configuration', eclipse_jdtls_path .. '/config_linux',
    '-data', workspace_dir,
  },
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
    settings = {
	java = {
	    configuration = {
		runtimes = {
		    {
			name = "Java 23.0.2",
			path = "/home/genes/Applications/jdk-23.0.2/"
		    },
		    {
			name = "OpenJDK-17",
			path = "/usr/lib/jvm/java-17-openjdk-amd64/"
		    }
		}
	    }
	}
    },

    init_options = {
	bundles = {}
    },
}
require('jdtls').start_or_attach(config)

