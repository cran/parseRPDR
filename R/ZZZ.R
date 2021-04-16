.onAttach <- function(libname, pkgname) {
  options(future.globals.maxSize = 100*1024^3)
  data.table::setDTthreads(threads = 1, restore_after_fork = FALSE)
  packageStartupMessage("

                                                        _/_/_/    _/_/_/    _/_/_/    _/_/_/
     _/_/_/      _/_/_/  _/  _/_/    _/_/_/    _/_/    _/    _/  _/    _/  _/    _/  _/    _/
    _/    _/  _/    _/  _/_/      _/_/      _/_/_/_/  _/_/_/    _/_/_/    _/    _/  _/_/_/
   _/    _/  _/    _/  _/            _/_/  _/        _/    _/  _/        _/    _/  _/    _/
  _/_/_/      _/_/_/  _/        _/_/_/      _/_/_/  _/    _/  _/        _/_/_/    _/    _/
 _/
_/

                                by: M\U00E1rton Kolossv\U00E1ry, MD PhD
")
}
