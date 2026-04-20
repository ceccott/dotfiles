return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.python = opts.linters_by_ft.python or {}
      table.insert(opts.linters_by_ft.python, "pylint")
    end,
  },
}
