return {
    -- toggle in terminal mode
    t = {
        ["<A-i>"] = { function() require("nvterm.terminal").toggle("float") end, "Toggle floating term" },
        ["<A-h>"] = { function() require("nvterm.terminal").toggle("horizontal") end, "Toggle horizontal term", },
        ["<A-v>"] = { function() require("nvterm.terminal").toggle("vertical") end, "Toggle vertical term" },
    },

    -- toggle in normal mode
    n = {
        ["<A-i>"] = { function() require("nvterm.terminal").toggle("float") end, "Toggle floating term" },
        ["<A-h>"] = { function() require("nvterm.terminal").toggle("horizontal") end, "Toggle horizontal term" },
        ["<A-v>"] = { function() require("nvterm.terminal").toggle("vertical") end, "Toggle vertical term" },
    },
}
