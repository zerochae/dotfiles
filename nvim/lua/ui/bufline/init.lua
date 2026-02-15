local M = {}
local api = vim.api

function M.generate()
  return require("ui.bufline.modules").render()
end

local function find_buf(bufnr)
  for i, b in ipairs(vim.t.bufs or {}) do
    if b == bufnr then
      return i
    end
  end
end

function M.next()
  local bufs = vim.t.bufs or {}
  if #bufs < 2 then
    return
  end
  local i = find_buf(api.nvim_get_current_buf()) or 0
  api.nvim_set_current_buf(bufs[i % #bufs + 1])
end

function M.prev()
  local bufs = vim.t.bufs or {}
  if #bufs < 2 then
    return
  end
  local i = find_buf(api.nvim_get_current_buf()) or 2
  api.nvim_set_current_buf(bufs[(i - 2) % #bufs + 1])
end

function M.close_buffer(bufnr)
  bufnr = bufnr or api.nvim_get_current_buf()

  if vim.bo[bufnr].buftype == "terminal" then
    vim.cmd(vim.bo.buflisted and "set nobl | enew" or "hide")
    return
  end

  if api.nvim_win_get_config(0).zindex then
    vim.cmd "bw"
    return
  end

  local bufs = vim.t.bufs or {}
  local idx = find_buf(bufnr)

  if idx and #bufs > 1 then
    api.nvim_set_current_buf(bufs[idx == #bufs and idx - 1 or idx + 1])
  elseif not vim.bo[bufnr].buflisted then
    if bufs[1] then
      local winid = vim.fn.bufwinid(bufs[1])
      if winid ~= -1 then
        api.nvim_set_current_win(winid)
      end
      api.nvim_set_current_buf(bufs[1])
    end
    vim.cmd("bw" .. bufnr)
    vim.cmd "redrawtabline"
    return
  else
    vim.cmd "enew"
  end

  if vim.bo[bufnr].bufhidden ~= "delete" and api.nvim_buf_is_valid(bufnr) then
    vim.cmd("confirm bd" .. bufnr)
  end

  vim.cmd "redrawtabline"
end

function M.close_all(keep_current)
  local cur = api.nvim_get_current_buf()
  for _, b in ipairs(vim.t.bufs or {}) do
    if not keep_current or b ~= cur then
      M.close_buffer(b)
    end
  end
end

function M.move_buf(dir)
  local bufs = vim.t.bufs or {}
  local i = find_buf(api.nvim_get_current_buf())
  if not i then
    return
  end
  local j = ((i - 1 + dir) % #bufs) + 1
  bufs[i], bufs[j] = bufs[j], bufs[i]
  vim.t.bufs = bufs
  vim.cmd "redrawtabline"
end

function M.goto_buf(bufnr)
  local win = api.nvim_get_current_win()
  if api.nvim_get_option_value("winfixbuf", { win = win }) then
    for _, w in ipairs(api.nvim_list_wins()) do
      if
        not api.nvim_get_option_value("winfixbuf", { win = w })
        and api.nvim_get_option_value("buflisted", { buf = api.nvim_win_get_buf(w) })
      then
        api.nvim_set_current_win(w)
        break
      end
    end
  end
  api.nvim_set_current_buf(bufnr)
end

function M.setup()
  vim.t.bufs = vim.t.bufs or vim.tbl_filter(function(b)
    return vim.fn.buflisted(b) == 1
  end, api.nvim_list_bufs())

  vim.o.showtabline = 2
  vim.o.tabline = "%!v:lua.require('ui.bufline').generate()"

  api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
      local buf = args.buf
      if api.nvim_buf_is_valid(buf) and api.nvim_get_option_value("buflisted", { buf = buf }) then
        vim.t.last_buf = buf
      end
    end,
  })

  api.nvim_create_autocmd("tabnew", {
    callback = function()
      vim.t.bufs = {}
    end,
  })

  api.nvim_create_autocmd({ "BufAdd", "BufEnter" }, {
    callback = function(args)
      local buf = args.buf
      if not api.nvim_buf_is_valid(buf) then
        return
      end
      if not api.nvim_get_option_value("buflisted", { buf = buf }) then
        return
      end

      local bufs = vim.t.bufs or {}
      if vim.tbl_contains(bufs, buf) then
        return
      end

      table.insert(bufs, buf)

      if
        #bufs > 1
        and api.nvim_buf_get_name(bufs[1]) == ""
        and not api.nvim_get_option_value("modified", { buf = bufs[1] })
      then
        table.remove(bufs, 1)
      end

      vim.t.bufs = bufs
    end,
  })

  api.nvim_create_autocmd("BufDelete", {
    callback = function(args)
      for _, tab in ipairs(api.nvim_list_tabpages()) do
        local bufs = vim.t[tab].bufs or {}
        for i, b in ipairs(bufs) do
          if b == args.buf then
            table.remove(bufs, i)
            vim.t[tab].bufs = bufs
            break
          end
        end
      end
    end,
  })

  api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
      vim.opt_local.buflisted = false
    end,
  })

  vim.cmd [[
    function! GnGoToBuf(bufnr,b,c,d)
      call luaeval('require("ui.bufline").goto_buf(_A)', a:bufnr)
    endfunction
    function! GnGotoTab(tabnr,b,c,d)
      execute a:tabnr .. 'tabnext'
    endfunction
  ]]
end

return M
