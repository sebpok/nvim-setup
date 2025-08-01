
vim.lsp.enable({
    "lua_ls",
    "gopls",
    "vue_ls",
    "vtsls",
    "cssls",
    "tailwindcss",
    "html",
    "intelephense",
    "sqlls"
})

vim.diagnostic.config({
--    virtual_lines = {
--        current_line = true,
--    },
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅙",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
