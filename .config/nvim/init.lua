-- Basic settings
vim.opt.number = true         -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.wrap = false          -- Don't wrap lines
vim.opt.scrolloff = 10        -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2        -- Tab width
vim.opt.shiftwidth = 2     -- Indent width
vim.opt.softtabstop = 2    -- Soft tab stop
vim.opt.expandtab = false  -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true  -- Case sensitive if uppercase in search
vim.opt.hlsearch = true   -- Don't highlight search results
vim.opt.incsearch = true  -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true                      -- Enable 24-bit colors
vim.opt.signcolumn = "yes"                        -- Always show sign column
vim.opt.colorcolumn = "100"                       -- Show column at 100 characters
vim.opt.showmatch = true                          -- Highlight matching brackets
vim.opt.matchtime = 2                             -- How long to show matching bracket
vim.opt.cmdheight = 1                             -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false                          -- Don't show mode in command line
vim.opt.pumheight = 10                            -- Popup menu height
vim.opt.pumblend = 10                             -- Popup menu transparency
vim.opt.winblend = 0                              -- Floating window transparency
vim.opt.conceallevel = 0                          -- Don't hide markup
vim.opt.concealcursor = ""                        -- Don't hide cursor line markup
vim.opt.lazyredraw = true                         -- Don't redraw during macros
vim.opt.synmaxcol = 300                           -- Syntax highlighting limit
vim.opt.winborder = 'rounded'

-- File handling
vim.opt.backup = false                            -- Don't create backup files
vim.opt.writebackup = false                       -- Don't create backup before writing
vim.opt.swapfile = false                          -- Don't create swap files
vim.opt.undofile = true                           -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300                          -- Faster completion
vim.opt.timeoutlen = 500                          -- Key timeout duration
vim.opt.ttimeoutlen = 0                           -- Key code timeout
vim.opt.autoread = true                           -- Auto reload files changed outside vim
vim.opt.autowrite = false                         -- Don't auto save

-- Behavior settings
vim.opt.hidden = true                   -- Allow hidden buffers
vim.opt.errorbells = false              -- No error bells
vim.opt.backspace = "indent,eol,start"  -- Better backspace behavior
vim.opt.autochdir = true                -- Don't auto change directory
vim.opt.iskeyword:append("-")           -- Treat dash as part of word
vim.opt.path:append("**")               -- include subdirectories in search
vim.opt.selection = "inclusive"         -- Selection behavior
vim.opt.mouse = "a"                     -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.modifiable = true               -- Allow buffer modifications

-- -- Cursor settings
-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Folding settings
vim.opt.foldmethod = "expr"                     -- Use expression for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99                          -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Key mappings
vim.g.mapleader = " "      -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key (NEW)

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

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

vim.pack.add({
	{ src = "https://github.com/metalelf0/black-metal-theme-neovim" },
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/m4xshen/autoclose.nvim" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/loctvl842/monokai-pro.nvim"},
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim"},
	{ src = "https://github.com/mfussenegger/nvim-jdtls"},
	{ src = "https://github.com/blazkowolf/gruber-darker.nvim" },
	{ src = "https://github.com/tahayvr/matteblack.nvim" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim"},
	{
		src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
		version = vim.version.range('3')
	},
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
})

require("ibl")

require('nvim-treesitter').install({ 'hyprlang' }):wait(300000) -- wait max. 5 minutes

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

require("autoclose").setup({
	escape = true,
})

require("vague").setup({
	transparent = true,
})

require("monokai-pro").setup({
	transparent_background = true,
})

local bufferline = require("bufferline")
bufferline.setup {
	options = {
		mode = "buffers",
		style_preset = bufferline.style_preset.default,
		close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
		indicator = {
			icon = '▎', -- this should be omitted if indicator style is not 'icon'
			style = 'icon',
		},
		buffer_close_icon = '󰅖',
		modified_icon = '● ',
		close_icon = ' ',
		left_trunc_marker = ' ',
		right_trunc_marker = ' ',
	}
}

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

