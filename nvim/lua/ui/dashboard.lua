local M = {}
local api = vim.api
local strw = api.nvim_strwidth
local floor = math.floor
local max = math.max
local rep = string.rep

local PAD_X = 2
local PAD_Y = 1
local KEY_ICON = "󰌌"
local DESC_ICON = "󰋽"

local dash_state = {}

local function pad_right(str, width)
  local sw = strw(str)
  if sw < width then
    return str .. rep(" ", width - sw)
  end
  return str
end

local function center_text(str, width)
  local sw = strw(str)
  if sw >= width then
    return str
  end
  local pad = floor((width - sw) / 2)
  return rep(" ", pad) .. str .. rep(" ", width - sw - pad)
end

local function left_text(str, width)
  local padded = rep(" ", PAD_X) .. str
  local sw = strw(padded)
  if sw < width then
    return padded .. rep(" ", width - sw)
  end
  return padded
end

local function measure(comp)
  if comp.type == "ascii" then
    local content = type(comp.content) == "function" and comp.content() or comp.content
    local w = 0
    for _, row in ipairs(content) do
      w = max(w, strw(row))
    end
    return w, #content
  elseif comp.type == "action" then
    local line1 = comp.icon .. "  " .. comp.label
    local line2 = KEY_ICON .. "  " .. (comp.key or "")
    local w = max(strw(line1), strw(line2))
    local h = 2
    if comp.desc then
      local line3 = DESC_ICON .. "  " .. comp.desc
      w = max(w, strw(line3))
      h = 3
    end
    return w, h
  elseif comp.type == "text" then
    local content = type(comp.content) == "function" and comp.content() or (comp.content or "")
    return strw(content), 1
  end
  return 0, 0
end

