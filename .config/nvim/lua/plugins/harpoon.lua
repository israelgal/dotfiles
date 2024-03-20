return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
	local harpoon = require('harpoon')
	local map = vim.keymap.set
	-- Harpoon setup
	harpoon:setup()

	-- Harpoon append and toggle_quick_menu
	map("n", "<leader>a", function() harpoon:list():append() end)
	map("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

	map("n", "<C-r>", function() harpoon:list():select(1) end)
	map("n", "<C-i>", function() harpoon:list():select(2) end)
	map("n", "<C-o>", function() harpoon:list():select(3) end)
	map("n", "<C-p>", function() harpoon:list():select(4) end)

	-- Toggle previous & next buffers stored within Harpoon list
	map("n", "<C-P>", function() harpoon:list():prev() end)
	map("n", "<C-N>", function() harpoon:list():next() end)

    end,
}
