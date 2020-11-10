# Defined in - @ line 1
function connect-to-build-server --wraps='ssh -p 2224 mario_fink@esbdev.ec.goodyear.com' --description 'alias connect-to-build-server ssh -p 2224 mario_fink@esbdev.ec.goodyear.com'
  ssh -p 2224 mario_fink@esbdev.ec.goodyear.com $argv;
end
