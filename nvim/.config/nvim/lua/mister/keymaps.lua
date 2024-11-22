local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- mister
keymap.set("n", "J", "mzJ`z")

-- moving lines chief
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv") -- move line down(v)
keymap.set("n", "<A-Down>", ":m .+1<CR>==")
keymap.set("n", "<A-Up>", ":m .-2<CR>==")

-- open explorer
vim.keymap.set("n", "<leader>ff", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- better navigation
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- best remaps ever
keymap.set("n", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')
keymap.set("n", "y", '"*y')

-- redo
keymap.set("n", "U", "<cmd>redo<CR>")

-- visual mode
keymap.set("v", "<leader>p", '"_dP')
keymap.set("v", "<leader>y", '"+y')

-- buffer navigation
keymap.set("n", "<C-w>p", vim.cmd.bprevious)
keymap.set("n", "<C-w>n", vim.cmd.bnext)
keymap.set("n", "<C-w>d", vim.cmd.bdelete)

-- windows
keymap.set("n", "<C-w>|", vim.cmd.vsplit)
keymap.set("n", "<C-w>-", vim.cmd.split)
keymap.set("n", "<C-w>w", vim.cmd.close)

-- neogit
keymap.set("n", "<leader>gg", vim.cmd.Neogit)

-- shell command
keymap.set("n", "<leader>e", ":!")

-- rezise windows
keymap.set("n", "<C-Up>", "<C-w>5+")
keymap.set("n", "<C-Down>", "<C-w>5-")
keymap.set("n", "<C-Left>", "<C-w>5<")
keymap.set("n", "<C-Right>", "<C-w>5>")

-- conform
keymap.set("n", "<leader>fm", ":Format<CR>")

-- term stuff
keymap.set("n", "<A-j>", ":ToggleTerm<CR>")
keymap.set("v", "<A-j>", ":ToggleTerm<CR>")
keymap.set('t', '<A-j>', '<C-\\><C-n>:ToggleTerm<CR>', {noremap = true, silent = true})
function _G.set_terminal_keymaps()
	local hi = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], hi)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], hi)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()") -- command

-- scratch buffer
keymap.set("n", "<leader>bs", ":Scratch<CR>")
