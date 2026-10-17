do
  -- Enable faster startup by caching compiled Lua modules
  vim.loader.enable()

  vim.g.have_nerd_font = true

  -- Make line numbers default
  vim.o.number = true

  -- Keep signcolumn on by default
  vim.o.signcolumn = 'yes'

  -- Sets how neovim will display certain whitespace characters in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  --
  --  Notice listchars is set using `vim.opt` instead of `vim.o`.
  --  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
  --   See `:help lua-options`
  --   and `:help lua-guide-options`
  vim.o.list = true
  vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
end

do
  vim.pack.add({ 'https://github.com/RRethy/base16-nvim' })

  -- transparency: clear backgrounds whenever a colorscheme is applied
  local function transparent()
    for _, g in ipairs({ 'Normal', 'NormalNC', 'NormalFloat', 'FloatBorder', 'SignColumn',
                         'LineNr', 'FoldColumn', 'EndOfBuffer', 'MsgArea' }) do
      local hl = vim.api.nvim_get_hl(0, { name = g, link = false })
      hl.bg = nil
      vim.api.nvim_set_hl(0, g, hl)
    end
  end
  vim.api.nvim_create_autocmd('ColorScheme', { callback = transparent })

  local ok, matugen = pcall(require, 'matugen')
  if ok then matugen.setup() end -- Noctalia-generated theme
  transparent()
end
