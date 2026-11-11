return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    dependencies = {
      {
        "smart-splits-nvim/backend-wezterm",
        main = "smart-splits-backend-wezterm",
        opts = {
          cli_path = "wezterm",
        },
      },
    },
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        mode = { "n", "t" },
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        mode = { "n", "t" },
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        mode = { "n", "t" },
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        mode = { "n", "t" },
      },
    },
    opts = {
      -- v3 ではマルチプレクサ連携はバックエンドプラグインとして指定する
      mux = {
        backend = "smart-splits-backend-wezterm",
      },
    },
  },
}
