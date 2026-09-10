-- 创建一个表作为模块的命名空间
local M = {}

-- 键映射函数，简化快捷键绑定
function M.kmap(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", {
    noremap = true,
    silent = true,
  }, opts or {})

  vim.keymap.set(mode, lhs, rhs, opts)
end

-- 返回这个表
return M
