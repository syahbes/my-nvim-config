-- autopairs.lua
local autopairs = require('nvim-autopairs')

autopairs.setup({
    check_ts = true,  -- Use treesitter to check for pairs
    ts_config = {
        lua = {'string'},-- Don't add pairs in lua string treesitter nodes
        javascript = {'template_string'},
    },
    disable_filetype = { "TelescopePrompt" },
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
})

-- Integration with nvim-cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)