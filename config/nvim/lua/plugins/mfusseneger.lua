return {
	"mfussenegger/nvim-lint",
	event = "LazyFile",
	opts = {
		linters_by_ft = {
			lua = { "selene" },
			python = { "ruff" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			vue = { "eslint_d" },
			html = { "htmlhint" },
			css = { "stylelint" },
			scss = { "stylelint" },
			yaml = { "yamllint" },
			markdown = { "markdownlint" },
			sh = { "shellcheck" },
			dockerfile = { "hadolint" },
			terraform = { "tflint" },
			["*"] = { "typos" },
		},
		linters = {
			typos = {
				condition = function(ctx)
					return vim.fs.find({ "typos.toml", ".typos.toml" }, {
						path = ctx.filename,
						upward = true,
					})[1]
				end,
			},
		},
	},
}
