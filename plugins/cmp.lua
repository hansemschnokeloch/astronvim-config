# See https://github.com/hatzz/dotfiles/blob/main/.config/astronvim-user/plugins/cmp.lua
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "zbirenbaum/copilot-cmp",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      local compare = require("cmp.config.compare")

      -- Thanks /u/JoseConseco_
      opts.sorting = {
        priority_weight = 2,
        comparators = {
          -- compare.score_offset, -- not good at all
          compare.locality,
          compare.recently_used,
          compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
          compare.offset,
          compare.order,
          -- compare.scopes, -- what?
          -- compare.sort_text,
          -- compare.exact,
          compare.kind,
          -- compare.length, -- useless
        },
      }

      local border_opts = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      }

      opts.window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
      }
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "copilot",  priority = 700 },
        { name = "buffer",   priority = 500 },
        { name = "path",     priority = 250 },
        { name = "luasnip",  priority = 100 },
      })

      return opts
    end,
  },
}
