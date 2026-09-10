-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- 配置复制时闪烁高亮
autocmd("TextYankPost", {
  -- 这里的 { clear = true } 会先清除 LazyVim 默认的 yank 自动命令
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    -- on_yank 是内置函数，IncSearch 是高亮组（搜索时的高亮颜色，也可以换成 "Visual"），timeout 是持续时间
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})
