vim.loader.enable()

-- [[ bootstrap lazy ]] --
require("core.bootstrap")

-- [[ initialization ]] --
require("core.options")

-- [[ load plugins ]] --
require("core.lazy")

-- [[ More options ]]
require("core.post")
require("core.keys")

-- See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
