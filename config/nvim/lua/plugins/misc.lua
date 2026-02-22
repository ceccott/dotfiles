-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
	{ "chrisgrieser/nvim-spider", opts = { skipInsignificantPunctuation = true, subwordMovement = true } },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
	{ "tpope/vim-surround" },
	{ "David-Kunz/gen.nvim" },
	{ "tpope/vim-fugitive" },
	{ "mfussenegger/nvim-dap-python" },
	{ "mattesgroeger/vim-bookmarks" },
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup({
				highlight_hovered_item = true,
				auto_preview = true,
				width = 15,
			})
		end,
	},
	{ "vim-scripts/systemrdl.vim" },
  -- {
  --   "gutsavgupta/nvim-gemini-companion",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   event = "VeryLazy",
  --   config = function()
  --     -- You can configure the plugin by passing a table to the setup function.
  --     -- Example:
  --     -- require("gemini").setup({
  --     --   cmds = {"gemini"},
  --     --   win = {
  --     --     preset = "floating",
  --     --     width = 0.8,
  --     --     height = 0.8,
  --     --   }
  --     -- })
  --     require("gemini").setup()
  --   end,
  --   keys = {
  --     { "<leader>@@", "<cmd>GeminiToggle<cr>", desc = "Toggle Gemini CLI"},
  --     { "<leader>@c", "<cmd>GeminiClose<cr>", desc = "Close Gemini CLI process"},
  --     { "<leader>@D", "<cmd>GeminiSendFileDiagnostic<cr>", desc = "Send File Diagnostics"},
  --     { "<leader>@d", "<cmd>GeminiSendLineDiagnostic<cr>", desc = "Send Line Diagnostics"},
  --     { "<leader>@s", "<cmd>GeminiSwitchSidebarStyle<cr>", desc = "Switch Sidebar Style"},
  --     { "<leader>@p", "<cmd>GeminiSend<cr>", mode = "v", desc = "Send Selected Text to AI Agent"},
  --   }
  -- },
  {
      "nvim-lualine/lualine.nvim",
      opts = {
        options = {
          section_separators = { right = "", left = "" },
          component_separators = { left = "", right = "" },
        },
      },
    },
    {
      "nvim-mini/mini.surround",
      keys = function(_, keys)
        -- Populate the keys based on the user's options
        local opts = LazyVim.opts("mini.surround")
        local mappings = {
          { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "x" } },
          { opts.mappings.delete, desc = "Delete Surrounding" },
          { opts.mappings.find, desc = "Find Right Surrounding" },
          { opts.mappings.find_left, desc = "Find Left Surrounding" },
          { opts.mappings.highlight, desc = "Highlight Surrounding" },
          { opts.mappings.replace, desc = "Replace Surrounding" },
          { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
          -- 👇 Add this extra mapping for Shift+S in visual mode
          {
            "S",
            function()
              require("mini.surround").add("visual")
            end,
            mode = "v",
            desc = "Add Surround with character (Visual mode)",
          },
        }

        mappings = vim.tbl_filter(function(m)
          return m[1] and #m[1] > 0
        end, mappings)

        return vim.list_extend(mappings, keys)
      end,

      opts = {
        mappings = {
          add = "gsa", -- Add surrounding in Normal and Visual modes
          delete = "gsd", -- Delete surrounding
          find = "gsf", -- Find surrounding (to the right)
          find_left = "gsF", -- Find surrounding (to the left)
          highlight = "gsh", -- Highlight surrounding
          replace = "gsr", -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      },
    }
 }
