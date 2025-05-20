local config = {
	cmd = { vim.fn.expand '$MASON/packages/jdtls/bin/jdtls' },
	root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
	settings = {
		java = {
			format = {
				enabled = false,
			-- 	settings = {
			-- 		-- Use Google Java style guidelines for formatting
			-- 		-- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
			-- 		-- and place it in the ~/.local/share/eclipse directory
			-- 		url = "~/.local/share/eclipse/eclipse-java-google-style.xml",
			-- 		profile = "GoogleStyle",
			-- 	},
			},
			saveActions = {
				organizeImports = true,
			},
			signatureHelp = {
				enabled = true
			},
			contentProvider = {
				preferred = 'fernflower' -- Use fernflower to decompile library code
			},
			completion = {
				guessMethodArguments = true,
				favoriteStaticMembers = {
					"org.junit.Assert.*",
					"org.junit.Assume.*",
					"org.junit.jupiter.api.Assertions.*",
					"org.junit.jupiter.api.Assumptions.*",
					"org.junit.jupiter.api.DynamicContainer.*",
					"org.junit.jupiter.api.DynamicTest.*",
					"org.mockito.Mockito.*",
					"org.mockito.ArgumentMatchers.*",
					"org.mockito.Answers.*"
				},
				filteredTypes = {
					"com.sun.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999;
					staticStarThreshold = 9999;
				},
			},
			-- How code generation should act
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
				},
				hashCodeEquals = {
					useInstanceof = true,
					useJava7Objects = true,
				},
				useBlocks = true,
				insertionLocation = "lastMember",
			},
			configuration = {
				-- runtimes = {
				-- 	{
				-- 		name = "JavaSE-17",
				-- 		path = "/mnt/c/Users/vissera/.jdks/jdk-17.0.13+11/"
				-- 	}
				-- }
			}
		},
	},
	init_options = {
		bundles = {
			vim.fn.expand("$MASON/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.53.1.jar"),
			require("spring_boot").java_extensions()
		}
	}
}
require('jdtls').start_or_attach(config)
