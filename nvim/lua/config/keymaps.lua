-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- 意図せずマクロ記録モードに入って鬱陶しいので<Leader>経由で使うように
-- Disable accidental macro recording on q
vim.keymap.set("n", "q", "<Nop>", {
  desc = "Disable accidental macro recording",
})

-- Keep macro recording available on Q
vim.keymap.set("n", "Q", "q", {
  desc = "Macro: start/stop recording",
})

-- Expose macro recording in <Leader> menu
vim.keymap.set("n", "<Leader>Q", "q", {
  desc = "Macro: start/stop recording",
})