local function render_lines(comp, width)
  if comp.type == "ascii" then
    local content = type(comp.content) == "function" and comp.content() or comp.content
    local lines = {}
    for _, row in ipairs(content) do
      table.insert(lines, center_text(row, width))
    end
    return lines
  elseif comp.type == "action" then
    local lines = {}
    local line_hl = {}
    local pb = #rep(" ", PAD_X)
    local gap = "  "
    local gb = #gap
    local icon_hl = comp.group and ("GnDashIcon" .. comp.group:sub(1, 1):upper() .. comp.group:sub(2)) or "GnDashIcon"

    table.insert(lines, left_text(comp.icon .. gap .. comp.label, width))
    table.insert(line_hl, {
      { hl = icon_hl, byte_start = pb, byte_end = pb + #comp.icon },
      { hl = "GnDashLabel", byte_start = pb + #comp.icon + gb, byte_end = pb + #comp.icon + gb + #comp.label },
    })
    local key = comp.key or ""
    table.insert(lines, left_text(KEY_ICON .. gap .. key, width))
    table.insert(line_hl, {
      { hl = "GnDashKey", byte_start = pb, byte_end = pb + #KEY_ICON + gb + #key },
    })
    if comp.desc then
      table.insert(lines, left_text(DESC_ICON .. gap .. comp.desc, width))
      table.insert(line_hl, {
        { hl = "GnDashDesc", byte_start = pb, byte_end = pb + #DESC_ICON + gb + #comp.desc },
      })
    end

    return lines, line_hl
  elseif comp.type == "text" then
    local content = type(comp.content) == "function" and comp.content() or (comp.content or "")
    return { center_text(content, width) }
  end
  return { rep(" ", width) }
end

local function resolve_regions(grid)
  local regions = {}
  local rows = #grid
  local cols = #grid[1]

  for r = 1, rows do
    local seen = {}
    for c = 1, cols do
      local name = grid[r][c]
      if not seen[name] then
        local max_c = c
        while max_c < cols and grid[r][max_c + 1] == name do
          max_c = max_c + 1
        end
        regions[name .. "@" .. r] = { c1 = c, c2 = max_c, name = name }
        seen[name] = true
      end
    end
  end

  return regions, rows, cols
end

local function compose(config, winw, winh)
  local regions, grid_rows, grid_cols = resolve_regions(config.grid)
  local components = config.components
  local sep_char = config.separator

  local col_w = {}
  for c = 1, grid_cols do
    col_w[c] = 0
  end
  local row_h = {}
  for r = 1, grid_rows do
    row_h[r] = PAD_Y * 2
  end

  for _, reg in pairs(regions) do
    local comp = components[reg.name]
    if not comp then
      goto skip
    end
    local cw = measure(comp)
    if reg.c1 == reg.c2 then
      col_w[reg.c1] = max(col_w[reg.c1], cw + PAD_X * 2)
    end
    ::skip::
  end

  for r = 1, grid_rows do
    local seen = {}
    for _, name in ipairs(config.grid[r]) do
      if not seen[name] then
        local comp = components[name]
        if comp then
          local _, ch = measure(comp)
          row_h[r] = max(row_h[r], ch + PAD_Y * 2)
        end
        seen[name] = true
      end
    end
  end

  for _, reg in pairs(regions) do
    local comp = components[reg.name]
    if not comp then
      goto skip2
    end
    local span_c = reg.c2 - reg.c1 + 1
    local cw = measure(comp)
    if span_c > 1 then
      local existing = 0
      for c = reg.c1, reg.c2 do
        existing = existing + col_w[c]
      end
      if cw + PAD_X * 2 > existing then
        local extra = cw + PAD_X * 2 - existing
        local per = math.ceil(extra / span_c)
        for c = reg.c1, reg.c2 do
          col_w[c] = col_w[c] + per
        end
      end
    end
    ::skip2::
  end

  local total_w = 0
  for c = 1, grid_cols do
    total_w = total_w + col_w[c]
  end
  if sep_char then
    total_w = total_w + (grid_cols - 1) * strw(sep_char)
  end

  local total_h = 0
  for r = 1, grid_rows do
    total_h = total_h + row_h[r]
  end

  local off_x = max(0, floor((winw - total_w) / 2))
  local off_y = max(0, floor((winh - total_h) / 2))

  local rendered = {}
  for key, reg in pairs(regions) do
    local comp = components[reg.name]
    if not comp then
      goto skip3
    end
    local cell_w = 0
    for c = reg.c1, reg.c2 do
      cell_w = cell_w + col_w[c]
    end
    if sep_char and (reg.c2 - reg.c1) > 0 then
      cell_w = cell_w + (reg.c2 - reg.c1) * strw(sep_char)
    end
    local rlines, rhl = render_lines(comp, cell_w)
    rendered[key] = {
      lines = rlines,
      line_hl = rhl,
      comp = comp,
      cell_w = cell_w,
    }
    ::skip3::
  end

  local buf_lines = {}
  local hl_ranges = {}
  local cur_y = off_y

  for gr = 1, grid_rows do
    local rh = row_h[gr]
    local row_cells = config.grid[gr]

    local unique_names = {}
    local seen_in_row = {}
    for _, name in ipairs(row_cells) do
      if not seen_in_row[name] then
        table.insert(unique_names, name)
        seen_in_row[name] = true
      end
    end

    local is_spanning = #unique_names == 1

    for dy = 0, rh - 1 do
      local line_idx = cur_y + dy + 1
      if line_idx < 1 or line_idx > winh then
        goto next_dy
      end

      local left = rep(" ", off_x)
      local segments = {}

      if is_spanning then
        local name = unique_names[1]
        local key = name .. "@" .. gr
        local rd = rendered[key]
        if rd then
          local cell_lines = rd.lines
          local content_start = floor((rh - #cell_lines) / 2)
          local li = dy - content_start + 1
          local text
          if li >= 1 and li <= #cell_lines then
            text = pad_right(cell_lines[li], rd.cell_w)
          else
            text = rep(" ", rd.cell_w)
          end
          table.insert(segments, text)
        end
      else
        local max_lines = 0
        for _, uname in ipairs(unique_names) do
          local urd = rendered[uname .. "@" .. gr]
          if urd then
            max_lines = max(max_lines, #urd.lines)
          end
        end
        local content_start = floor((rh - max_lines) / 2)
        local is_content_line = (dy >= content_start and dy < content_start + max_lines)
        local first = true
        for c = 1, grid_cols do
          local name = row_cells[c]
          local key = name .. "@" .. gr
          local reg = regions[key]
          if reg and reg.c1 == c then
            if not first and sep_char then
              if is_content_line then
                table.insert(segments, sep_char)
              else
                table.insert(segments, rep(" ", strw(sep_char)))
              end
            end

            local rd = rendered[key]
            if rd then
              local cell_lines = rd.lines
              local c_start = floor((rh - #cell_lines) / 2)
              local li = dy - c_start + 1
              local text
              if li >= 1 and li <= #cell_lines then
                text = pad_right(cell_lines[li], rd.cell_w)
              else
                text = rep(" ", rd.cell_w)
              end
              table.insert(segments, text)
            end

            first = false
          end
        end
      end

      local full_line = left .. table.concat(segments)
      if strw(full_line) < winw then
        full_line = full_line .. rep(" ", winw - strw(full_line))
      end
      buf_lines[line_idx] = full_line

      if not hl_ranges[line_idx] then
        hl_ranges[line_idx] = {}
      end

      local byte_off = #left
      for si, seg in ipairs(segments) do
        local seg_bytes = #seg

        local seg_name = nil
        if is_spanning then
          seg_name = unique_names[1]
        else
          local idx = 0
          local first_s = true
          for c = 1, grid_cols do
            local nm = row_cells[c]
            local rg = regions[nm .. "@" .. gr]
            if rg and rg.c1 == c then
              if not first_s and sep_char then
                idx = idx + 1
              end
              idx = idx + 1
              if idx == si then
                seg_name = nm
                break
              end
              first_s = false
            end
          end
        end

        if seg_name then
          local rd = rendered[seg_name .. "@" .. gr]
          if rd then
            local n = #rd.lines
            local cs = floor((rh - n) / 2)
            local li = dy - cs + 1
            if rd.line_hl and li >= 1 and li <= #rd.line_hl then
              for _, h in ipairs(rd.line_hl[li]) do
                table.insert(hl_ranges[line_idx], {
                  hl = h.hl,
                  byte_start = byte_off + h.byte_start,
                  byte_end = byte_off + h.byte_end,
                })
              end
            elseif rd.comp.hl then
              table.insert(hl_ranges[line_idx], {
                hl = rd.comp.hl,
                byte_start = byte_off,
                byte_end = byte_off + seg_bytes,
              })
            end
          end
        elseif sep_char and seg == sep_char then
          table.insert(hl_ranges[line_idx], {
            hl = "GnDashSep",
            byte_start = byte_off,
            byte_end = byte_off + seg_bytes,
          })
        end

        byte_off = byte_off + seg_bytes
      end

      ::next_dy::
    end

    cur_y = cur_y + rh
  end

  local canvas = {}
  for r = 1, winh do
    canvas[r] = buf_lines[r] or rep(" ", winw)
  end

  local action_cells = {}
  local act_cur_y = off_y
  for gr = 1, grid_rows do
    local row_cells = config.grid[gr]
    local act_seen = {}
    for _, name in ipairs(row_cells) do
      if not act_seen[name] then
        local comp = components[name]
        if comp and comp.type == "action" then
          local search = comp.icon .. "  " .. comp.label
          local lo = act_cur_y + 1
          local hi = act_cur_y + row_h[gr]
          for lnum = lo, hi do
            local line = canvas[lnum]
            if line then
              local byte_pos = line:find(search, 1, true)
              if byte_pos then
                table.insert(action_cells, {
                  row = lnum,
                  col = byte_pos - 1,
                  action = comp,
                })
                break
              end
            end
          end
        end
        act_seen[name] = true
      end
    end
    act_cur_y = act_cur_y + row_h[gr]
  end

  return canvas, hl_ranges, action_cells
end

M.open = function(buf, win, action)
  action = action or "open"
  win = win or api.nvim_get_current_win()
  buf = buf or api.nvim_create_buf(false, true)

  local ns = api.nvim_create_namespace "gndashboard"
  local ns_focus = api.nvim_create_namespace "gndash_focus"
  local config = require("grayrc").dashboard
  local winh = api.nvim_win_get_height(win)
  local winw = api.nvim_win_get_width(win)

  vim.g.gndashboard_buf = buf
  vim.g.gndashboard_win = win

  if action == "open" then
    api.nvim_win_set_buf(win, buf)
  end

  vim.bo[buf].modifiable = true

  local canvas, hl_ranges, action_positions = compose(config, winw, winh)

  api.nvim_buf_set_lines(buf, 0, -1, false, canvas)
  api.nvim_buf_clear_namespace(buf, ns, 0, -1)

  for row_idx, ranges in pairs(hl_ranges) do
    for _, h in ipairs(ranges) do
      api.nvim_buf_set_extmark(buf, ns, row_idx - 1, h.byte_start, {
        end_col = h.byte_end,
        hl_group = h.hl,
      })
    end
  end

  table.sort(action_positions, function(a, b)
    if a.row == b.row then
      return a.col < b.col
    end
    return a.row < b.row
  end)

  dash_state[buf] = action_positions

  local function apply_focus(pos)
    api.nvim_buf_clear_namespace(buf, ns_focus, 0, -1)
    if not pos then
      return
    end
    local comp = pos.action
    local label_start = pos.col + #comp.icon + #"  "
    api.nvim_buf_set_extmark(buf, ns_focus, pos.row - 1, label_start, {
      end_col = label_start + #comp.label,
      hl_group = "GnDashFocusLabel",
      priority = 200,
    })
  end

  if action == "redraw" then
    vim.bo[buf].modifiable = false
    if action_positions[1] then
      local cur = api.nvim_win_get_cursor(win)
      local best, best_dist = nil, math.huge
      for _, pos in ipairs(action_positions) do
        local dist = math.abs(pos.row - cur[1]) + math.abs(pos.col - cur[2]) * 0.01
        if dist < best_dist then
          best, best_dist = pos, dist
        end
      end
      if best then
        api.nvim_win_set_cursor(win, { best.row, best.col })
        apply_focus(best)
      end
    end
    return
  end

  local wo = vim.wo[win]
  wo.number = false
  wo.list = false
  wo.wrap = false
  wo.relativenumber = false
  wo.cursorline = false
  wo.colorcolumn = "0"
  wo.foldcolumn = "0"
  wo.signcolumn = "no"

  for _, pos in ipairs(action_positions) do
    local a = pos.action
    vim.keymap.set("n", a.key, "<cmd>" .. a.action .. "<cr>", { buffer = buf, silent = true, nowait = true })
  end

  local function find_nearest(row, col, dir_r, dir_c)
    local positions = dash_state[buf]
    local best, best_dist = nil, math.huge
    for _, pos in ipairs(positions) do
      if pos.row == row and pos.col == col then
        goto skip
      end
      local dr = pos.row - row
      local dc = pos.col - col
      if dir_r ~= 0 and dr * dir_r > 0 then
        local dist = math.abs(dr) + math.abs(dc) * 0.1
        if dist < best_dist then
          best, best_dist = pos, dist
        end
      elseif dir_c ~= 0 and dr == 0 and dc * dir_c > 0 then
        local dist = math.abs(dc)
        if dist < best_dist then
          best, best_dist = pos, dist
        end
      end
      ::skip::
    end
    return best
  end

  local function navigate(dir_r, dir_c)
    local positions = dash_state[buf]
    local pos = api.nvim_win_get_cursor(win)
    local cur_row, cur_col = pos[1], pos[2]
    local target = find_nearest(cur_row, cur_col, dir_r, dir_c)
    if not target then
      if dir_r == 1 then
        target = positions[1]
      elseif dir_r == -1 then
        target = positions[#positions]
      end
    end
    if target then
      api.nvim_win_set_cursor(win, { target.row, target.col })
      apply_focus(target)
    end
  end

  vim.keymap.set("n", "j", function()
    navigate(1, 0)
  end, { buffer = buf, silent = true, nowait = true })
  vim.keymap.set("n", "k", function()
    navigate(-1, 0)
  end, { buffer = buf, silent = true, nowait = true })
  vim.keymap.set("n", "l", function()
    navigate(0, 1)
  end, { buffer = buf, silent = true, nowait = true })
  vim.keymap.set("n", "h", function()
    navigate(0, -1)
  end, { buffer = buf, silent = true, nowait = true })
  vim.keymap.set("n", "<Down>", function()
    navigate(1, 0)
  end, { buffer = buf, silent = true, nowait = true })
  vim.keymap.set("n", "<Up>", function()
    navigate(-1, 0)
  end, { buffer = buf, silent = true, nowait = true })
  vim.keymap.set("n", "<Right>", function()
    navigate(0, 1)
  end, { buffer = buf, silent = true, nowait = true })
  vim.keymap.set("n", "<Left>", function()
    navigate(0, -1)
  end, { buffer = buf, silent = true, nowait = true })

  vim.keymap.set("n", "<cr>", function()
    local positions = dash_state[buf]
    local cur_row = vim.fn.line "."
    local cur_col = api.nvim_win_get_cursor(win)[2]
    for _, p in ipairs(positions) do
      if p.row == cur_row and math.abs(p.col - cur_col) < 5 then
        vim.cmd(p.action.action)
        return
      end
    end
  end, { buffer = buf, silent = true, nowait = true })

  vim.keymap.set("n", "q", function()
    dash_state[buf] = nil
    api.nvim_buf_delete(buf, { force = true })
  end, { buffer = buf, silent = true, nowait = true })

  vim.bo[buf].buflisted = false
  vim.bo[buf].modifiable = false
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].filetype = "gndashboard"
  vim.g.gndashboard_displayed = true

  local group = api.nvim_create_augroup("GnDashboardAu", { clear = true })

  api.nvim_create_autocmd("BufWinLeave", {
    group = group,
    buffer = buf,
    callback = function()
      vim.g.gndashboard_displayed = false
      dash_state[buf] = nil
      vim.wo.signcolumn = "yes"
      pcall(api.nvim_del_augroup_by_name, "GnDashboardAu")
    end,
  })

  api.nvim_create_autocmd({ "WinResized", "VimResized" }, {
    group = group,
    callback = function()
      if not api.nvim_buf_is_valid(vim.g.gndashboard_buf) then
        return
      end
      M.open(vim.g.gndashboard_buf, vim.g.gndashboard_win, "redraw")
    end,
  })

  if action_positions[1] then
    local target = action_positions[1]
    api.nvim_win_set_cursor(win, { target.row, target.col })
    apply_focus(target)
    vim.schedule(function()
      if api.nvim_win_is_valid(win) and api.nvim_buf_is_valid(buf) then
        local line_count = api.nvim_buf_line_count(buf)
        if target.row <= line_count then
          api.nvim_win_set_cursor(win, { target.row, target.col })
          apply_focus(target)
        end
      end
    end)
  end
end

return M
