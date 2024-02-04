local status_ok, markdown = pcall(require, 'markdown-preview')
if not status_ok then
    error(markdown)
  return
end

markdown.setup({
    mkdp_auto_start = true
})
