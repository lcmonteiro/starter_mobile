-- ~/.config/nvim/lua/config/runner.lua
local M = {}

function M.run_cmd(cmd)
  -- 🧭 get directory of current file
  local file_dir = vim.fn.expand("%:p:h")
  if file_dir == "" then
    file_dir = vim.fn.getcwd() -- fallback
  end

  -- 🪟 new scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- window geometry (centered)
  local width  = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row    = math.floor((vim.o.lines - height) / 2)
  local col    = math.floor((vim.o.columns - width) / 2)

  -- floating window
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
    style = "minimal",
    title = "Running: " .. cmd,
    title_pos = "center",
  })

  -- 🧑‍💻 open terminal in file's directory
  vim.fn.termopen(cmd, {
    cwd = file_dir, -- 👈 runs command inside file's folder
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("✅ Command finished successfully", vim.log.levels.INFO)
      else
        vim.notify("❌ Command exited with code " .. code, vim.log.levels.ERROR)
      end
    end,
  })

  vim.cmd("startinsert") -- focus terminal input
end

return M

