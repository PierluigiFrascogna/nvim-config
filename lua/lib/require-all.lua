local convertToModule = function(file_path)
  return vim.fs.normalize(file_path)
    :gsub("^.+lua/", "") -- Trim path over /lua folder
    :gsub("%.lua$", "")  -- Trim extension
    :gsub("/", ".")      -- Slash replace
end

local listFiles = function (dir_path)
  local file_paths = vim.fs.find(
    function(name, path)
      return name:match("%.lua$")
    end,
    {
      path = dir_path,
      type = "file",
      limit = math.huge,
    }
  )
  table.sort(file_paths)
  return file_paths
end

return function(dir_path)
  for _, file_path in ipairs(listFiles(dir_path)) do
    local module = convertToModule(file_path)
    -- print(module)
    require(module)
  end
end

