return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			bash = { "shfmt" },
			sh = { "shfmt" },
			go = { "gofmt" },
			rust = { "rustfmt", lsp_format = "fallback" },
			json = { "jq" },
			yaml = { "prettier" },
			typescript = { "prettier" },
			ruby = { "rubocop" },
		},
	},
}
