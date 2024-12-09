return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>aa", function()
			harpoon:list():add()
		end, { desc = "Add file to harpoon" })

		vim.keymap.set("n", "<leader>al", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon list" })

		vim.keymap.set("n", "<leader>a1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon 1" })
		vim.keymap.set("n", "<leader>a2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon 2" })
		vim.keymap.set("n", "<leader>a3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon 3" })
		vim.keymap.set("n", "<leader>a4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon 4" })
		vim.keymap.set("n", "<leader>a5", function()
			harpoon:list():select(5)
		end, { desc = "Harpoon 5" })
		vim.keymap.set("n", "<leader>a6", function()
			harpoon:list():select(6)
		end, { desc = "Harpoon 6" })
		vim.keymap.set("n", "<leader>a7", function()
			harpoon:list():select(7)
		end, { desc = "Harpoon 7" })
		vim.keymap.set("n", "<leader>a8", function()
			harpoon:list():select(8)
		end, { desc = "Harpoon 8" })
		vim.keymap.set("n", "<leader>a9", function()
			harpoon:list():select(9)
		end, { desc = "Harpoon 9" })
		vim.keymap.set("n", "<leader>a0", function()
			harpoon:list():select(0)
		end, { desc = "Harpoon 0" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>ap", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>an", function()
			harpoon:list():next()
		end)

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		-- vim.keymap.set("n", "<leader>al", function()
		-- 	toggle_telescope(harpoon:list())
		-- end, { desc = "Open harpoon window" })
	end,
}
