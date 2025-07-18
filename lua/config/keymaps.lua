-- Which-key groups
local wk = require("which-key")
wk.add({
	{ "<leader>f", group = "Find/Go to" },
	{ "<leader>c", group = "Code" },
	{ "<leader>C", group = "Copilot" },
	{ "<leader>e", group = "Explorer (yazi)" },
	{ "<leader>g", group = "Git" },
})

-- Telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Go to definition' })
-- vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Go to references' })
vim.keymap.set("n", "<leader>fT", "<cmd>TodoTelescope<cr>", { desc = "Telescope find TODOs" })

-- Lazygit keymaps
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
vim.keymap.set("n", "<leader>Cc", "<cmd>CopilotChatToggle<cr>", { desc = "Copilot chat toggle" })

-- Gitsign keymaps
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end)

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end)

		-- Actions
		map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
		map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })

		map("v", "<leader>gs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage hunk" })

		map("v", "<leader>gr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset hunk" })

		map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
		map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })
		map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
		map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

		map("n", "<leader>gb", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Blame line" })

		map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })

		map("n", "<leader>gD", function()
			gitsigns.diffthis("~")
		end, { desc = "Diff this ~" })

		-- map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
		-- map('n', '<leader>hq', gitsigns.setqflist)

		-- Toggles
		map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
		map("n", "<leader>gw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

		-- Text object
		map({ "o", "x" }, "gh", gitsigns.select_hunk, { desc = "Select hunk" })
	end,
})

-- Project manager keymaps
vim.keymap.set("n", "<leader>p", "<cmd>NeovimProjectHistory<cr>", { desc = "Projects" })
