return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}

      -- バッファ内の単語やスニペットを文章入力中に
      -- 補完候補として表示しない
      opts.sources.default = { "lsp", "path" }
    end,
  },
}
