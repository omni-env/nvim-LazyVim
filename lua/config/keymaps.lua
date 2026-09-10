-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 导入键映射函数
local kmap = require("utils").kmap

-- kmap({'n', 'v'}, ';', ':', { desc = 'CMD enter command mode' })
kmap("i", "jj", "<ESC>", { desc = "Exit insert mode" })
kmap("i", "jk", "<ESC>", { desc = "Exit insert mode" })
-- 复制到行尾，与 C 和 D 保持统一
kmap("n", "Y", "y$", { desc = "Yank to end of line" })

-- 在当前行「下方」按行粘贴剪贴板内容，并自动调整缩进
kmap("n", "<leader>p", function()
  vim.cmd("put " .. vim.v.register)
  vim.cmd "normal! ='["
end, { desc = "Paste clipboard below (line-wise, adjust indent)" })
-- 在当前行「上方」粘贴
kmap("n", "<leader>P", function()
  vim.cmd("put! " .. vim.v.register)
  vim.cmd "normal! ='["
end, { desc = "Paste clipboard above (line-wise, adjust indent)" })

-- 按 Shift+Insert 粘贴系统剪贴板内容
kmap({ "n", "v" }, "<S-Insert>", '"+p', { desc = "Paste OS clipboard" })
kmap({ "i", "c" }, "<S-Insert>", "<C-r>+", { desc = "Paste OS clipboard" })

-- 对比当前文件与剪切板
local function diff_with_clipboard()
  -- 1. 获取当前缓冲区的文件类型
  local ftype = vim.api.nvim_get_option_value("filetype", { buf = 0 })

  -- 2. 获取系统剪切板内容 ('+' 寄存器)
  local clipboard_content = vim.fn.getreg "+"
  if clipboard_content == "" then
    vim.notify("Nothing to diff: clipboard is empty.", vim.log.levels.WARN)
    return
  end

  -- 3. 垂直分割窗口
  vim.cmd "vsplit"

  -- 4. 创建一个全新的空白临时缓冲区 (Scratch Buffer)
  local buf = vim.api.nvim_create_buf(false, true)

  -- 5. 将新缓冲区放入新窗口
  vim.api.nvim_win_set_buf(0, buf)

  -- 6. 按行分割剪切板内容并写入新缓冲区
  local lines = vim.split(clipboard_content, "\n")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- 7. 继承原文件的类型，以加载相应的语法和缩进规则
  vim.api.nvim_set_option_value("filetype", ftype, { buf = buf })

  -- 8. 格式化剪切板内容
  -- 尝试安全加载 conform.nvim (LazyVim 默认内置)
  local has_conform, conform = pcall(require, "conform")
  if has_conform then
    -- 必须强制开启 async = false，阻塞主线程直到格式化完成
    -- quiet = true 可以屏蔽格式化失败时的报错弹窗
    conform.format { bufnr = buf, async = false, quiet = true }
  else
    -- 降级方案：如果未安装 conform，回退到原生缩进
    -- gg: 跳到文件开头
    -- =G: 从当前行自动缩进排版到文件末尾 (G)
    vim.cmd "normal! gg=G"
  end
  -- 将光标重置回第一行，方便从头开始查看 diff
  vim.cmd "normal! gg"

  -- 9. 启动 Diff 模式
  vim.cmd "diffthis" -- 将右侧（新窗口）设为 diff 模式
  vim.cmd "wincmd p" -- 光标跳回左侧（原窗口）
  vim.cmd "diffthis" -- 将左侧设为 diff 模式
end

-- 绑定快捷键，<leader>dc (Diff Clipboard)
vim.keymap.set("n", "<leader>dc", diff_with_clipboard, { desc = "Diff with clipboard" })
vim.keymap.set("n", "<leader>do", "<cmd>diffoff!<CR>", { desc = "Turn off Diff mode" })
