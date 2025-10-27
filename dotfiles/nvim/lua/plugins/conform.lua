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
	config = function()
		require("conform").setup({
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black_venv", "black" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				go = { "gofmt" },
				rust = { "rustfmt", lsp_format = "fallback" },
				json = { "jq" },
				yaml = { "yamlfmt_fix" },
				typescript = { "prettier" },
				ruby = { "rubocop" },
				sql = { "pg_format_fix" },
			},
			formatters = {
				black_venv = {
					command = ".venv/bin/black",
					args = { "--stdin-filename", "$FILENAME", "--quiet", "-" },
					cwd = require("conform.util").root_file({ "pyproject.toml" }),
					require_cwd = true,
				},
				pg_format_fix = {
					command = "pg_format",
					args = { "--function-case", "2", "--type-case", "2", "--keyword-case", "2", "-" },
				},
				yamlfmt_fix = {
					command = "/home/thomas/go/bin/yamlfmt",
					args = {
						"--formatter",
						"retain_line_breaks_single=true,scan_folded_as_literal=true,drop_merge_tag=true",
						"-",
					},
				},
			},
		})
	end,
}
