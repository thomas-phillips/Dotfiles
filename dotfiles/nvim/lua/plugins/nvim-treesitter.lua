return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"html",
				"css",
				"json",
				"markdown",
				"make",
				"latex",
				"bibtex",
				"c_sharp",
				"csv",
				"gitignore",
				"nginx",
				"bash",
				"powershell",
				"python",
				"sql",
				"terraform",
				"tmux",
				"xml",
				"yaml",
				"java",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
