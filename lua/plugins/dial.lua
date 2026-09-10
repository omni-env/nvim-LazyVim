return {
  "monaqa/dial.nvim",
  -- lazy.nvim 配置解析机制说明：
  -- 1. opts 为 Table 时：自动与 LazyVim 的默认表进行深度合并。
  -- 2. opts 为 Function 时：lazy.nvim 视为完全接管配置逻辑。若 return 新表，
  --    将完全替换原有默认配置，导致 LazyVim 核心字段（如 dials_by_ft）丢失并引发报错。
  --
  -- 解决方案：
  -- 利用 Function 的第二个参数（即已生成的默认 opts），在原表上进行原位修改（Mutation），
  -- 并且不返回任何值，以此继承原有核心配置。

  -- opts 函数的第二个参数 (opts) 包含了 LazyVim 预设好的完整默认配置
  opts = function(_, opts)
    local augend = require("dial.augend")

    -- 防御性声明：确保 default 组表结构存在，避免 nil 错误
    opts.groups.default = opts.groups.default or {}

    -- 使用 vim.list_extend 批量追加自定义规则，完美保留 LazyVim 的底层预设
    vim.list_extend(opts.groups.default, {
      augend.date.alias["%Y-%m-%d"], -- 日期格式 (如 2026-08-12)
      augend.case.new({
        types = { "camelCase", "snake_case", "PascalCase", "SCREAMING_SNAKE_CASE" },
        cyclic = true,
      }),
    })

    -- 原位修改 (Mutate) 传入的 opts 表即可，无须 return 新表
  end,
}