require "mini.pick".setup()

require('luasnip').setup({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
})

require('blink.cmp').setup({
	keymap = {
		['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
		['<C-e>'] = { 'hide', 'fallback' },
		['<CR>'] = { 'accept', 'fallback' },

		['<Tab>'] = { 'snippet_forward', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'fallback' },

		['<Up>'] = { 'select_prev', 'fallback' },
		['<Down>'] = { 'select_next', 'fallback' },
		['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
		['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

		['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

		['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
	},
	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = {
			force_version = '*',
		},
	},
	completion = {
		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			}
		}
	}
})

vim.lsp.enable({ "lua_ls", "clangd", "jdtls" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
})

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('i', '<C-a>', "<Esc>A")

vim.keymap.set('i', '<C-o>', "<Esc>o")

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")


vim.o.background = "dark"
vim.cmd("colorscheme gruber-darker")
vim.cmd(":hi statusline guibg=NONE")

-- ============================================================================
-- USEFUL FUNCTIONS
-- ============================================================================

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		local line = mark[1]
		local ft = vim.bo.filetype
		if line > 0 and line <= lcount
			and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
			and not vim.o.diff then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

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
	end,
})

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

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- ============================================================================
-- STATUSLINE
-- ============================================================================

-- Git branch function
local function git_branch()
	local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
	if branch ~= "" then
		return "  " .. branch .. " "
	end
	return ""
end

-- File type with icon
local function file_type()
	local ft = vim.bo.filetype
	local icons = {
		lua = "[LUA]",
		python = "[PY]",
		javascript = "[JS]",
		html = "[HTML]",
		css = "[CSS]",
		json = "[JSON]",
		markdown = "[MD]",
		vim = "[VIM]",
		sh = "[SH]",
		c = "[C]",
		hyprlang = "[HYPR]",
	}

	if ft == "" then
		return "  "
	end

	return (icons[ft] or ft)
end

-- Word count for text files
local function word_count()
	local ft = vim.bo.filetype
	if ft == "markdown" or ft == "text" or ft == "tex" then
		local words = vim.fn.wordcount().words
		return "  " .. words .. " words "
	end
	return ""
end

-- File size
local function file_size()
	local size = vim.fn.getfsize(vim.fn.expand('%'))
	if size < 0 then return "" end
	if size < 1024 then
		return size .. "B "
	elseif size < 1024 * 1024 then
		return string.format("%.1fK", size / 1024)
	else
		return string.format("%.1fM", size / 1024 / 1024)
	end
end

-- Mode indicators with icons
local function mode_icon()
	local mode = vim.fn.mode()
	local modes = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK", -- Ctrl-V
		c = "COMMAND",
		s = "SELECT",
		S = "S-LINE",
		["\19"] = "S-BLOCK", -- Ctrl-S
		R = "REPLACE",
		r = "REPLACE",
		["!"] = "SHELL",
		t = "TERMINAL"
	}
	return modes[mode] or "  " .. mode:upper()
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size

vim.cmd([[
  highlight StatusLineBold gui=bold cterm=bold
]])

-- Function to change statusline based on window focus
local function setup_dynamic_statusline()
	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
		callback = function()
			vim.opt_local.statusline = table.concat {
				"  ",
				"%#StatusLineBold#",
				"%{v:lua.mode_icon()}",
				"%#StatusLine#",
				" │ %f %h%m%r",
				"%{v:lua.git_branch()}",
				" │ ",
				"%{v:lua.file_type()}",
				" | ",
				"%{v:lua.file_size()}",
				"%=", -- Right-align everything after this
				"%l:%c  %P ", -- Line:Column and Percentage
			}
		end
	})
	vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
		callback = function()
			vim.opt_local.statusline = "  %f %h%m%r │ %{v:lua.file_type()} | %=  %l:%c   %P "
		end
	})
end

setup_dynamic_statusline()
