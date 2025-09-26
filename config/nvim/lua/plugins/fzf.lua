-- En tu archivo de plugins (ej: ~/.config/nvim/lua/plugins/fzf.lua)
return {
	{
		"ibhagwan/fzf-lua",
		-- Opcional: Especifica una rama/tag (ej: "main" o "v1.0.0")
		branch = "main",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Opcional: para íconos
		config = function()
			-- Configuración básica de fzf-lua (opcional)
			require("fzf-lua").setup({
				-- Personaliza tus opciones aquí (ej: previewers, keymaps)
			})
		end,
	},
}
