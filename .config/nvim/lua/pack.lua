vim.pack.add({
	-- Themes { src = "https://github.com/metalelf0/black-metal-theme-neovim" },
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/blazkowolf/gruber-darker.nvim" },
	{ src = "https://github.com/loctvl842/monokai-pro.nvim"},
	{ src = "https://github.com/tahayvr/matteblack.nvim" },
	{ src = "https://github.com/bluz71/vim-moonfly-colors"}, -- Lsp
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
	-- { src = "https://github.com/nvim-neo-tree/neo-tree.nvim"},
	{ src = "https://github.com/nvim-lua/plenary.nvim"},
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
	{ src = "https://github.com/kyazdani42/nvim-web-devicons"},
	{ src = "https://github.com/lewis6991/gitsigns.nvim"},
	{ src = "https://github.com/nvim-mini/mini.base16"},
	{ src = "https://github.com/nvim-mini/mini.nvim" },
})

--Themes
require("plugins.gruber-darker")
require("plugins.vague")

require("plugins.ibl")

require("plugins.surround")

--require("plugins.autoclose")

require("plugins.monokai-pro")

require("plugins.bufferline")

require("plugins.blink")

require("plugins.lsp")

-- mini files ----
local MiniFiles = require("mini.files")
MiniFiles.setup({
    mappings = {
        go_in = "<CR>",
        go_in_plus = "L",
        go_out = "<BS>",
        go_out_plus = "H",
		reset = "h",
    },
})

vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
-- vim.keymap.set("n", "-", function()
-- 	local state = MiniFiles.get_explorer_state()
-- end , { desc = "Toggle mini file explorer" })

-- vim.keymap.set("n", "<leader>e", function()
--     MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
--     MiniFiles.reveal_cwd()
-- end, { desc = "Toggle into currently opened file" })

---- mini notify ----
require("mini.notify").setup({
	-- only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

--- mini cmdline completion ---
-- require("mini.cmdline").setup({
--     autocorrect = { enable = false }
-- })

--- mini surround ---
require("mini.surround").setup()
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

--- mini picker ---
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")
MiniPick.setup()
MiniExtra.setup()

-- keymaps
-- vim.keymap.set("n", "<leader>pf", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>ps", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Grep word/Search word" })
--vim.keymap.set("n", "<leader>vh", function() MiniPick.builtin.help() end, { desc = "Mini Help" })

vim.keymap.set("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>pk", function() MiniExtra.pickers.keymaps() end, { desc = 'Search keymaps' })

-- --- mini completions --- 
-- require("mini.completion").setup({
--     lsp_completion = {
--         auto_setup = true,
--     }
-- })

--- mini snippets ---
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets
    },
})
MiniSnippets.start_lsp_server({ match = false })

--- mini diff and fugitive ---
local MiniDiff = require("mini.diff")
MiniDiff.setup({
	source = MiniDiff.gen_source.git({ index = false }),
})
