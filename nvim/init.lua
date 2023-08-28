vim.loader.enable()

-- [[ bootstrap lazy ]] --
require("core.bootstrap")

-- [[ initialization ]] --
require("core.options")

-- [[ init plugins ]] --
require("core.lazy")

-- [[ More options ]]
require("core.post")

-- See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
