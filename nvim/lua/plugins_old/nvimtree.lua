local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
    error(tree)
    return
end

tree.setup {
    disable_netrw       = true,
    hijack_netrw        = false,
    open_on_tab         = false,
    hijack_cursor       = true,
    hijack_directories  = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = true,
        custom = {},
        exclude = {'.gitignore'}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 40,
        side = 'left',
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
}

