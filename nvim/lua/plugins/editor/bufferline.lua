return {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'none',
            },
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true,
                }
            },
        },
    },
}
