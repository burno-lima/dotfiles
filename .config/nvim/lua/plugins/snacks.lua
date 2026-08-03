return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			sources = {
				-- explorer (<leader>e) — mostra dotfiles, mas não o .git
				explorer = { hidden = true, exclude = { ".git" } },
				-- busca de arquivos (<leader><space>, <leader>ff)
				files = { hidden = true },
				-- live grep (<leader>/, <leader>sg)
				grep = { hidden = true },
			},
		},
	},
}
