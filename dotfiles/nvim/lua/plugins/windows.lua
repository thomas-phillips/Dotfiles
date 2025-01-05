return {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
	},
	config = function()

		local functions = require("functions")

		require("windows").setup({
			ignore = {
				buftype = { "quickfix" },
				filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
			},
			animation = {
				enable = true,
				duration = 50,
				fps = 300,
				easing = "in_out_sine",
			},
		})

		vim.keymap.set("n", "<leader>wm", functions.cmd("WindowsMaximize"))
		vim.keymap.set("n", "<leader>wv", functions.cmd("WindowsMaximizeVertically"))
		vim.keymap.set("n", "<leader>wh", functions.cmd("WindowsMaximizeHorizontally"))
		vim.keymap.set("n", "<leader>we", functions.cmd("WindowsEqualize"))
	end,
}
