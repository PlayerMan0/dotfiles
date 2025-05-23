require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")

local function nmap(comb, cmd, desc)
  vim.api.nvim_set_keymap("n", comb, cmd, { noremap = true, silent = true, desc = desc })
end

nmap("<Up>", "<Up>zz")
nmap("<Down>", "<Down>zz")
nmap("Q", ":q<CR>")
nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")
nmap("<C-s>", ":w<CR>")
nmap("<C-b>", ":RunCode<CR>")

nmap("<leader>lr", ":VimtexCompile<CR>", "Run latex")
nmap("<leader>rc", ":RunCode<CR>", "Run code")
nmap("<leader>rt", ":lua require('render-markdown').toggle()<CR>", "Markdown render toggle")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})
