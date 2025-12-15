return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- allows toggling
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    execution_message = {
      message = function()
        return ("💾 Saved at " .. vim.fn.strftime("%H:%M:%S"))
      end,
      cleaning_interval = 1000,
    },
    debounce_delay = 1000,
    conditions = {
      exists = true,
      modifiable = true,
    },
    write_all_buffers = false,
    on_off_commands = true,
  },
}
