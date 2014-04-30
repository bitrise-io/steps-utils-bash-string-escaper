#

def bash_string_escape(string, is_escape_space=true)
  if is_escape_space
    pattern = /([^a-zA-Z0-9\/\.\-\:\?\,\;\(\)\[\]\{\}\<\>\=\*\+])/
  else
    pattern = /([^a-zA-Z0-9\ \/\.\-\:\?\,\;\(\)\[\]\{\}\<\>\=\*\+])/
  end
  string.gsub(pattern){|match|"\\"  + match}
end