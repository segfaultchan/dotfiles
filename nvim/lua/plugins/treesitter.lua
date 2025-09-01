-- https://github.com/nvim-treesitter/nvim-treesitter

return {

	{
		"nvim-treesitter/nvim-treesitter",

		opts = {
			ensure_installed = { "nasm", "cpp", "c", "python", "bash", "lua" },

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			}
		}

	}

}
