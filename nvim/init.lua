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
    -- lsp-zero
    {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    --
    {'Darazaki/indent-o-matic'},
    {'nvim-treesitter/nvim-treesitter'}
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
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
----- END tabs -----


----- BEGIN misc -----
vim.opt.mouse = 'c'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
----- END misc -----


----- BEGIN lsp-zero -----
local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

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
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- python
require'lspconfig'.ruff.setup{}

-- gleam
require'lspconfig'.gleam.setup{}
----- END lsp-zero -----


----- BEGIN treesitter -----
require'nvim-treesitter.configs'.setup {
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },
}
----- END treesitter -----
