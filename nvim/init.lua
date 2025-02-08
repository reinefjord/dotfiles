----- BEGIN lazy.nvim boilerplate -----
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
    print('Installing lazy.nvim....')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
    print('Done.')
end

vim.opt.rtp:prepend(lazypath)
----- END lazy.nvim boilerplate -----


----- BEGIN plugins -----
require('lazy').setup({
    -- lsp
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    --
    {'nvim-treesitter/nvim-treesitter'},
    {'Darazaki/indent-o-matic'},
    -- {'gleam-lang/gleam.vim'},
})
----- END plugins -----


----- BEGIN keymap -----
vim.g.mapleader = ' '
vim.keymap.set('n', '<Leader>h', ':set hlsearch!<cr>')
vim.keymap.set('n', '<Leader>r', ':set relativenumber!<cr>')
vim.keymap.set('n', '<Leader>n', ':set number!<cr>')
vim.keymap.set('n', '<tab>', ':bn<cr>')
vim.keymap.set('n', '<S-tab>', ':bp<cr>')
vim.keymap.set('n', '<Leader>d', ':lua vim.diagnostic.open_float()<cr>')
--vim.keymap.set('n', '<Leader>W', ':%s/\s\+$\<Bar> \+\ze\t//g<cr>')
---- END keymap -----


----- BEGIN colors -----
vim.opt.termguicolors = true
vim.opt.background = "light"
vim.cmd.colorscheme("vacme")
----- END colors -----


----- BEGIN visuals -----
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { nbsp = '⍽', tab = '▸·', trail = '•' }
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
----- END visuals -----


----- BEGIN tabs -----
--vim.opt.breakindent = true
--vim.opt.tabstop = 4
--vim.opt.shiftwidth = 4
--vim.opt.expandtab = true
----- END tabs -----


----- BEGIN misc -----
vim.opt.mouse = 'c'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
----- END misc -----


----- BEGIN lsp-zero -----
-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- python
require('lspconfig').ruff.setup({})

-- gleam
require('lspconfig').gleam.setup({})

-- Autocompletion config
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})
----- END lsp-zero -----


----- BEGIN treesitter -----
require'nvim-treesitter.configs'.setup {
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}
----- END treesitter -----
