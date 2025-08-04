    return {
      'nvim-tree/nvim-tree.lua',
      keys = {
        -- Example hotkey: <leader>e to toggle nvim-tree
        { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
        -- Add other nvim-tree specific keymaps here if needed
      },
      dependencies = {
        'nvim-tree/nvim-web-devicons', -- Required for icons
      },
      config = function()
        require('nvim-tree').setup({
          sort_by = "case_sensitive",
          view = {
            width = 30,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = true,
          },
          disable_netrw = true,
          hijack_netrw = true,
        })
      end,
    }
