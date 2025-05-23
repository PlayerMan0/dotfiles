require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "lua", "rust_analyzer", "texlab" }
vim.lsp.enable(servers)
