local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

	api.config.mappings.default_on_attach(bufnr)
  -- custom mappings
  vim.keymap.set('n', '<Space>e', api.tree.toggle)
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = my_on_attach,
}

require("catppuccin").setup({
    integrations = {
        nvimtree = true,
        treesitter = true,
    }
})
