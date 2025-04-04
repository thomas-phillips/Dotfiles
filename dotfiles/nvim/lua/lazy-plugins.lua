return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	-- "gc" to comment visual regions/lines

	{ "numToStr/Comment.nvim", opts = {} },

	require("plugins/which-key"),
	require("plugins/telescope"),
	require("plugins/catppucian-mocha"),
	require("plugins/vim-tmux-navigator"),
	require("plugins/autopairs"),
	require("plugins/lsp-zero"),
	require("plugins/conform"),
	require("plugins/gitsigns"),
	require("plugins/lualine"),
	require("plugins/nvim-treesitter"),
	require("plugins/lazygit"),
	require("plugins/nvim-surround"),
	require("plugins/nvim-lint"),
	require("plugins/bigfile"),
	require("plugins/yazi"),
	require("plugins/harpoon"),
	require("plugins/treesj"),
	require("plugins/diffview"),
	require("plugins/no-neck-pain"),
	require("plugins/leap"),
	require("plugins/mintabline"),
	require("plugins/windows"),
	require("plugins/render-markdown"),
	require("plugins/markdown-preview"),
	require("plugins/silicon"),
	require("plugins/git-conflict"),
}
