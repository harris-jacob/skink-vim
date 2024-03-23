local builtin = require("telescope.builtin")
    
-- File pickers
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Telescope: Find Files'})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {desc = 'Telescope: Live Grep'})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = 'Telescope: Git Files'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Telescope: Buffers'})

vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Telescope: Show Help Tags'})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = 'Telescope: Show Keymaps'})
vim.keymap.set('n', '<leader>fll', builtin.loclist, {desc = 'Telescope: Show Location List for buffer'})

-- LSP Pickers
vim.keymap.set('n', '<leader>cd', builtin.diagnostics, {desc = 'Telescope: Show Diagnostics'})
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {desc = 'Telescope: Show LSP Implementations'})
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {desc = 'Telescope: Show LSP Definitions'})

-- Git Pickers
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {desc = 'Telescope: Show Git Commits'})
vim.keymap.set('n', '<leader>gbc', builtin.git_commits, {desc = 'Telescope: Show Git Branch Commits'})
vim.keymap.set('n', '<leader>gs', builtin.git_commits, {desc = 'Telescope: Show Git Status'})

-- 

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


