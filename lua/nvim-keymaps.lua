local keymap = vim.keymap -- for conciseness
vim.g.mapleader = " "

keymap.set({ "n", "v" }, "<leader>y", [["+y]])

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

--increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- window resizing
keymap.set("n", "<M-b>",  "<C-w>5<", { desc = "Decrease window width" })
keymap.set("n", "<M-f>", "<C-w>5>", { desc = "Increase window width" })
keymap.set("n", "<M-Up>",    "<C-w>5+", { desc = "Increase window height" })
keymap.set("n", "<M-Down>",  "<C-w>5-", { desc = "Decrease window height" })

-- move line up/down (normal mode)
keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- move selection up/down (visual mode)
keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

