require('which-key').setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = { operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 4, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    -- triggers = "auto", -- automatically setup triggers
    triggers = { "<leader>" }, -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {



    -- ignore
    ["1"] = "which_key_ignore",
    ["2"] = "which_key_ignore",
    ["3"] = "which_key_ignore",
    ["4"] = "which_key_ignore",
    ["5"] = "which_key_ignore",
    ["6"] = "which_key_ignore",
    ["7"] = "which_key_ignore",
    ["8"] = "which_key_ignore",
    ["9"] = "which_key_ignore",

    -- single
    ["'"] = { ':FloattermToggle<CR>', },
    ["="] = { '<cmd>vertical resize +5<CR>', 'resize +5' },
    ["-"] = { '<cmd>vertical resize -5<CR>', 'resize +5' },
    ["v"] = { '<C-W>v', 'split right' },
    ["V"] = { '<C-W>s', 'split below' },

    ["/"] = {
        name = "Dashboard",
        ["/"] = { '<cmd>Dashboard<CR>', 'open dashboard' },
        ["c"] = { ':e $MYVIMRC<CR>', 'open init' },
        ["s"] = { '<cmd>PackerSync<CR>', 'packer sync' },
        ["u"] = { '<cmd>PackerUpdate<CR>', 'packer update' },
    },

    a = {
        name = "Actions",
        n = { '<cmd>set nonumber!<CR>', 'line numbers' },
        r = { '<cmd>set norelativenumber!<CR>', 'relative number' },
        t = { '<cmd>ToggleTerm direction=float<CR>', 'terminal float' },
    },

    b = {
        name = "Buffer",
        b = { '<cmd>BufferMovePrevious<CR>', 'Move back' },
        c = { '<cmd>BufferCloseAllButCurrent<CR>', 'Close but current' },
        d = { '<cmd>BufferOrderByDirectory<CR>', 'Order by directory' },
        f = { '<cmd>bfirst<CR>', 'First buffer' },
        l = { '<cmd>BufferCloseBuffersLeft<CR>', 'Close Left' },
        r = { '<cmd>BufferCloseBuffersRight<CR>', 'Close Right' },
        n = { '<cmd>BufferMoveNext<CR>', 'Move next' },
        p = { '<cmd>BufferPick<CR>', 'Pick Buffer' },
    },

    c = {
        name = "LSP",
        a = { 'code action' },
        d = { '<cmd>TroubleToggle<CR>', 'local diagnostics' },
        D = { '<cmd>Telescope diagnostics<CR>', 'workspace diagnostics' },
        f = { 'format' },
        i = { '<cmd>TSLspImportAll<CR>', 'import all' },
        l = { 'line diagnostics' },
        o = { '<cmd>TSLspOrganize<CR>', 'organize imports' },
        q = { '<cmd>TSLspFixCurrent<CR>', 'quick fix' },
        r = { 'rename' },
        s = { '<cmd>Telescope symbols<CR>', 'symbols' },
        t = { '<cmd>LspToggleAutoFormat<CR>', 'toggle format on save' },
    },

    d = {
        name = "Debug",
    },

    f = {
        name = "Find",
        f    = { ":Telescope find_files<cr>", "Find Files" },
        k    = { ":Telescope buffers<cr>", "Find in buffers" },
        s    = { ":Telescope live_grep<cr>", "Live grep" },
        w    = { ":Telescope grep_string<cr>", "Grep string" },
        p    = { "<cmd>lua require('skink-vim.plugins.telescope.mappings').project_files()<cr>", "Project Files" },
        e    = {
            name = "Environment",
            d    = { '<cmd>lua require("skink-vim.plugins.telescope.mappings").edit_neovim()<CR>', 'dotfiles' },
        }
    },

    g = {
        name = "Git",
        a = { '<cmd>!git add %:p<CR>', 'add current' },
        A = { '<cmd>!git add .<CR>', 'add all' },
        b = { '<cmd>lua require("blame").open()<CR>', 'blame' },
        B = { '<cmd>Telescope git_branches<CR>', 'branches' },
        d = { '<cmd>lua require("plugins.diffview").toggle()<CR>', 'diff file' },
        s = { '<cmd>Telescope git_status<CR>', 'status' },
        c = { '<cmd>Telescope git_commits<CR>', 'commits' },
    },

    p = {
        -- TODO
        name = "Project",
    },
}

local wk = require "which-key"
wk.register(mappings, opts)

local function attach_markdown(bufnr)
    wk.register({
        a = {
            name = "Actions",
            m = { '<cmd>MarkdownPreviewToggle<CR>', 'markdown preview' },
        }
    }, {
        buffer = bufnr,
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
    })
end

return {
    attach_markdown = attach_markdown
}
