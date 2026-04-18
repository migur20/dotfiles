-- Basic settings
vim.opt.number = true         -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.wrap = true          -- Don't wrap lines
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
-- vim.opt.colorcolumn = "100"                       -- Show column at 100 characters
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
	-- Themes
	{ src = "https://github.com/metalelf0/black-metal-theme-neovim" },
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/blazkowolf/gruber-darker.nvim" },
	{ src = "https://github.com/loctvl842/monokai-pro.nvim"},
	{ src = "https://github.com/tahayvr/matteblack.nvim" },
	-- Lsp
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	-- Utils
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/m4xshen/autoclose.nvim" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim"},
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim"},
	{ src = "https://github.com/nvim-lua/plenary.nvim"};
	{ src = "https://github.com/MunifTanjim/nui.nvim"},
	{ src = "https://github.com/kylechui/nvim-surround"},
	{ src = "https://github.com/ej-shafran/compile-mode.nvim"},
	{
		src = 'https://github.com/JavaHello/spring-boot.nvim',
		version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
	},
	{ src = 'https://github.com/MunifTanjim/nui.nvim'},
	{ src = 'https://github.com/mfussenegger/nvim-dap'},
	{ src = 'https://github.com/nvim-java/nvim-java'},
	-- { src = "https://github.com/max397574/startup.nvim"},
	{ src = "https://github.com/nvim-telescope/telescope.nvim"},
	{ src = "https://github.com/arsham/arshamiser.nvim" },
	{ src = "https://github.com/arsham/arshlib.nvim"},
	{ src = "https://github.com/famiu/feline.nvim"},
	{ src = "https://github.com/rebelot/heirline.nvim"},
	{ src = "https://github.com/kyazdani42/nvim-web-devicons"},
	{ src = "https://github.com/lewis6991/gitsigns.nvim"},
	{ src = "https://github.com/nvim-mini/mini.base16"}
})

-- require("arshamiser.feliniser")

-- require("startup").setup()

-- require"startup".create_mappings({
--   ["ff"]="<cmd>Telescope find_files<CR>",
--   ["fg"]="<cmd>Telescope live_grep<CR>",
-- })

vim.g.compile_mode = {
	default_command = {
		c = "make -k",
	},
	recompile_no_fail = true,
}

vim.keymap.set("n", "<leader>R", ":below Compile<CR>")
vim.keymap.set("n", "<leader>r", ":below Recompile<CR>")

require("ibl").setup()

require("nvim-surround").setup({
})

-- require('nvim-treesitter').install({ 'hyprlang' }):wait(300000) -- wait max. 5 minutes

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

require('java').setup()
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
-- vim.cmd(":hi statusline guibg=NONE")

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


  -- Define the path to your Matugen output
  local matugen_path = os.getenv("HOME") .. "/.config/matugen/generated/neovim-colors.lua"

  -- SAFEGUARD: A default palette to prevent crashes if Matugen hasn't run yet.
  -- This ensures vim.g.base16_guiXX globals exist for Lualine/Noice.
  local default_colors = {
	base00 = "#1e1e2e", base01 = "#181825", base02 = "#313244", base03 = "#45475a",
	base04 = "#585b70", base05 = "#cdd6f4", base06 = "#f5e0dc", base07 = "#b4befe",
	base08 = "#f38ba8", base09 = "#fab387", base0A = "#f9e2af", base0B = "#a6e3a1",
	base0C = "#94e2d5", base0D = "#89b4fa", base0E = "#cba6f7", base0F = "#f2cdcd"
  }

  -- Function to safely source the theme
  local function load_theme()
	-- OPTIMIZATION: Use libuv (fast) to check file existence
	if vim.uv.fs_stat(matugen_path) then
	  local ok, err = pcall(dofile, matugen_path)
	  if not ok then
		vim.notify("Matugen Load Error: " .. err, vim.log.levels.ERROR)
		-- FIX: Use your wrapper to set globals, not raw mini.base16
		require("base16-colorscheme").setup(default_colors)
	  end
	else
	  vim.notify("Matugen colors not found. Using safe defaults.", vim.log.levels.WARN)
	  -- FIX: Use your wrapper to set globals, ensuring Lualine doesn't crash
	  require("base16-colorscheme").setup(default_colors)
	end
  end

  -- 1. Load the theme
  load_theme()

  -- 2. Apply tweaks that must happen AFTER the theme loads
  local function apply_tweaks()
	vim.api.nvim_set_hl(0, "Comment", { italic = true })
	
	-- UI FIX: Remove background from NvimTree to make it blend with the terminal/transparency
	vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE", ctermbg = "NONE" })

	-- Reset cursor shape (Hyprland optimization)
	-- vim.opt.guicursor = "n-v-c:hor20-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
  end
  
  apply_tweaks()

  -- 3. Live Reloading (Libuv Signal Listener)
  -- This correctly listens for 'pkill -USR1 nvim' on Arch/Linux
  local signal = vim.uv.new_signal()
  signal:start("sigusr1", function()
	vim.schedule(function()
	  load_theme()
	  apply_tweaks()
	  -- Optional: Refresh lualine if it's loaded to pick up new globals
	  if package.loaded["lualine"] then
		require("lualine").refresh()
	  end
	  vim.notify("Theme reloaded via SIGUSR1")
		end)
  end)

vim.cmd("colorscheme vague")
