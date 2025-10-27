return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		vim.keymap.set("n", "<leader>n", "<cmd>NoNeckPain<cr>", { desc = "No neck pain" })
	end,
}
