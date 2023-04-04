return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window = {
      width = 40,
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
    -- opts.filesystem = {
    --   filtered_items = {
    --     visible = true, -- If you set this to `true`, all "hide" just mean "dimmed out"
    --     -- hide_dotfiles = true,
    --     -- hide_gitignored = true,
    --   },
    -- }
    opts.sources = {
      "filesystem",
    }
  end,
}
