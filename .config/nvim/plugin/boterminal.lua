-- Configuration
local term_buf = nil
local term_win = nil

local function open_terminal()
  -- Check if buffer exists and is valid, otherwise create it
  if term_buf == nil or not vim.api.nvim_buf_is_valid(term_buf) then
    term_buf = vim.api.nvim_create_buf(false, true)
  end

  -- Determine the window height (e.g., 25% of the total height)
  local height = math.ceil(vim.o.lines * 0.25)

  -- Open the window at the bottom
  vim.cmd("botright " .. height .. "split")
  term_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(term_win, term_buf)

  -- Start terminal if it's a new buffer
  if vim.bo[term_buf].buftype ~= "terminal" then
    vim.fn.termopen(vim.o.shell)
    -- Remove line numbers and sign column for a cleaner look
    vim.wo[term_win].number = false
    vim.wo[term_win].relativenumber = false
    vim.wo[term_win].signcolumn = "no"
  end

  vim.cmd("startinsert")
end

local function toggle_terminal()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
  else
    open_terminal()
  end
end

-- Keybinding: Press Ctrl + \ to toggle (similar to many IDEs)
vim.keymap.set({'n', 't'}, '<C-\\>', toggle_terminal, { desc = "Toggle Bottom Terminal" })
