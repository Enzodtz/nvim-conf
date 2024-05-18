function SysIsWSL()
  return os.getenv("WSL_DISTRO_NAME") ~= nil
end
