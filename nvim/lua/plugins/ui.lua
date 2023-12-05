return {
  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
           ███████╗███╗   ███╗██████╗ ████████╗██╗   ██╗    ██╗   ██╗ ██████╗ ██╗██████╗ 
           ██╔════╝████╗ ████║██╔══██╗╚══██╔══╝╚██╗ ██╔╝    ██║   ██║██╔═══██╗██║██╔══██╗
           █████╗  ██╔████╔██║██████╔╝   ██║    ╚████╔╝     ██║   ██║██║   ██║██║██║  ██║
           ██╔══╝  ██║╚██╔╝██║██╔═══╝    ██║     ╚██╔╝      ╚██╗ ██╔╝██║   ██║██║██║  ██║
           ███████╗██║ ╚═╝ ██║██║        ██║      ██║        ╚████╔╝ ╚██████╔╝██║██████╔╝
           ╚══════╝╚═╝     ╚═╝╚═╝        ╚═╝      ╚═╝         ╚═══╝   ╚═════╝ ╚═╝╚═════╝ 
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      background_color = "#121212",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },
}
