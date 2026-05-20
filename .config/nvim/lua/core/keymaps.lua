vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('i', '<C-a>', "<Esc>A")

vim.keymap.set('i', '<C-o>', "<Esc>o")

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better paste behavior
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Better window navigation
vim.keymap.set({"n", "t"}, "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set({"n", "t"}, "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set({"n", "t"}, "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set({"n", "t"}, "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting && Resizing
vim.keymap.set('n', '<leader>|', ':vsplit<CR>')
vim.keymap.set('n', '<leader>-', ':split<CR>')
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Increase window width" })

-- Quick config editing
vim.keymap.set("n", "<leader>ce", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>cr", ":so $MYVIMRC<CR>", { desc = "Reload config" })

-- vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

vim.keymap.set("n", "<leader>R", ":below Compile<CR>")
vim.keymap.set("n", "<leader>r", ":below Recompile<CR>")

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- native undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })
