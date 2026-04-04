return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Add File to Harpoon",
		},

		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Open Harpoon Menu",
		},
		{
			"<C-h>",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Jump to Harpoon File 1",
		},
		{
			"<C-t>",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Jump to Harpoon File 2",
		},
		{
			"<C-n>",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Jump to Harpoon File 3",
		},
		{
			"<C-s>",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Jump to Harpoon File 4",
		},
		{
			"<C-S-P>",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Go to Previous Harpoon File",
		},
		{
			"<C-S-N>",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Go to Next Harpoon File",
		},
	},
	dependencies = { "nvim-lua/plenary.nvim" },
}
