return {
	"williamboman/mason.nvim",
	dependencies = {
	},
	config = function()
		-- import mason
		local mason = require("mason")
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}
