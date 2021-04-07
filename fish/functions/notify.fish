# Defined in - @ line 1
function notify --wraps=osascript\ -e\ \'display\ notification\ \"Hello\"\' --wraps=osascript\ -e\ \'display\ notification\ \"👋🏻\"\' --description alias\ notify\ osascript\ -e\ \'display\ notification\ \"👋🏻\"\'
  osascript -e 'display notification "👋🏻"' $argv;
end
