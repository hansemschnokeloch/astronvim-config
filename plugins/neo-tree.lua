return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.width = 60
    opts.window.mappings = {
      ["s"] = "prev_source",
      ["<space>"] = false, -- disable space until we figure out which-key disabling
    }
    opts.default_component_configs.indent = { indent_size = 2, padding = 1 }
    opts.event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          --auto close
          require("neo-tree.command").execute { action = "close" }
        end,
      },
    }
    opts.filesystem = {
      filtered_items = {
        visible = true,
      },
      follow_current_file = {
        enabled = true,  -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    }
  end,
}
