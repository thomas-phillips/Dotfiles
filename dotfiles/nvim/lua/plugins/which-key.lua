return {
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").add({
				{ "<leader>s", group = "[S]earch" },
				{
					"<leader>b",
					group = "[B]uffer",
					expand = function()
						return require("which-key.extras").expand.buf()
					end,
				},
				{ "<leader>h", group = "[H]arpoon" },
				{ "<leader>y", group = "[Y]azi" },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>gt", group = "[G]itsigns [t]oggle" },
				{ "<leader>t", group = "[T]reeSJ" },
				{ "<leader>w", group = "[W]indow" },
				-- Visual Mode
				{ "<leader>g", group = "Git [H]unk", mode = "v" },
			})
		end,
	},
}
