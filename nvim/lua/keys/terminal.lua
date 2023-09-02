return {
    -- toggle in terminal mode and normal
    {
        "<A-i>",
        function()
            require("nvterm.terminal").toggle("float")
        end,
        mode = { "n", "t" },
        desc = "Toggle floating term",
    },

    {
        "<A-h>",
        function()
            require("nvterm.terminal").toggle("horizontal")
        end,
        mode = { "n", "t" },
        desc = "Toggle horizontal term",
    },
    {
        "<A-v>",
        function()
            require("nvterm.terminal").toggle("vertical")
        end,
        mode = { "n", "t" },
        desc = "Toggle vertical term",
    },
}
