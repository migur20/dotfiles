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
