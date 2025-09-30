return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet engine and sources
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip',

    -- LSP completion source
    'hrsh7th/cmp-nvim-lsp',

    -- Additional completion sources
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- Load friendly snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Setup nvim-cmp
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        -- Your key mappings
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },
      sources = cmp.config.sources({
        -- LSP source
        { name = 'nvim_lsp' },
        -- Snippet source
        { name = 'luasnip' },
      }, {
        -- Buffer source
        { name = 'buffer' },
      }),
    }

    -- Command-line completion
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
