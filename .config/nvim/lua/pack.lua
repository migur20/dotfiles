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
	{ src = "https://github.com/nvim-mini/mini.base16"}
})

--Themes
require("plugins.gruber-darker")
require("plugins.vague")

require("plugins.ibl")

require("plugins.surround")

--require("plugins.autoclose")

require("plugins.monokai-pro")

require("plugins.bufferline")

require("plugins.minipick")

require("plugins.blink")

require("plugins.java")
