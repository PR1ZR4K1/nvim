local keymap = vim.keymap -- for conciseness
vim.g.mapleader = " "

keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to System Clipboard" })

keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear Search Highlights" })

--increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment Number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement Number" }) -- decrement

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open New Tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Current Tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to Next Tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to Previous Tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open Current Buffer in New Tab" }) --  move current buffer to new tab

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Open Vertical Split" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Open Horizontal Split" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize Split Sizes" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split" }) -- close current split window

-- window resizing
keymap.set("n", "<M-b>",  "<C-w>5<", { desc = "Decrease Split Width" })
keymap.set("n", "<M-f>", "<C-w>5>", { desc = "Increase Split Width" })
keymap.set("n", "<M-Up>",    "<C-w>5+", { desc = "Increase Split Height" })
keymap.set("n", "<M-Down>",  "<C-w>5-", { desc = "Decrease Split Height" })

-- move line up/down (normal mode)
keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move Line Down" })
keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move Line Up" })

-- move selection up/down (visual mode)
keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
