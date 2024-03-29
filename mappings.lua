-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<C-l>"] = { "<cmd>bnext<cr>", desc = "Next tab" },
    ["<C-h>"] = { "<cmd>bprev<cr>", desc = "Previous tab" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- Telescope
    ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in current file" },
    -- Move cursor in soft wrapped lines
    ["j"] = { "gj" },
    ["k"] = { "gk" },
    -- Buffer navigation
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-l>"] = { "<right>", desc = "Cursor right" },
    ["<C-h>"] = { "<left>", desc = "Cursor left" },
    ["<C-k>"] = { "<up>", desc = "Cursor up" },
    ["<C-j>"] = { "<down>", desc = "Cursor down" },
    ["JJ"] = { "->" },
    ["KK"] = { "=>" },
  },
}
