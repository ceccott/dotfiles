-- LVIM CONFIGURATION
--

lvim.log.level = "warn"
lvim.format_on_save.enabled = false
--lvim.colorscheme = "gruvbox"
-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = true

-- VIM OPTIONS
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.showmode = true -- show mode like -- INSERT --
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.number = true -- set numbered lines
vim.opt.autoindent = true -- indent a line like the previous
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.relativenumber = true -- set relative number line idx

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-o>"] = ":SymbolsOutline<cr>"
lvim.keys.normal_mode["<C-Space>"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode["<C-n>"] = ":tabn<cr>"
lvim.keys.normal_mode["<C-p>"] = ":tabp<cr>"
lvim.keys.normal_mode["``"] = "<Plug>(comment_toggle_linewise_current)" -- comment toggle line
lvim.keys.visual_mode["``"] = "<Plug>(comment_toggle_linewise_visual)"  -- comment toggle visual block
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- lvim.builtin.telescope.on_config_done = function(telescope)
--   telescope.load_extension('symbols')
-- end

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
--
-- nvim-tree mappings
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 's',     api.node.open.vertical,              opts('Open: Vertical Split'))
  vim.keymap.set('n', 'i',     api.node.open.horizontal,              opts('Open: Horizontal Split'))
end

local function get_git_root()
  local git_root = vim.fn.system('git rev-parse --show-toplevel')
  if vim.v.shell_error == 0 then
    return vim.fn.fnamemodify(git_root, ':p'):gsub("\n", "") -- Remove trailing newline
  else
    return "~"
  end
end

local function load_env(file)
    local vars = {}
    for line in io.lines(file) do
        local key, value = line:match("([^=]+)=(.+)")
        if key and value then
            vars[key] = value
        end
    end
    return vars
end

local dotenv_path = vim.env.HOME .. "/.env"
local dotenv = load_env(dotenv_path)

vim.g.codecompanion_adapter="gemini"
vim.cmd([[cab cc CodeCompanion]])
vim.cmd([[cab ccc CodeCompanionChat]])

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.on_attach = my_on_attach

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "verilog",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--

-- skipped server list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {"svls", "csharp_ls"})
lvim.lsp.installer.setup.automatic_installation = false

-- custom default servers
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "verible"
-- end, lvim.lsp.automatic_configuration.skipped_servers)
lvim.lsp.installer.setup.automatic_installation = false

require("lvim.lsp.manager").setup("verible",
{
  cmd = {"verible-verilog-ls", "--rules_config_search"} -- enable automatic search of .rules.verible_lint
})

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--      "omnisharp_mono",
--  }

-- require'lspconfig'.omnisharp.setup {
--     cmd = { "mono", "/home/leonardo/.local/share/lvim/mason/packages/omnisharp-mono/omnisharp/OmniSharp.exe" },

--     -- Enables support for reading code style, naming convention and analyzer
--     enable_editorconfig_support = true,
--     enable_ms_build_load_projects_on_demand = false,
--     enable_roslyn_analyzers = false,
--     organize_imports_on_format = false,
--     enable_import_completion = false,
--     sdk_include_prereleases = true,
--     analyze_open_documents_only = false,
-- }

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  { command = "verible-verilog-format", filetypes = {"verilog", "systemverilog"},
    extra_args = {"--inplace", "--flagfile", get_git_root() .. "/.rules.verible_format","--stdin_name", "$FILENAME", "-" }
  },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", args = {"--ignore=E501"}, filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck", filetypes = { "shell"},
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  -- {
  --   command = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "python" },
  -- },
}

-- Additional Plugins
lvim.plugins = {
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "chrisgrieser/nvim-spider",
      keys = {
        {
          "w",
          "<cmd>lua require('spider').motion('w')<CR>",
          mode = { "n", "o", "x" },
        },
        {
          "b",
          "<cmd>lua require('spider').motion('b')<CR>",
          mode = { "n", "o", "x" },
        },
        {
          "e",
          "<cmd>lua require('spider').motion('e')<CR>",
          mode = { "n", "o", "x" },
        },
		-- ...
	},    },
    {
      "aserowy/tmux.nvim"
    },
    {
      "tpope/vim-surround"
    },
    {
      "David-Kunz/gen.nvim"
    },
    {
      "tpope/vim-fugitive"
    },
    {
    "mfussenegger/nvim-dap-python"
    },
    {
    "mattesgroeger/vim-bookmarks"
    },
    {
    "simrat39/symbols-outline.nvim"
    },
    {
    "vim-scripts/systemrdl.vim"
    },
    {
      "olimorris/codecompanion.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- The following are optional:
        { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
      },
      config  = function()
      require("codecompanion").setup({
        adapters = {
            gemini = function()
              return require("codecompanion.adapters").extend("gemini", {
                env = {
                  api_key = dotenv.GEMINI_API_KEY
                },
              })
            end,
          },
      })
      end,
    }
}

-- Plugins Config --

require("symbols-outline").setup{
opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true,
  position = 'right',
  relative_width = true,
  width = 15,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = false,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = 0,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "s",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
},
}

require("spider").setup {
	skipInsignificantPunctuation = true,
	subwordMovement = true,
	customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
}

require("tmux").setup {
  copy_sync = {
      enable = false
  },
  navigation = {
    -- cycles to opposite pane while navigating into the border
    cycle_navigation = true,

    -- enables default keybindings (C-hjkl) for normal mode
    enable_default_keybindings = true,

    -- prevents unzoom tmux when navigating beyond vim border
    persist_zoom = true,
  },
  resize = {
    -- enables default keybindings (A-hjkl) for normal mode
    enable_default_keybindings = true,
  },
}

require("gen").prompts['Test fix'] = {
  prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}

lvim.autocommands = {
    {
        "BufEnter", -- see `:h autocmd-events`
        { -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
            pattern = { "*.v", "*.sv" }, -- see `:h autocmd-events`
            command = "setlocal commentstring=//%s",
        }
    },
    {
        "BufEnter", -- see `:h autocmd-events`
        { -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
            pattern = { "*.rdl"}, -- see `:h autocmd-events`
            command = "setfiletype systemrdl | setlocal commentstring=//%s",
        }
    },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
