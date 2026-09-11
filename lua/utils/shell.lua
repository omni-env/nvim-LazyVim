-- 声明一个模块表
local M = {}

-- ==========================================
-- 私有子函数：各 Shell 的独立配置策略
-- ==========================================

local function setup_bash()
  vim.o.shell = "bash"
  vim.o.shellcmdflag = "-c"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
  vim.o.shellredir = ">%s 2>&1"
  vim.o.shellpipe = "2>&1 | tee %s"
end

local function setup_powershell(executable)
  -- executable 参数用于区分 pwsh (PowerShell Core) 和 powershell (Windows 自带)
  vim.o.shell = executable
  vim.o.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

local function setup_nushell()
  -- 获取 Nushell 配置文件的路径
  local config_path = vim.fn.expand "$XDG_CONFIG_HOME/nushell/config.nu"
  -- 在 shellcmdflag 中添加 --config 标志
  vim.o.shellcmdflag = string.format("--config %s -c", vim.fn.fnameescape(config_path))

  vim.o.shell = "nu.exe"
  -- vim.o.shellcmdflag = "-c"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
  -- 适配 Nushell 的标准 I/O 重定向语法
  vim.o.shellredir = "out+err> %s"
  vim.o.shellpipe = "out+err> %s"
end

-- ==========================================
-- 公开方法：环境探测与路由
-- ==========================================

function M.setup()
  -- 1. 探测 Git Bash / MSYS2 环境
  if vim.env.MSYSTEM or (vim.env.SHELL and vim.env.SHELL:match "bash") then
    return setup_bash()
  end

  -- 2. 探测 PowerShell 环境 (依赖 Profile 中预设的 $env:SHELL)
  local current_shell = vim.env.SHELL and vim.env.SHELL:lower() or ""
  if current_shell:match "pwsh" then
    return setup_powershell "pwsh"
  elseif current_shell:match "powershell" then
    return setup_powershell "powershell"
  end

  -- 3. 默认全局回退：Nushell
  return setup_nushell()
end

-- 导出模块
return M
