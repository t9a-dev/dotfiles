return {
  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {
      opts = {
        language = "Japanese",
      },
      adapters = {
        http = {
          extend = {
            openrouter = {
              env = {
                api_key = "cmd:op read 'op://Personal/OpenRouter-codecompanion-nvim/api-key' --no-newline",
              },
            },
          },
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = "openrouter",
            model = "deepseek/deepseek-v4.1-flash-1017",
          },
        },
        inline = {
          adapter = {
            name = "openrouter",
            model = "deepseek/deepseek-v4.1-flash-1017",
          },
        },
        cmd = {
          adapter = {
            name = "openrouter",
            model = "deepseek/deepseek-v4.1-flash-1017",
          },
        },
        background = {
          adapter = {
            name = "openrouter",
            model = "deepseek/deepseek-v4.1-flash-1017",
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
