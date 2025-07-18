return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
       require("catppuccin").setup({
           color_overrides = {
               all = {
                   base = "#0F0F17",
               }
           }
       })

       vim.cmd('colorscheme catppuccin-mocha')
    end
}
