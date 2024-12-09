return {
	"Wansmer/treesj",
	-- keys = {
	-- },
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({ use_default_keymaps = false })
		vim.keymap.set("n", "<leader>t", require("treesj").toggle)
	end,
}
