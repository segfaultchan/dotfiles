-- https://github.com/VonHeikemen/lsp-zero.nvim/
-- https://github.com/ray-x/lsp_signature.nvim
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/L3MON4D3/LuaSnip

return {

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",

		dependencies = {
			"ray-x/lsp_signature.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
		},

		config = function()

			-- Совсем чуть-чуть костыльная настройка рамки floating окна vim.lsp.buf.hover()
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
				vim.lsp.handlers.hover, {
					border = "single",
				}
			)

			local lsp_signature = require("lsp_signature")
			local lsp_zero = require("lsp-zero")
			local cmp = require("cmp")

			-- Инициализация и конфигурация lsp-zero и lsp-signature
			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({buffer = bufnr})

				lsp_signature.on_attach({
					hint_enable = false; -- Отключение дополнительных подсказок
					handler_opts = {
						border = "single",
					},
					bind = true; -- Обязательная опция, без которой lsp_signature невозможно сконфигурировать
				}, bufnr)
			end)


			lsp_zero.set_sign_icons({ -- Ручное объвление иконок для подсветки ошибок/предупреждений/подсказок и информации lsp-сервером
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",

			})

			-- Инициализация и конфигурация языковых серверов
			require("lspconfig").clangd.setup({

				cmd = {
					"clangd",
					"--function-arg-placeholders=0",
					"--background-index",
					"--header-insertion-decorators",
					"--completion-style=bundled",
					"--header-insertion=never"
				},

			})
			require("lspconfig").pyright.setup({})
			local MY_FQBN = "arduino:avr:uno"
			require("lspconfig").arduino_language_server.setup({
				cmd = {
					"arduino-language-server",
					"-cli-config", "~/.arduino15/arduino-cli.yaml",
					"-fqbn",
					MY_FQBN
				}
			})
			-- Инициализация и конфигурация cmp
			cmp.setup({
				-- Источники для completion-меню
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "luasnip" },
				},


				window = {

					completion = {
						border = "none",
						winhighlight = "Normal:CmpDocNormal",
					},

					documentation = {
						border = "single",
					},

				},

				view = {
					docs = {
						auto_open = false,
					},
				},

				preselect = "item", -- В completion-меню первый элемент активен изначально
				completion = {
					completeopt = "menu, menuone, noinsert, fuzzy"
				},

				formatting = {
					fields = {"menu", "abbr", "kind"}, -- Изменение порядка отображения полей
					format = function(entry, item)
						local menu_icon = { -- Ручное объявление иконок для каждого источника
							nvim_lsp = "λ",
							path = "~",
							luasnip = "⋗",
						}
						item.menu = menu_icon[entry.source.name] -- Добавление заданных иконок в поле "menu" вместо имени источника
						return item
					end,
				},

				mapping = cmp.mapping.preset.insert({

					["<CR>"] = cmp.mapping.confirm({select = false}), -- Используйте Enter для подтверждения выбора в completion-меню
					["<C-e>"] = cmp.mapping.abort(), -- Используйте Ctrl + E для того, чтобы принудительно отозвать completion-меню
					["<C-Space>"] = cmp.mapping.complete(), -- Используйте Ctrl + Space для того, чтобы вручную вызвать completion-меню

					--["<Tab>"] = cmp_action.tab_complete(), -- Используйте Tab для того, чтобы перемещаться по completion-меню вниз
					--["<S-Tab>"] = cmp_action.select_prev_or_fallback(), -- Используйте Shift + Tab для того, что перемещаться по completion-меню вверх

				}),

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

			})

		end,

	}

}
