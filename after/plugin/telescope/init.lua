local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


require('telescope').setup({
    defaults = {
        prompt_prefix = '🔍 ',
        file_ignore_patterns = {
            '.git/',
            'node_modules/',
            '.cache/'
        },
        dynamic_preview_title = true,
        vimgrep_arguments = {
            'rg',
            '--ignore',
            '--hidden',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim',
        },
    },
})


