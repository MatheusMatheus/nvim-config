
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    },
    config = function()
      enable_git_status = true
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
      vim.keymap.set('n', '<C-c>', ':Neotree close<CR>', {})
      vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})
    default_component_configs = {
      container = {
                enable_character_fade = true
              },
              indent = {
                indent_size = 2,
                padding = 1, -- extra padding on left hand side
                -- indent guides
                with_markers = true,
                indent_marker = "│",
                last_indent_marker = "└",
                highlight = "NeoTreeIndentMarker",
                -- expander config, needed for nesting files
                with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
              },
              icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "󰜌",
                -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                -- then these will never be used.
                default = "*",
                highlight = "NeoTreeFileIcon"
              },
              modified = {
                symbol = "[+]",
                highlight = "NeoTreeModified",
              },
              name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
              },
              git_status = {
                symbols = {
                  -- Change type
                  added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                  modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                  deleted   = "✖",-- this can only be used in the git_status source
                  renamed   = "󰁕",-- this can only be used in the git_status source
                  -- Status type
                  untracked = "",
                  ignored   = "",
                  unstaged  = "󰄱",
                  staged    = "",
                  conflict  = "",
                }
              },
              -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
              file_size = {
                enabled = true,
                required_width = 64, -- min width of window required to show this column
              },
              type = {
                enabled = true,
                required_width = 122, -- min width of window required to show this column
              },
              last_modified = {
                enabled = true,
                required_width = 88, -- min width of window required to show this column
              },
              created = {
                enabled = true,
                required_width = 110, -- min width of window required to show this column
              },
              symlink_target = {
                enabled = false,
              }
    }
    end,

}
