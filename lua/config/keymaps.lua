local map = vim.keymap.set
local runner = require("config.runner")

-- =========================================================
-- 🚀 Language runners — each function gets the current file
-- =========================================================
local runners = {
  cpp = function(file)
    local output = vim.fn.expand("$TMPDIR") .. vim.fn.expand("%:t:r")
    runner.run_cmd("clang++ --config=./compile_flags.txt " .. file .. " -o " .. output .. "&&" .. output)
  end,
  c = function(file)
    local output = vim.fn.expand("$TMPDIR") .. vim.fn.expand("%:t:r")
    runner.run_cmd("clang --config=./compile_flags.txt " .. file .. " -o " .. output)
  end,
  py = function(file)
    runner.run_cmd("python3 " .. file)
  end,

  lua = function(file)
    runner.run_cmd("lua " .. file)
  end,
}

-- =========================================================
-- 🪄 Dispatcher (acts like a switch-case)
-- =========================================================
local function run_current_file()
  local file = vim.fn.expand("%:p") -- full path
  local ext = vim.fn.expand("%:e") -- extension
  local runner = runners[ext]

  if runner then
    runner(file)
  else
    print("❌ Unsupported file type: " .. ext)
  end
end

-- =========================================================
-- 🎯 Keybinding
-- =========================================================
map("n", "<leader>cc", run_current_file, {
  desc = "Compile & Run current file 🚀",
})
