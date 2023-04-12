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
          require("neo-tree").close_all()
        end,
      },
    }
    opts.filesystem = {
      filtered_items = {
        visible = true,
      },
    }
  end,
}
