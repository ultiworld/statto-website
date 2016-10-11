module ThemeHelpers
  def entity_obfuscate(string)
    string.gsub(/./){ |char| "&##{char[0].ord};" }
  end

  def percent_obfuscate(string)
    "%" + string.unpack("H2" * string.bytesize).join("%").upcase
  end
end
