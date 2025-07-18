return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },

    config = function ()
        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>pf", builtin.find_files, {desc = "Find Project Files"})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    end
}
