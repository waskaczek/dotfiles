local status_ok, rule, npairs

status_ok, npairs = pcall(require, 'nvim-autopairs')
if not status_ok then
    error(npairs)
  return
end

status_ok, rule = pcall(require, 'nvim-autopairs.rule')
if not status_ok then
    error(rule)
  return
end

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

-----------------------------------
-- Treesitter
-----------------------------------
local ts_conds = require('nvim-autopairs.ts-conds')

npairs.add_rules({
  rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})

-----------------------------------
-- cmp 
-----------------------------------
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
