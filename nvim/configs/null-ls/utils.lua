local NullLsUtils = {}

---
-- 현재 작업 디렉토리를 찾습니다.
-- @param config table 현재 작업 디렉토리를 찾을 때 사용되는 설정.
-- @return string 찾은 현재 작업 디렉토리의 경로를 반환합니다.
--
NullLsUtils.get_cwd = function(config)
  local config_file = config.config_file
  local default_path = config.default_path
  local buf_get_name = vim.api.nvim_buf_get_name(0)
  local found_path = vim.fs.dirname(vim.fs.find({ config_file }, { upward = true, path = buf_get_name })[1])

  if not found_path and default_path then
    found_path = vim.fn.expand(default_path)
  end

  return found_path or ""
end

NullLsUtils.read_ignore_file = function(config)
  local ignore_file = config.ignore_file
  local default_path = config.default_path
  local ignoreStrings = {}
  local file, err = io.open(vim.fn.expand(default_path .. ignore_file), "r")
  if file then
    for line in file:lines() do
      table.insert(ignoreStrings, line)
    end
    file:close()
    return table.concat(ignoreStrings, ",")
  else
    print("파일을 열 수 없습니다.", err)
    return "empty"
  end
end

NullLsUtils.show_ignore_list = function(ignore_path)
  local file, err = io.open(vim.fn.expand(ignore_path), "r")
  if not file then
    print("파일을 열 수 없습니다. 오류:", err)
    return
  end

  print "Ignore List:"

  for line in file:lines() do
    print(line)
  end

  file:close()
end

NullLsUtils.add_ignore_word = function(ignore_path, word_to_add)
  if #word_to_add == 0 then
    print "단어를 입력해주세요."
    return
  end
  local file, err = io.open(vim.fn.expand(ignore_path), "a")
  if file then
    file:write(word_to_add, "\n")
    file:close()
    print("Add misspell word:", word_to_add)
  else
    print("파일을 열 수 없습니다. 오류:", err)
  end
end

NullLsUtils.remove_ignore_word = function(ignore_path, word_to_remove)
  if #word_to_remove == 0 then
    print "단어를 입력해주세요."
    return
  end

  local lines = {}
  local file, err = io.open(vim.fn.expand(ignore_path), "r")
  if not file then
    print("파일을 열 수 없습니다. 오류:", err)
    return
  end

  for line in file:lines() do
    if line ~= word_to_remove then
      table.insert(lines, line)
    end
  end

  file:close()

  file, err = io.open(vim.fn.expand(ignore_path), "w")
  if not file then
    print("파일을 다시 열 수 없습니다. 오류:", err)
    return
  end

  for _, line in ipairs(lines) do
    file:write(line, "\n")
  end

  file:close()

  print("Remove misspell word:", word_to_remove)
end

return NullLsUtils
