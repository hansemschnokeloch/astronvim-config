return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "solarized",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false, -- disabled in favor of lsp lines
    underline = false,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false,    -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
          "php",
          "twig",
          "htmldjango",
          "html",
          "lua",
          "nix",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      "intelephense",
      -- "phpactor",
      "eslint",
      "lua_ls",
      "nil_ls",
      -- "bashls",
    },
    config = {
      eslint = function()
        return {
          filetypes = {
            "twig",
            "html",
            "php",
            "javascript",
          },
          cmd = {
            "eslint",
          },
          root_dir = require("lspconfig.util").root_pattern "composer.json",
        }
      end,
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  plugins = {

    -- {
    --   -- override nvim-cmp plugin
    --   "hrsh7th/nvim-cmp",
    --   -- override the options table that is used in the `require("cmp").setup()` call
    --   opts = function(_, opts)
    --     -- opts parameter is the default options table
    --     -- the function is lazy loaded so cmp is able to be required
    --     local cmp = require "cmp"
    --     -- modify the sources part of the options table
    --     opts.sources = cmp.config.sources {
    --       -- { name = "copilot", priority = 1000 },
    --       { name = "nvim_lsp", priority = 1000 },
    --       { name = "luasnip",  priority = 750 },
    --       { name = "buffer",   priority = 500 },
    --       { name = "path",     priority = 250 },
    --     }
    --
    --     -- return the new table to be used
    --     return opts
    --   end,
    -- },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Disable automatic comment continuation for PHP",
      pattern = "php",
      callback = function() vim.opt.formatoptions:remove "r" end,
    })
    -- vim.filetype.add {
    --   extension = {
    --     twig = "twig.html",
    --   },
    -- }
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
  end,
}
