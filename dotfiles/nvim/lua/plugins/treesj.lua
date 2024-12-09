return {
	"Wansmer/treesj",
	keys = {
		"<leader>m",
		"<CMD>TSJToggle<CR>",
		desc = "Toggle Treesitter Join",
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})
	end,
}
