local status_ok, bufferline= pcall(require, 'bufferline')
if not status_ok then
    error(bufferline)
  return
end

bufferline.setup{
    options = {
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
    }
}
