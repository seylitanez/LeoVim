  return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Nécessaire pour les fonctions utilitaires
    "nvim-treesitter/nvim-treesitter", -- Nécessaire pour l'analyse syntaxique
  },
  lazy = false, -- Charge immédiatement, ce qui peut être utile si tu utilises souvent ce plugin
  config = function()
    require("refactoring").setup({
      -- Ajoute des configurations spécifiques ici si nécessaire
      prompt_func_return_type = {
        go = true,
        java = true,
      },
      prompt_func_param_type = {
        go = true,
        java = true,
      },
      printf_statements = {}, -- Ajoute les modèles spécifiques si besoin
      print_var_statements = {}, -- Personnalise les modèles pour imprimer les variables
    })

    -- Ajoute des raccourcis pour accéder rapidement aux fonctionnalités de refactorisation
    vim.api.nvim_set_keymap(
      "v",
      "<leader>re",
      ":lua require('refactoring').refactor('Extract Function')<CR>",
      { noremap = true, silent = true, expr = false }
    )
    vim.api.nvim_set_keymap(
      "v",
      "<leader>rv",
      ":lua require('refactoring').refactor('Extract Variable')<CR>",
      { noremap = true, silent = true, expr = false }
    )
    vim.api.nvim_set_keymap(
      "v",
      "<leader>ri",
      ":lua require('refactoring').refactor('Inline Variable')<CR>",
      { noremap = true, silent = true, expr = false }
    )
  end,
}

