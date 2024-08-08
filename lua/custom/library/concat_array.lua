function ConcatArray(a, b)
  if not table.unpack then
    table.unpack = unpack
  end

  local result = {table.unpack(a)}
  table.move(b, 1, #b, #result + 1, result)
  return result
end
