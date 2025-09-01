-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/nvim-lua/plenary.nvim
-- https://github.com/nvim-tree/nvim-web-devicons
-- https://github.com/MunifTanjim/nui.nvim 

return {

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- Не обязательная, но рекомендованная зависимость
			"MunifTanjim/nui.nvim",
		},

		config = function()
			vim.g.neo_tree_remove_legacy_commands = 1

			require("neo-tree").setup({

				close_if_last_window = false,
				enable_git_status = false,
				enable_diagnostics = true,
				popup_border_style = "rounded",
				open_files_do_not_replace_types = { "terminal", "trouble", "qf" },

			})
		end,

	}
}
