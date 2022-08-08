require("plugins")

-- basic
vim.opt.fenc = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.hidden = true

-- tab, indent
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

-- appearance
vim.opt.number = true
vim.opt.laststatus = 3
vim.opt.scrolloff = 4
vim.opt.list = true
vim.opt.listchars = { tab = '▸-', trail = '-' }

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true

-- keymapping
local noremap = { noremap = true }
vim.keymap.set("i", "jj", "<ESC>", noremap)
vim.keymap.set("n", "j", "gj", noremap)
vim.keymap.set("n", "k", "gk", noremap)
vim.keymap.set("n", "gj", "j", noremap)
vim.keymap.set("n", "gk", "k", noremap)

vim.keymap.set("n", "s", "<Nop>")
vim.keymap.set("n", "ss", ":<C-u>sp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "sv", ":<C-u>vs<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "sj", "<C-w>j", noremap)
vim.keymap.set("n", "sk", "<C-w>k", noremap)
vim.keymap.set("n", "sh", "<C-w>h", noremap)
vim.keymap.set("n", "sl", "<C-w>l", noremap)
vim.keymap.set("n", "sr", "<C-w>r", noremap)

vim.keymap.set("n", "<ESC><ESC>", ":<C-u>noh<CR>", { noremap = true, silent = true })
