return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        sources = {
          files = {
            hidden = true,
            ignored = false,
            exclude = { ".git" },
          },
          grep = {
            hidden = true,
            ignored = false,
            exclude = { ".git" },
          },
          explorer = {
            layout = {
              layout = {
                position = "right",
              },
            },
          },
        },
        win = {
          input = {
            keys = {
              ["<C-h>"] = {
                "explorer_focus_main",
                mode = { "i", "n" },
              },
              ["<C-j>"] = { "smart_split_down", mode = { "i", "n" } },
              ["<C-k>"] = { "smart_split_up", mode = { "i", "n" } },
              ["<C-l>"] = {
                "explorer_focus_wezterm_right",
                mode = { "i", "n" },
              },
            },
          },
          list = {
            keys = {
              ["<C-h>"] = "explorer_focus_main",
              ["<C-j>"] = "smart_split_down",
              ["<C-k>"] = "smart_split_up",
              ["<C-l>"] = "explorer_focus_wezterm_right",
            },
          },
        },
        actions = {
          explorer_focus_main = function(picker)
            local main = picker.main
            if main and vim.api.nvim_win_is_valid(main) then
              vim.api.nvim_set_current_win(main)
            end
          end,
          explorer_focus_wezterm_right = function()
            local wezterm = vim.fn.executable("wezterm") == 1 and "wezterm" or "wezterm.exe"

            vim.fn.jobstart({
              wezterm,
              "cli",
              "activate-pane-direction",
              "Right",
            }, {
              detach = true,
            })
          end,
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
