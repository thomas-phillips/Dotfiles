return {
	"LunarVim/bigfile.nvim",
	config = function()
		require("bigfile").setup({
			filesize = 500,
			features = { -- features to disable
				"indent_blankline",
				"illuminate",
				"lsp",
				"treesitter",
				"syntax",
				"matchparen",
				"vimopts",
				"filetype",
			},
		})
	end,
}
