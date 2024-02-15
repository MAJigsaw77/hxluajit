local ffi = require("ffi")
ffi.cdef[[double pow(double x, double y);]]
print(ffi.C.pow(2, 10))
