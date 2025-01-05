return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local functions = require("functions")

				-- Navigation
				functions.map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Jump to next git [c]hange" }, bufnr)

				functions.map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Jump to previous git [c]hange" }, bufnr)

				-- Actions
				-- visual mode
				functions.map("v", "<leader>gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "stage git hunk" }, bufnr)
				functions.map("v", "<leader>gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "reset git hunk" }, bufnr)
				-- normal mode
				functions.map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" }, bufnr)
				functions.map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" }, bufnr)
				functions.map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" }, bufnr)
				functions.map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "git [u]ndo stage hunk" }, bufnr)
				functions.map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" }, bufnr)
				functions.map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "git [p]review hunk" }, bufnr)
				functions.map("n", "<leader>gb", gitsigns.blame_line, { desc = "git [b]lame line" }, bufnr)
				functions.map("n", "<leader>gd", gitsigns.diffthis, { desc = "git [d]iff against index" }, bufnr)
				functions.map("n", "<leader>gD", function()
					gitsigns.diffthis("@")
				end, { desc = "git [D]iff against last commit" }, bufnr)
				-- Toggles
				functions.map(
					"n",
					"<leader>gtb",
					gitsigns.toggle_current_line_blame,
					{ desc = "git [r]oggle show [b]lame line" }
				, bufnr)
				functions.map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "git [t]oggle show [d]eleted" }, bufnr)
			end,
		},
	},
}
