return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    -- Enhance LSP capabilities for nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Configure clangd for C++
    lspconfig.clangd.setup {
      capabilities = capabilities,
      -- You can add more clangd settings here if needed
      cmd = { 'clangd' },
      filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
      root_dir = lspconfig.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git'),
    }
  end,
}
