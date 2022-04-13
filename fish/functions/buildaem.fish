# Defined via `source`
function buildaem --wraps='jenv exec mvn clean install -PautoInstallPackage -Dmaven.test.skip=true' --description 'alias buildaem=jenv exec mvn clean install -PautoInstallPackage -Dmaven.test.skip=true'
  jenv exec mvn clean install -PautoInstallPackage -Dmaven.test.skip=true $argv && notify;
end
