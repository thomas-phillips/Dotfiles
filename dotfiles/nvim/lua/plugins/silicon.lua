return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
  main = "nvim-silicon",
	opts = {
		disable_defaults = true,
    language = function()
      return vim.bo.filetype
    end,
		font = "JetBrainsMono NF=26",
		background = "#87f",
		theme = "Monokai Extended",
		no_line_number = false,
		pad_horiz = 15,
		pad_vert = 15,
    to_clipboard = true,
		no_window_controls = true,
		wslclipboard = "auto",
		wslclipboardcopy = "keep",
		output = function()
			return "/mnt/c/Users/thomas.phillips/Pictures/Code/" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_code.png"
		end,
	},
}
