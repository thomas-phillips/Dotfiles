local M = {}

function M.cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

function M.map(mode, l, r, opts, bufnr)
	opts = opts or {}
	opts.buffer = bufnr
	vim.keymap.set(mode, l, r, opts)
end

return M
