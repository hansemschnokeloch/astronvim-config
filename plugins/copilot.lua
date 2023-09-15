# See https://github.com/hatzz/dotfiles/blob/main/.config/astronvim-user/plugins/copilot.lua
return {
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup({
                suggestion = {
                    enabled = false,
                    panel = false,
                },
                filetypes = {
                    yaml = false,
                    ["yaml.ansible"] = true,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
            })
        end,
    },
    {
        'zbirenbaum/copilot-cmp',
        config = function()
            require('copilot_cmp').setup()
        end
    },
}
