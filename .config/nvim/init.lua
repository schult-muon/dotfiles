vim.cmd("filetype on")
vim.cmd("filetype indent off")

vim.cmd.colorscheme('desert')
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg="darkgray" })

vim.g.mapleader = " "

vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "+1,+21,+41"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.listchars:append {
    tab = "→ ",
    trail = "·",
}
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.textwidth = 80
vim.opt.title = true
vim.opt.undofile = true
vim.opt.wrap = false

--------------------------------------------------------------------------------

vim.diagnostic.config({
    jump = { float = true },
    severity_sort = true,
})

--------------------------------------------------------------------------------

-- Don't accidentally open help
vim.keymap.set({"", "i"}, "<F1>", "<Esc>", { noremap=true })

-- Make wrapped lines less annoying
vim.keymap.set("n", "j", "gj", { noremap=true })
vim.keymap.set("n", "k", "gk", { noremap=true })

-- Shortcuts
vim.keymap.set("n", ";", ":", { noremap=true })
vim.keymap.set("n", "U", "<C-r>", { noremap=true })
vim.keymap.set("n", "<leader>w", ":%s/\\s\\+$//<cr>:let @/=''<cr>|<C-o>", { noremap=true })
vim.keymap.set("v", "<leader>s", ":sort i<cr>", { noremap=true })

-- LSP
----------------------------------------
-- K     " vim.lsp.buf.hover()
-- ]d    " vim.diagnostic.goto_next()
-- [d    " vim.diagnostic.goto_prev()
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap=true })
vim.keymap.set("n", "<F10>", ":LspClangdSwitchSourceHeader<cr>", { noremap=true, silent=true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap=true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap=true })
-- grr   " vim.lsp.buf.references()
-- grn   " vim.lsp.buf.rename()
--
-- gri   " vim.lsp.buf.implementation()
-- gra   " vim.lsp.buf.code_action()
-- gO    " vim.lsp.buf.document_symbol()
-- <C-s> " vim.lsp.buf.signature_help()
-- ???   " vim.lsp.buf.type_definition()
vim.keymap.set("x", "<leader>f", ":lua vim.lsp.buf.format({async = true})<cr>", { silent=true })
vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format({async = true})<cr>", { silent=true })

-- Quickfix Window
----------------------------------------
-- :ccl   " Close it
-- :copen " Open it
-- :cw    " Open it only if there are "errors"
-- :cn    " Go to the next error in the window
-- :cp    " Go to the previous error in the window
-- :cnf   " Go to the first error in the next file

--------------------------------------------------------------------------------

-- NOTE: Configure your build system to generate `compile_commands.json`, and
-- create a symlink to it in your project root
vim.lsp.enable('clangd')

vim.lsp.enable('cmake')
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')

--------------------------------------------------------------------------------

local cmp = require("cmp")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup({
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
            { name = 'nvim_lsp' },
        }, {
            { name = 'buffer' },
    })
})

vim.lsp.config('*', { capabilities = capabilities })
