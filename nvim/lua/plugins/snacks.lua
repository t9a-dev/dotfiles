return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        layout = { layout = { position = "right" } },
        win = {
          input = {
            keys = {
              ["<C-h>"] = { "smart_split_left", mode = { "i", "n" } },
              ["<C-j>"] = { "smart_split_down", mode = { "i", "n" } },
              ["<C-k>"] = { "smart_split_up", mode = { "i", "n" } },
              ["<C-l>"] = { "smart_split_right", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["<C-h>"] = "smart_split_left",
              ["<C-j>"] = "smart_split_down",
              ["<C-k>"] = "smart_split_up",
              ["<C-l>"] = "smart_split_right",
            },
          },
        },
        actions = {
          smart_split_left = function()
            require("smart-splits").move_cursor_left()
          end,
          smart_split_down = function()
            require("smart-splits").move_cursor_down()
          end,
          smart_split_up = function()
            require("smart-splits").move_cursor_up()
          end,
          smart_split_right = function()
            require("smart-splits").move_cursor_right()
          end,
        },
      },
    },
  },
}
