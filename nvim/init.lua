vim.loader.enable()

-- [[ bootstrap lazy ]] --
require("core.lazy").bootstrap()

-- [[ initialization ]] --
require("core.options")

-- [[ load plugins ]] --
require("core.lazy").load()

-- [[ More options ]]
require("core.post")

-- See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
