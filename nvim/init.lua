require(".lazynvim")

vim.keymap.set("n", "<C-t>", ":Neotree float focus <CR>", {silent = true})
vim.keymap.set("n", "<C-g>", ":Neotree left toggle <CR>", {silent = true})
vim.keymap.set("n", "<C-c>", ":lua vim.lsp.buf.hover() <CR>", {buffer = bufnr, silent = true})
vim.keymap.set("n", "<C-s>", ":ToggleTerm <CR>", {silent = true})
vim.keymap.set("n", "<F5>",  ":TermExec cmd='make run' <CR>", {silent = true})
vim.keymap.set("n", "<C-n>", ":lua vim.o.number = not vim.o.number <CR>", {silent = true})

vim.keymap.set("t", "<Esc>", "exit <CR>", {silent = true})

vim.keymap.set("i", "<C-->", "—")
vim.keymap.set("i", "<C-2>", "«» <Left><Left>")

vim.cmd.colorscheme "tokyonight-moon"
-- vim.cmd.colorscheme "kanagawa-dragon"

vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "number"
vim.opt.linebreak = true
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smarttab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300

vim.api.nvim_set_hl(0, "NormalFloat", {
	fg = "none",
	bg = "none",
})


vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {

	pattern = { "*.h", "*.hpp" },
	callback = function()
		vim.diagnostic.disable(0)
	end,

})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {

	pattern = { "*.asm", "*.ino", "*.c", "*.cpp", "*.h", "*.hpp", "*.lua", "*.py", "*.sh", "Makefile", "makefile" },
	callback = function()
		vim.opt.number = true
	end,

})
