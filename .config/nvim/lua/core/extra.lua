vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		assert(client ~= nil)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

-- ============================================================================
-- USEFUL FUNCTIONS
-- ============================================================================

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- -- Return to last edit position when opening files
-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	group = augroup,
-- 	callback = function()
-- 		local mark = vim.api.nvim_buf_get_mark(0, '"')
-- 		local lcount = vim.api.nvim_buf_line_count(0)
-- 		local line = mark[1]
-- 		local ft = vim.bo.filetype
-- 		if line > 0 and line <= lcount
-- 			and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
-- 			and not vim.o.diff then
-- 			pcall(vim.api.nvim_win_set_cursor, 0, mark)
-- 		end
-- 	end,
-- })

-- Set filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "lua", "python" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "javascript", "typescript", "json", "html", "css" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd("TermClose", {
	group = augroup,
	callback = function()
		if vim.v.event.status == 0 then
			vim.api.nvim_buf_delete(0, {})
		end
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end, })

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand('<afile>:p:h')
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, 'p')
		end
	end,
})

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
