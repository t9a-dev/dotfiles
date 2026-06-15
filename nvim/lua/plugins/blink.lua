return {
  {
    -- 文章入力時にbufferから候補を拾ってきて提案しないように
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.default = { "lsp", "path", "snippets" }
    end,
  },
}
