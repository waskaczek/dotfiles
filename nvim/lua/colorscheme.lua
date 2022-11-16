local status_cmp_ok, tn = pcall(require, "tokyonight")
if not status_cmp_ok then
    return
end

tn.setup(
    {
        style = "night"
    }
)
local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
