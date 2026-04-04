return {
    "TheLazyCat00/runner-nvim",
    opts = {}, -- This is required to call setup()
    keys = {
        { "<leader>r", function () require("runner-nvim").runLast() end, desc = "Re-run Last Command" },
        { "<leader>o", function () require("runner-nvim").run() end, desc = "Run Command" },
        { "<leader>t", function () require("runner-nvim").toggle() end, desc = "Toggle Runner Terminal" },
    }
}
