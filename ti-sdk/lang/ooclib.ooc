include stdlib, stdio,string, ./bools

// character and pointer types
Char: cover from char
UChar: cover from unsigned char
//WChar: cover from wchar_t
String: cover from Char*
Pointer: cover from void*

// variable-size integer types
Int: cover from int
UInt: cover from unsigned int extends Int
Short: cover from short extends Int
UShort: cover from unsigned short extends Int
Long: cover from long extends Int
ULong: cover from unsigned long extends Int
LLong: cover from long long extends Int
ULLong: cover from unsigned long long extends Int

// floating-point types
LDouble: cover from long double
Double: cover from double
Float: cover from float extends Double

// fixed-size integer types
//Int8: cover from int8_t
//Int16: cover from int16_t
//Int32: cover from int32_t
//Int64: cover from int64_t

//UInt8:  cover from uint8_t
//UInt16: cover from uint16_t
//UInt32: cover from uint32_t
//UInt64: cover from uint64_t

//Octet: cover from UInt8

// other types
Void: cover from void
//Bool: cover from bool
Bool: cover from char
SizeT: cover from size_t

sizeof: extern func (...) -> SizeT
memset: extern func (Pointer, Int, SizeT) -> Pointer
memcmp: extern func (Pointer, Pointer, SizeT) -> Int
memmove: extern func (Pointer, Pointer, SizeT)
memcpy: extern func (Pointer, Pointer, SizeT)
scanf: extern func (String, ...)
printf: extern func (String, ...)
sprintf: extern func (String, String, ...)
snprintf: extern func (String, Int, String, ...)

exit: extern func (Int)

fprintf: extern func (Stream, String, ...)
FILE: extern cover
Stream: cover from FILE*
stdout, stderr, stdin : extern Stream
fflush: extern func (Stream)

println: func (str: String) {
	printf("%s\n", str)
}
println: func ~empty {
	printf("\n")
}

/*
gc_malloc: extern(GC_MALLOC) func (size: SizeT) -> Pointer
gc_malloc_atomic: extern(GC_MALLOC_ATOMIC) func (size: SizeT) -> Pointer
gc_realloc: extern(GC_REALLOC) func (ptr: Pointer, size: SizeT) -> Pointer
gc_calloc: func (nmemb: SizeT, size: SizeT) -> Pointer {
	gc_malloc(nmemb * size)
}
*/

gc_malloc: extern(malloc) func (size: SizeT) -> Pointer
gc_malloc_atomic: extern(malloc) func (size: SizeT) -> Pointer
gc_realloc: extern(realloc) func (ptr: Pointer, size: SizeT) -> Pointer
gc_calloc: func (nmemb: SizeT, size: SizeT) -> Pointer {
	gc_malloc(nmemb * size)
}

