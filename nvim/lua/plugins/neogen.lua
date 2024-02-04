local status_ok, neogen = pcall(require, 'neogen')
if not status_ok then
    error(neogen)
    return
end

neogen.setup {
    enabled = true,
    languages = {
        python = {
            template = {
                annotation_convention = "google_docstrings"
            }
        }
    }
}
