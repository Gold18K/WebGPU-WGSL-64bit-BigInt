// Structs
struct i64 {
    number: array<u32, 2>,
    sign:   i32
};
struct i128 {
    number: array<u32, 4>,
    sign:   i32
};
struct i256 {
    number: array<u32, 8>,
    sign:   i32
};
struct i512 {
    number: array<u32, 16>,
    sign:   i32
};
struct i1024 {
    number: array<u32, 32>,
    sign:   i32
};
struct i2048 {
    number: array<u32, 64>,
    sign:   i32
};
struct i4096 {
    number: array<u32, 128>,
    sign:   i32
};
struct i8192 {
    number: array<u32, 256>,
    sign:   i32
};
struct i16384 {
    number: array<u32, 512>,
    sign:   i32
};

// Constructors
fn i64_from_i32(_n: i32) -> i64 {
    var r = i64();
    r.number[1] = u32(abs(_n));
    r.sign = select(1, -1, _n < 0);
    return r;
}
fn i64_from_u32(_n: u32) -> i64 {
    var r = i64();
    r.number[1] = _n;
    r.sign = 1;
    return r;
}
fn i64_from_u32_array(_number: array<u32, 2>, _sign: i32) -> i64 {
    var r = i64();
    r.number = _number;
    r.sign   = _sign;
    return r;
}
fn i128_from_i32(_n: i32) -> i128 {
    var r = i128();
    r.number[3] = u32(abs(_n));
    r.sign = select(1, -1, _n < 0);
    return r;
}
fn i128_from_u32(_n: u32) -> i128 {
    var r = i128();
    r.number[3] = _n;
    r.sign = 1;
    return r;
}
fn i128_from_i64(_n: i64) -> i128 {
    var r = i128();
    var arr = array<u32, 4>();
    for (var i = u32(0); i != 2; i++) {
        arr[3 - i] = _n.number[1 - i];
    }
    r.number = arr;
    r.sign   = _n.sign;
    return r;
}
fn i128_from_u32_array(_number: array<u32, 4>, _sign: i32) -> i128 {
    var r = i128();
    r.number = _number;
    r.sign   = _sign;
    return r;
}
fn i256_from_i32(_n: i32) -> i256 {
    var r = i256();
    r.number[7] = u32(abs(_n));
    r.sign = select(1, -1, _n < 0);
    return r;
}
fn i256_from_u32(_n: u32) -> i256 {
    var r = i256();
    r.number[7] = _n;
    r.sign = 1;
    return r;
}
fn i256_from_i128(_n: i128) -> i256 {
    var r = i256();
    var arr = array<u32, 8>();
    for (var i = u32(0); i != 4; i++) {
        arr[7 - i] = _n.number[3 - i];
    }
    r.number = arr;
    r.sign   = _n.sign;
    return r;
}
fn i256_from_u32_array(_number: array<u32, 8>, _sign: i32) -> i256 {
    var r = i256();
    r.number = _number;
    r.sign   = _sign;
    return r;
}
fn i512_from_i32(_n: i32) -> i512 {
    var r = i512();
    r.number[15] = u32(abs(_n));
    r.sign = select(1, -1, _n < 0);
    return r;
}
fn i512_from_u32(_n: u32) -> i512 {
    var r = i512();
    r.number[15] = _n;
    r.sign = 1;
    return r;
}
fn i512_from_i256(_n: i256) -> i512 {
    var r = i512();
    var arr = array<u32, 16>();
    for (var i = u32(0); i != 8; i++) {
        arr[15 - i] = _n.number[7 - i];
    }
    r.number = arr;
    r.sign   = _n.sign;
    return r;
}
fn i512_from_u32_array(_number: array<u32, 16>, _sign: i32) -> i512 {
    var r = i512();
    r.number = _number;
    r.sign   = _sign;
    return r;
}
fn i1024_from_i32(_n: i32) -> i1024 {
    var r = i1024();
    r.number[31] = u32(abs(_n));
    r.sign = select(1, -1, _n < 0);
    return r;
}
fn i1024_from_u32(_n: u32) -> i1024 {
    var r = i1024();
    r.number[31] = _n;
    r.sign = 1;
    return r;
}
fn i1024_from_i512(_n: i512) -> i1024 {
    var r = i1024();
    var arr = array<u32, 32>();
    for (var i = u32(0); i != 16; i++) {
        arr[31 - i] = _n.number[15 - i];
    }
    r.number = arr;
    r.sign   = _n.sign;
    return r;
}
fn i1024_from_u32_array(_number: array<u32, 32>, _sign: i32) -> i1024 {
    var r = i1024();
    r.number = _number;
    r.sign   = _sign;
    return r;
}
fn i2048_from_i32(_n: i32) -> i2048 {
    var r = i2048();
    r.number[63] = u32(abs(_n));
    r.sign = select(1, -1, _n < 0);
    return r;
}
fn i2048_from_u32(_n: u32) -> i2048 {
    var r = i2048();
    r.number[63] = _n;
    r.sign = 1;
    return r;
}
fn i2048_from_i1024(_n: i1024) -> i2048 {
    var r = i2048();
    var arr = array<u32, 64>();
    for (var i = u32(0); i != 32; i++) {
        arr[63 - i] = _n.number[31 - i];
    }
    r.number = arr;
    r.sign   = _n.sign;
    return r;
}
fn i2048_from_u32_array(_number: array<u32, 64>, _sign: i32) -> i2048 {
    var r = i2048();
    r.number = _number;
    r.sign   = _sign;
    return r;
}
fn i4096_from_i32(_n: i32) -> i4096 {
    var r = i4096();
    r.number[127] = u32(abs(_n));
    r.sign = select(1, -1, _n < 0);
    return r;
}
fn i4096_from_u32(_n: u32) -> i4096 {
    var r = i4096();
    r.number[127] = _n;
    r.sign = 1;
    return r;
}
fn i4096_from_i2048(_n: i2048) -> i4096 {
    var r = i4096();
    var arr = array<u32, 128>();
    for (var i = u32(0); i != 64; i++) {
        arr[127 - i] = _n.number[63 - i];
    }
    r.number = arr;
    r.sign   = _n.sign;
    return r;
}
fn i4096_from_u32_array(_number: array<u32, 128>, _sign: i32) -> i4096 {
    var r = i4096();
    r.number = _number;
    r.sign   = _sign;
    return r;
}
fn i8192_from_i32(_n: i32) -> i8192 {
    var r = i8192();
    r.number[255] = u32(abs(_n));
    r.sign = select(1, -1, _n < 0);
    return r;
}
fn i8192_from_u32(_n: u32) -> i8192 {
    var r = i8192();
    r.number[255] = _n;
    r.sign = 1;
    return r;
}
fn i8192_from_i4096(_n: i4096) -> i8192 {
    var r = i8192();
    var arr = array<u32, 256>();
    for (var i = u32(0); i != 128; i++) {
        arr[255 - i] = _n.number[127 - i];
    }
    r.number = arr;
    r.sign   = _n.sign;
    return r;
}
fn i8192_from_u32_array(_number: array<u32, 256>, _sign: i32) -> i8192 {
    var r = i8192();
    r.number = _number;
    r.sign   = _sign;
    return r;
}
fn i16384_from_i32(_n: i32) -> i16384 {
    var r = i16384();
    r.number[511] = u32(abs(_n));
    r.sign = select(1, -1, _n < 0);
    return r;
}
fn i16384_from_u32(_n: u32) -> i16384 {
    var r = i16384();
    r.number[511] = _n;
    r.sign = 1;
    return r;
}
fn i16384_from_i8192(_n: i8192) -> i16384 {
    var r = i16384();
    var arr = array<u32, 512>();
    for (var i = u32(0); i != 256; i++) {
        arr[511 - i] = _n.number[255 - i];
    }
    r.number = arr;
    r.sign   = _n.sign;
    return r;
}
fn i16384_from_u32_array(_number: array<u32, 512>, _sign: i32) -> i16384 {
    var r = i16384();
    r.number = _number;
    r.sign   = _sign;
    return r;
}

// Unary operators
fn i64_abs(_n: i64) -> i64 {
    var r = _n;
    r.sign = 1;
    return r;
}
fn i64_negate(_n: i64) -> i64 {
    var r = _n;
    r.sign = -1;
    return r;
}
fn i64_opposite(_n: i64) -> i64 {
    var r = _n;
    r.sign = select(1, -1, r.sign == 1);
    return r;
}
fn i128_abs(_n: i128) -> i128 {
    var r = _n;
    r.sign = 1;
    return r;
}
fn i128_negate(_n: i128) -> i128 {
    var r = _n;
    r.sign = -1;
    return r;
}
fn i128_opposite(_n: i128) -> i128 {
    var r = _n;
    r.sign = select(1, -1, r.sign == 1);
    return r;
}
fn i256_abs(_n: i256) -> i256 {
    var r = _n;
    r.sign = 1;
    return r;
}
fn i256_negate(_n: i256) -> i256 {
    var r = _n;
    r.sign = -1;
    return r;
}
fn i256_opposite(_n: i256) -> i256 {
    var r = _n;
    r.sign = select(1, -1, r.sign == 1);
    return r;
}
fn i512_abs(_n: i512) -> i512 {
    var r = _n;
    r.sign = 1;
    return r;
}
fn i512_negate(_n: i512) -> i512 {
    var r = _n;
    r.sign = -1;
    return r;
}
fn i512_opposite(_n: i512) -> i512 {
    var r = _n;
    r.sign = select(1, -1, r.sign == 1);
    return r;
}
fn i1024_abs(_n: i1024) -> i1024 {
    var r = _n;
    r.sign = 1;
    return r;
}
fn i1024_negate(_n: i1024) -> i1024 {
    var r = _n;
    r.sign = -1;
    return r;
}
fn i1024_opposite(_n: i1024) -> i1024 {
    var r = _n;
    r.sign = select(1, -1, r.sign == 1);
    return r;
}
fn i2048_abs(_n: i2048) -> i2048 {
    var r = _n;
    r.sign = 1;
    return r;
}
fn i2048_negate(_n: i2048) -> i2048 {
    var r = _n;
    r.sign = -1;
    return r;
}
fn i2048_opposite(_n: i2048) -> i2048 {
    var r = _n;
    r.sign = select(1, -1, r.sign == 1);
    return r;
}
fn i4096_abs(_n: i4096) -> i4096 {
    var r = _n;
    r.sign = 1;
    return r;
}
fn i4096_negate(_n: i4096) -> i4096 {
    var r = _n;
    r.sign = -1;
    return r;
}
fn i4096_opposite(_n: i4096) -> i4096 {
    var r = _n;
    r.sign = select(1, -1, r.sign == 1);
    return r;
}
fn i8192_abs(_n: i8192) -> i8192 {
    var r = _n;
    r.sign = 1;
    return r;
}
fn i8192_negate(_n: i8192) -> i8192 {
    var r = _n;
    r.sign = -1;
    return r;
}
fn i8192_opposite(_n: i8192) -> i8192 {
    var r = _n;
    r.sign = select(1, -1, r.sign == 1);
    return r;
}
fn i16384_abs(_n: i16384) -> i16384 {
    var r = _n;
    r.sign = 1;
    return r;
}
fn i16384_negate(_n: i16384) -> i16384 {
    var r = _n;
    r.sign = -1;
    return r;
}
fn i16384_opposite(_n: i16384) -> i16384 {
    var r = _n;
    r.sign = select(1, -1, r.sign == 1);
    return r;
}

// Logic operators
fn i64_and(_a: i64, _b: i64) -> i64 {
    var r = i64_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 2; i++) {
        r.number[i] = _a.number[i] & _b.number[i];
    }
    return r;
}
fn i64_or(_a: i64, _b: i64) -> i64 {
    var r = i64_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 2; i++) {
    	r.number[i] = _a.number[i] | _b.number[i];
    }
    return r;
}
fn i64_xor(_a: i64, _b: i64) -> i64 {
    var r = i64_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 2; i++) {
    	r.number[i] = _a.number[i] ^ _b.number[i];
    }
    return r;
}
fn i128_and(_a: i128, _b: i128) -> i128 {
    var r = i128_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 4; i++) {
        r.number[i] = _a.number[i] & _b.number[i];
    }
    return r;
}
fn i128_or(_a: i128, _b: i128) -> i128 {
    var r = i128_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 4; i++) {
    	r.number[i] = _a.number[i] | _b.number[i];
    }
    return r;
}
fn i128_xor(_a: i128, _b: i128) -> i128 {
    var r = i128_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 4; i++) {
    	r.number[i] = _a.number[i] ^ _b.number[i];
    }
    return r;
}
fn i256_and(_a: i256, _b: i256) -> i256 {
    var r = i256_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 8; i++) {
        r.number[i] = _a.number[i] & _b.number[i];
    }
    return r;
}
fn i256_or(_a: i256, _b: i256) -> i256 {
    var r = i256_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 8; i++) {
    	r.number[i] = _a.number[i] | _b.number[i];
    }
    return r;
}
fn i256_xor(_a: i256, _b: i256) -> i256 {
    var r = i256_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 8; i++) {
    	r.number[i] = _a.number[i] ^ _b.number[i];
    }
    return r;
}
fn i512_and(_a: i512, _b: i512) -> i512 {
    var r = i512_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 16; i++) {
        r.number[i] = _a.number[i] & _b.number[i];
    }
    return r;
}
fn i512_or(_a: i512, _b: i512) -> i512 {
    var r = i512_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 16; i++) {
    	r.number[i] = _a.number[i] | _b.number[i];
    }
    return r;
}
fn i512_xor(_a: i512, _b: i512) -> i512 {
    var r = i512_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 16; i++) {
    	r.number[i] = _a.number[i] ^ _b.number[i];
    }
    return r;
}
fn i1024_and(_a: i1024, _b: i1024) -> i1024 {
    var r = i1024_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 32; i++) {
        r.number[i] = _a.number[i] & _b.number[i];
    }
    return r;
}
fn i1024_or(_a: i1024, _b: i1024) -> i1024 {
    var r = i1024_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 32; i++) {
    	r.number[i] = _a.number[i] | _b.number[i];
    }
    return r;
}
fn i1024_xor(_a: i1024, _b: i1024) -> i1024 {
    var r = i1024_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 32; i++) {
    	r.number[i] = _a.number[i] ^ _b.number[i];
    }
    return r;
}
fn i2048_and(_a: i2048, _b: i2048) -> i2048 {
    var r = i2048_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 64; i++) {
        r.number[i] = _a.number[i] & _b.number[i];
    }
    return r;
}
fn i2048_or(_a: i2048, _b: i2048) -> i2048 {
    var r = i2048_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 64; i++) {
    	r.number[i] = _a.number[i] | _b.number[i];
    }
    return r;
}
fn i2048_xor(_a: i2048, _b: i2048) -> i2048 {
    var r = i2048_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 64; i++) {
    	r.number[i] = _a.number[i] ^ _b.number[i];
    }
    return r;
}
fn i4096_and(_a: i4096, _b: i4096) -> i4096 {
    var r = i4096_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 128; i++) {
        r.number[i] = _a.number[i] & _b.number[i];
    }
    return r;
}
fn i4096_or(_a: i4096, _b: i4096) -> i4096 {
    var r = i4096_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 128; i++) {
    	r.number[i] = _a.number[i] | _b.number[i];
    }
    return r;
}
fn i4096_xor(_a: i4096, _b: i4096) -> i4096 {
    var r = i4096_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 128; i++) {
    	r.number[i] = _a.number[i] ^ _b.number[i];
    }
    return r;
}
fn i8192_and(_a: i8192, _b: i8192) -> i8192 {
    var r = i8192_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 256; i++) {
        r.number[i] = _a.number[i] & _b.number[i];
    }
    return r;
}
fn i8192_or(_a: i8192, _b: i8192) -> i8192 {
    var r = i8192_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 256; i++) {
    	r.number[i] = _a.number[i] | _b.number[i];
    }
    return r;
}
fn i8192_xor(_a: i8192, _b: i8192) -> i8192 {
    var r = i8192_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 256; i++) {
    	r.number[i] = _a.number[i] ^ _b.number[i];
    }
    return r;
}
fn i16384_and(_a: i16384, _b: i16384) -> i16384 {
    var r = i16384_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 512; i++) {
        r.number[i] = _a.number[i] & _b.number[i];
    }
    return r;
}
fn i16384_or(_a: i16384, _b: i16384) -> i16384 {
    var r = i16384_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 512; i++) {
    	r.number[i] = _a.number[i] | _b.number[i];
    }
    return r;
}
fn i16384_xor(_a: i16384, _b: i16384) -> i16384 {
    var r = i16384_from_u32(0);
    r.sign = 1;
    for (var i = u32(0); i != 512; i++) {
    	r.number[i] = _a.number[i] ^ _b.number[i];
    }
    return r;
}

// Bitwise shift operators
fn i64_left_shift(_n: i64, _s: u32) -> i64 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 1; j++) {
	        r.number[j] = (r.number[j] << 31) | (r.number[j + 1] >> 1);
	    }
        r.number[1] = r.number[1] << 31;
    }
    for (var j = u32(0); j != 1; j++) {
        r.number[j] = (r.number[j] << shiftLastLoop) | select(r.number[j + 1] >> (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[1] = r.number[1] << shiftLastLoop;
    return r;
}
fn i64_right_shift(_n: i64, _s: u32) -> i64 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 1; j++) {
            r.number[1 - j] = (r.number[1 - j] >> 31) | (r.number[1 - j - 1] << 1);
        }
        r.number[0] = r.number[0] >> 31;
    }
    for (var j = u32(0); j != 1; j++) {
        r.number[1 - j] = (r.number[1 - j] >> shiftLastLoop) | select(r.number[1 - j - 1] << (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[0] = r.number[0] >> shiftLastLoop;
    return r;
}
fn i128_left_shift(_n: i128, _s: u32) -> i128 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 3; j++) {
	        r.number[j] = (r.number[j] << 31) | (r.number[j + 1] >> 1);
	    }
        r.number[3] = r.number[3] << 31;
    }
    for (var j = u32(0); j != 3; j++) {
        r.number[j] = (r.number[j] << shiftLastLoop) | select(r.number[j + 1] >> (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[3] = r.number[3] << shiftLastLoop;
    return r;
}
fn i128_right_shift(_n: i128, _s: u32) -> i128 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 3; j++) {
            r.number[3 - j] = (r.number[3 - j] >> 31) | (r.number[3 - j - 1] << 1);
        }
        r.number[0] = r.number[0] >> 31;
    }
    for (var j = u32(0); j != 3; j++) {
        r.number[3 - j] = (r.number[3 - j] >> shiftLastLoop) | select(r.number[3 - j - 1] << (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[0] = r.number[0] >> shiftLastLoop;
    return r;
}
fn i256_left_shift(_n: i256, _s: u32) -> i256 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 7; j++) {
	        r.number[j] = (r.number[j] << 31) | (r.number[j + 1] >> 1);
	    }
        r.number[7] = r.number[7] << 31;
    }
    for (var j = u32(0); j != 7; j++) {
        r.number[j] = (r.number[j] << shiftLastLoop) | select(r.number[j + 1] >> (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[7] = r.number[7] << shiftLastLoop;
    return r;
}
fn i256_right_shift(_n: i256, _s: u32) -> i256 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 7; j++) {
            r.number[7 - j] = (r.number[7 - j] >> 31) | (r.number[7 - j - 1] << 1);
        }
        r.number[0] = r.number[0] >> 31;
    }
    for (var j = u32(0); j != 7; j++) {
        r.number[7 - j] = (r.number[7 - j] >> shiftLastLoop) | select(r.number[7 - j - 1] << (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[0] = r.number[0] >> shiftLastLoop;
    return r;
}
fn i512_left_shift(_n: i512, _s: u32) -> i512 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 15; j++) {
	        r.number[j] = (r.number[j] << 31) | (r.number[j + 1] >> 1);
	    }
        r.number[15] = r.number[15] << 31;
    }
    for (var j = u32(0); j != 15; j++) {
        r.number[j] = (r.number[j] << shiftLastLoop) | select(r.number[j + 1] >> (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[15] = r.number[15] << shiftLastLoop;
    return r;
}
fn i512_right_shift(_n: i512, _s: u32) -> i512 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 15; j++) {
            r.number[15 - j] = (r.number[15 - j] >> 31) | (r.number[15 - j - 1] << 1);
        }
        r.number[0] = r.number[0] >> 31;
    }
    for (var j = u32(0); j != 15; j++) {
        r.number[15 - j] = (r.number[15 - j] >> shiftLastLoop) | select(r.number[15 - j - 1] << (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[0] = r.number[0] >> shiftLastLoop;
    return r;
}
fn i1024_left_shift(_n: i1024, _s: u32) -> i1024 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 31; j++) {
	        r.number[j] = (r.number[j] << 31) | (r.number[j + 1] >> 1);
	    }
        r.number[31] = r.number[31] << 31;
    }
    for (var j = u32(0); j != 31; j++) {
        r.number[j] = (r.number[j] << shiftLastLoop) | select(r.number[j + 1] >> (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[31] = r.number[31] << shiftLastLoop;
    return r;
}
fn i1024_right_shift(_n: i1024, _s: u32) -> i1024 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 31; j++) {
            r.number[31 - j] = (r.number[31 - j] >> 31) | (r.number[31 - j - 1] << 1);
        }
        r.number[0] = r.number[0] >> 31;
    }
    for (var j = u32(0); j != 31; j++) {
        r.number[31 - j] = (r.number[31 - j] >> shiftLastLoop) | select(r.number[31 - j - 1] << (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[0] = r.number[0] >> shiftLastLoop;
    return r;
}
fn i2048_left_shift(_n: i2048, _s: u32) -> i2048 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 63; j++) {
	        r.number[j] = (r.number[j] << 31) | (r.number[j + 1] >> 1);
	    }
        r.number[63] = r.number[63] << 31;
    }
    for (var j = u32(0); j != 63; j++) {
        r.number[j] = (r.number[j] << shiftLastLoop) | select(r.number[j + 1] >> (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[63] = r.number[63] << shiftLastLoop;
    return r;
}
fn i2048_right_shift(_n: i2048, _s: u32) -> i2048 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 63; j++) {
            r.number[63 - j] = (r.number[63 - j] >> 31) | (r.number[63 - j - 1] << 1);
        }
        r.number[0] = r.number[0] >> 31;
    }
    for (var j = u32(0); j != 63; j++) {
        r.number[63 - j] = (r.number[63 - j] >> shiftLastLoop) | select(r.number[63 - j - 1] << (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[0] = r.number[0] >> shiftLastLoop;
    return r;
}
fn i4096_left_shift(_n: i4096, _s: u32) -> i4096 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 127; j++) {
	        r.number[j] = (r.number[j] << 31) | (r.number[j + 1] >> 1);
	    }
        r.number[127] = r.number[127] << 31;
    }
    for (var j = u32(0); j != 127; j++) {
        r.number[j] = (r.number[j] << shiftLastLoop) | select(r.number[j + 1] >> (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[127] = r.number[127] << shiftLastLoop;
    return r;
}
fn i4096_right_shift(_n: i4096, _s: u32) -> i4096 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 127; j++) {
            r.number[127 - j] = (r.number[127 - j] >> 31) | (r.number[127 - j - 1] << 1);
        }
        r.number[0] = r.number[0] >> 31;
    }
    for (var j = u32(0); j != 127; j++) {
        r.number[127 - j] = (r.number[127 - j] >> shiftLastLoop) | select(r.number[127 - j - 1] << (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[0] = r.number[0] >> shiftLastLoop;
    return r;
}
fn i8192_left_shift(_n: i8192, _s: u32) -> i8192 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 255; j++) {
	        r.number[j] = (r.number[j] << 31) | (r.number[j + 1] >> 1);
	    }
        r.number[255] = r.number[255] << 31;
    }
    for (var j = u32(0); j != 255; j++) {
        r.number[j] = (r.number[j] << shiftLastLoop) | select(r.number[j + 1] >> (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[255] = r.number[255] << shiftLastLoop;
    return r;
}
fn i8192_right_shift(_n: i8192, _s: u32) -> i8192 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 255; j++) {
            r.number[255 - j] = (r.number[255 - j] >> 31) | (r.number[255 - j - 1] << 1);
        }
        r.number[0] = r.number[0] >> 31;
    }
    for (var j = u32(0); j != 255; j++) {
        r.number[255 - j] = (r.number[255 - j] >> shiftLastLoop) | select(r.number[255 - j - 1] << (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[0] = r.number[0] >> shiftLastLoop;
    return r;
}
fn i16384_left_shift(_n: i16384, _s: u32) -> i16384 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 511; j++) {
	        r.number[j] = (r.number[j] << 31) | (r.number[j + 1] >> 1);
	    }
        r.number[511] = r.number[511] << 31;
    }
    for (var j = u32(0); j != 511; j++) {
        r.number[j] = (r.number[j] << shiftLastLoop) | select(r.number[j + 1] >> (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[511] = r.number[511] << shiftLastLoop;
    return r;
}
fn i16384_right_shift(_n: i16384, _s: u32) -> i16384 {
    var r = _n;
    var shiftLoops    = u32(floor(f32(_s) / 31));
    var shiftLastLoop = u32(_s % 31);
    for (var i = u32(0); i != shiftLoops; i++) {
        for (var j = u32(0); j != 511; j++) {
            r.number[511 - j] = (r.number[511 - j] >> 31) | (r.number[511 - j - 1] << 1);
        }
        r.number[0] = r.number[0] >> 31;
    }
    for (var j = u32(0); j != 511; j++) {
        r.number[511 - j] = (r.number[511 - j] >> shiftLastLoop) | select(r.number[511 - j - 1] << (32 - shiftLastLoop), 0x00000000, shiftLastLoop == 0);
    }
    r.number[0] = r.number[0] >> shiftLastLoop;
    return r;
}

// Comparison operators
fn i64_eq(_a: i64, _b: i64) -> bool {
    var is_zero = true;
    for (var i = u32(0); i != 2; i++) {
        is_zero &= _a.number[i] == 0 && _b.number[i] == 0;
        if (!is_zero) {
            break;
        }
    }
    if (is_zero) {
        return true;
    }
    var is_equal = true;
    for (var i = u32(0); i != 2; i++) {
        is_equal &= _a.number[i] == _b.number[i];
        if (!is_equal) {
            break;
        }
    }
    return is_equal && _a.sign == _b.sign;
}
fn i64_greater(_a: i64, _b: i64) -> bool {
    for (var i = u32(0); i != 2; i++) {
        if (_a.number[i] > _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign != -1; 
            }
            else {
                return _a.sign == 1;
            }
        }
        if (_a.number[i] < _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign == -1;
            }
            else {
                return _a.sign == 1;
            }
        }
    }
    return false;
}
fn i64_greater_eq(_a: i64, _b: i64) -> bool {
    if (i64_greater(_a, _b) || i64_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i64_less(_a: i64, _b: i64) -> bool {
    if (!i64_greater_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i64_less_eq(_a: i64, _b: i64) -> bool {
    if (!i64_greater(_a, _b)) {
        return true;
    }
    return false;
}
fn i128_eq(_a: i128, _b: i128) -> bool {
    var is_zero = true;
    for (var i = u32(0); i != 4; i++) {
        is_zero &= _a.number[i] == 0 && _b.number[i] == 0;
        if (!is_zero) {
            break;
        }
    }
    if (is_zero) {
        return true;
    }
    var is_equal = true;
    for (var i = u32(0); i != 4; i++) {
        is_equal &= _a.number[i] == _b.number[i];
        if (!is_equal) {
            break;
        }
    }
    return is_equal && _a.sign == _b.sign;
}
fn i128_greater(_a: i128, _b: i128) -> bool {
    for (var i = u32(0); i != 4; i++) {
        if (_a.number[i] > _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign != -1; 
            }
            else {
                return _a.sign == 1;
            }
        }
        if (_a.number[i] < _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign == -1;
            }
            else {
                return _a.sign == 1;
            }
        }
    }
    return false;
}
fn i128_greater_eq(_a: i128, _b: i128) -> bool {
    if (i128_greater(_a, _b) || i128_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i128_less(_a: i128, _b: i128) -> bool {
    if (!i128_greater_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i128_less_eq(_a: i128, _b: i128) -> bool {
    if (!i128_greater(_a, _b)) {
        return true;
    }
    return false;
}
fn i256_eq(_a: i256, _b: i256) -> bool {
    var is_zero = true;
    for (var i = u32(0); i != 8; i++) {
        is_zero &= _a.number[i] == 0 && _b.number[i] == 0;
        if (!is_zero) {
            break;
        }
    }
    if (is_zero) {
        return true;
    }
    var is_equal = true;
    for (var i = u32(0); i != 8; i++) {
        is_equal &= _a.number[i] == _b.number[i];
        if (!is_equal) {
            break;
        }
    }
    return is_equal && _a.sign == _b.sign;
}
fn i256_greater(_a: i256, _b: i256) -> bool {
    for (var i = u32(0); i != 8; i++) {
        if (_a.number[i] > _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign != -1; 
            }
            else {
                return _a.sign == 1;
            }
        }
        if (_a.number[i] < _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign == -1;
            }
            else {
                return _a.sign == 1;
            }
        }
    }
    return false;
}
fn i256_greater_eq(_a: i256, _b: i256) -> bool {
    if (i256_greater(_a, _b) || i256_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i256_less(_a: i256, _b: i256) -> bool {
    if (!i256_greater_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i256_less_eq(_a: i256, _b: i256) -> bool {
    if (!i256_greater(_a, _b)) {
        return true;
    }
    return false;
}
fn i512_eq(_a: i512, _b: i512) -> bool {
    var is_zero = true;
    for (var i = u32(0); i != 16; i++) {
        is_zero &= _a.number[i] == 0 && _b.number[i] == 0;
        if (!is_zero) {
            break;
        }
    }
    if (is_zero) {
        return true;
    }
    var is_equal = true;
    for (var i = u32(0); i != 16; i++) {
        is_equal &= _a.number[i] == _b.number[i];
        if (!is_equal) {
            break;
        }
    }
    return is_equal && _a.sign == _b.sign;
}
fn i512_greater(_a: i512, _b: i512) -> bool {
    for (var i = u32(0); i != 16; i++) {
        if (_a.number[i] > _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign != -1; 
            }
            else {
                return _a.sign == 1;
            }
        }
        if (_a.number[i] < _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign == -1;
            }
            else {
                return _a.sign == 1;
            }
        }
    }
    return false;
}
fn i512_greater_eq(_a: i512, _b: i512) -> bool {
    if (i512_greater(_a, _b) || i512_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i512_less(_a: i512, _b: i512) -> bool {
    if (!i512_greater_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i512_less_eq(_a: i512, _b: i512) -> bool {
    if (!i512_greater(_a, _b)) {
        return true;
    }
    return false;
}
fn i1024_eq(_a: i1024, _b: i1024) -> bool {
    var is_zero = true;
    for (var i = u32(0); i != 32; i++) {
        is_zero &= _a.number[i] == 0 && _b.number[i] == 0;
        if (!is_zero) {
            break;
        }
    }
    if (is_zero) {
        return true;
    }
    var is_equal = true;
    for (var i = u32(0); i != 32; i++) {
        is_equal &= _a.number[i] == _b.number[i];
        if (!is_equal) {
            break;
        }
    }
    return is_equal && _a.sign == _b.sign;
}
fn i1024_greater(_a: i1024, _b: i1024) -> bool {
    for (var i = u32(0); i != 32; i++) {
        if (_a.number[i] > _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign != -1; 
            }
            else {
                return _a.sign == 1;
            }
        }
        if (_a.number[i] < _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign == -1;
            }
            else {
                return _a.sign == 1;
            }
        }
    }
    return false;
}
fn i1024_greater_eq(_a: i1024, _b: i1024) -> bool {
    if (i1024_greater(_a, _b) || i1024_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i1024_less(_a: i1024, _b: i1024) -> bool {
    if (!i1024_greater_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i1024_less_eq(_a: i1024, _b: i1024) -> bool {
    if (!i1024_greater(_a, _b)) {
        return true;
    }
    return false;
}
fn i2048_eq(_a: i2048, _b: i2048) -> bool {
    var is_zero = true;
    for (var i = u32(0); i != 64; i++) {
        is_zero &= _a.number[i] == 0 && _b.number[i] == 0;
        if (!is_zero) {
            break;
        }
    }
    if (is_zero) {
        return true;
    }
    var is_equal = true;
    for (var i = u32(0); i != 64; i++) {
        is_equal &= _a.number[i] == _b.number[i];
        if (!is_equal) {
            break;
        }
    }
    return is_equal && _a.sign == _b.sign;
}
fn i2048_greater(_a: i2048, _b: i2048) -> bool {
    for (var i = u32(0); i != 64; i++) {
        if (_a.number[i] > _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign != -1; 
            }
            else {
                return _a.sign == 1;
            }
        }
        if (_a.number[i] < _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign == -1;
            }
            else {
                return _a.sign == 1;
            }
        }
    }
    return false;
}
fn i2048_greater_eq(_a: i2048, _b: i2048) -> bool {
    if (i2048_greater(_a, _b) || i2048_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i2048_less(_a: i2048, _b: i2048) -> bool {
    if (!i2048_greater_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i2048_less_eq(_a: i2048, _b: i2048) -> bool {
    if (!i2048_greater(_a, _b)) {
        return true;
    }
    return false;
}
fn i4096_eq(_a: i4096, _b: i4096) -> bool {
    var is_zero = true;
    for (var i = u32(0); i != 128; i++) {
        is_zero &= _a.number[i] == 0 && _b.number[i] == 0;
        if (!is_zero) {
            break;
        }
    }
    if (is_zero) {
        return true;
    }
    var is_equal = true;
    for (var i = u32(0); i != 128; i++) {
        is_equal &= _a.number[i] == _b.number[i];
        if (!is_equal) {
            break;
        }
    }
    return is_equal && _a.sign == _b.sign;
}
fn i4096_greater(_a: i4096, _b: i4096) -> bool {
    for (var i = u32(0); i != 128; i++) {
        if (_a.number[i] > _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign != -1; 
            }
            else {
                return _a.sign == 1;
            }
        }
        if (_a.number[i] < _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign == -1;
            }
            else {
                return _a.sign == 1;
            }
        }
    }
    return false;
}
fn i4096_greater_eq(_a: i4096, _b: i4096) -> bool {
    if (i4096_greater(_a, _b) || i4096_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i4096_less(_a: i4096, _b: i4096) -> bool {
    if (!i4096_greater_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i4096_less_eq(_a: i4096, _b: i4096) -> bool {
    if (!i4096_greater(_a, _b)) {
        return true;
    }
    return false;
}
fn i8192_eq(_a: i8192, _b: i8192) -> bool {
    var is_zero = true;
    for (var i = u32(0); i != 256; i++) {
        is_zero &= _a.number[i] == 0 && _b.number[i] == 0;
        if (!is_zero) {
            break;
        }
    }
    if (is_zero) {
        return true;
    }
    var is_equal = true;
    for (var i = u32(0); i != 256; i++) {
        is_equal &= _a.number[i] == _b.number[i];
        if (!is_equal) {
            break;
        }
    }
    return is_equal && _a.sign == _b.sign;
}
fn i8192_greater(_a: i8192, _b: i8192) -> bool {
    for (var i = u32(0); i != 256; i++) {
        if (_a.number[i] > _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign != -1; 
            }
            else {
                return _a.sign == 1;
            }
        }
        if (_a.number[i] < _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign == -1;
            }
            else {
                return _a.sign == 1;
            }
        }
    }
    return false;
}
fn i8192_greater_eq(_a: i8192, _b: i8192) -> bool {
    if (i8192_greater(_a, _b) || i8192_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i8192_less(_a: i8192, _b: i8192) -> bool {
    if (!i8192_greater_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i8192_less_eq(_a: i8192, _b: i8192) -> bool {
    if (!i8192_greater(_a, _b)) {
        return true;
    }
    return false;
}
fn i16384_eq(_a: i16384, _b: i16384) -> bool {
    var is_zero = true;
    for (var i = u32(0); i != 512; i++) {
        is_zero &= _a.number[i] == 0 && _b.number[i] == 0;
        if (!is_zero) {
            break;
        }
    }
    if (is_zero) {
        return true;
    }
    var is_equal = true;
    for (var i = u32(0); i != 512; i++) {
        is_equal &= _a.number[i] == _b.number[i];
        if (!is_equal) {
            break;
        }
    }
    return is_equal && _a.sign == _b.sign;
}
fn i16384_greater(_a: i16384, _b: i16384) -> bool {
    for (var i = u32(0); i != 512; i++) {
        if (_a.number[i] > _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign != -1; 
            }
            else {
                return _a.sign == 1;
            }
        }
        if (_a.number[i] < _b.number[i]) {
            if (_a.sign * _b.sign == 1) {
                return _a.sign == -1;
            }
            else {
                return _a.sign == 1;
            }
        }
    }
    return false;
}
fn i16384_greater_eq(_a: i16384, _b: i16384) -> bool {
    if (i16384_greater(_a, _b) || i16384_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i16384_less(_a: i16384, _b: i16384) -> bool {
    if (!i16384_greater_eq(_a, _b)) {
        return true;
    }
    return false;
}
fn i16384_less_eq(_a: i16384, _b: i16384) -> bool {
    if (!i16384_greater(_a, _b)) {
        return true;
    }
    return false;
}

// Max and Min operators
fn i64_max(_a: i64, _b: i64) -> i64 {
    if (i64_greater(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i64_min(_a: i64, _b: i64) -> i64 {
    if (i64_less(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i128_max(_a: i128, _b: i128) -> i128 {
    if (i128_greater(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i128_min(_a: i128, _b: i128) -> i128 {
    if (i128_less(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i256_max(_a: i256, _b: i256) -> i256 {
    if (i256_greater(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i256_min(_a: i256, _b: i256) -> i256 {
    if (i256_less(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i512_max(_a: i512, _b: i512) -> i512 {
    if (i512_greater(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i512_min(_a: i512, _b: i512) -> i512 {
    if (i512_less(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i1024_max(_a: i1024, _b: i1024) -> i1024 {
    if (i1024_greater(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i1024_min(_a: i1024, _b: i1024) -> i1024 {
    if (i1024_less(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i2048_max(_a: i2048, _b: i2048) -> i2048 {
    if (i2048_greater(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i2048_min(_a: i2048, _b: i2048) -> i2048 {
    if (i2048_less(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i4096_max(_a: i4096, _b: i4096) -> i4096 {
    if (i4096_greater(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i4096_min(_a: i4096, _b: i4096) -> i4096 {
    if (i4096_less(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i8192_max(_a: i8192, _b: i8192) -> i8192 {
    if (i8192_greater(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i8192_min(_a: i8192, _b: i8192) -> i8192 {
    if (i8192_less(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i16384_max(_a: i16384, _b: i16384) -> i16384 {
    if (i16384_greater(_a, _b)) {
        return _a;
    }
    return _b;
}
fn i16384_min(_a: i16384, _b: i16384) -> i16384 {
    if (i16384_less(_a, _b)) {
        return _a;
    }
    return _b;
}

// Sum and Sub operators
fn i64_sum(_a: i64, _b: i64) -> i64 {
    var first  = _a;
    var second = _b;
    if (i64_less(i64_abs(first), i64_abs(second))) {
        var temp = first;
        first  = second;
        second = temp;
    }
    if (first.sign == -1 && second.sign == -1) {
        return i64_negate(summation64(i64_abs(first), i64_abs(second)));
    }
    if (first.sign == 1 && second.sign == -1) {
        return subtraction64(first, i64_abs(second));
    }
    if (first.sign == -1 && second.sign == 1) {
        return i64_negate(subtraction64(i64_abs(first), second));
    }
    return summation64(first, second);
}
fn i64_sub(_a: i64, _b: i64) -> i64 {
    var first    = _a;
    var second   = _b;
    var opposite = u32(0);
    if (i64_less(i64_abs(first), i64_abs(second))) {
        var temp = first;
        first    = second;
        second   = temp;
        opposite = 1;
    }
    if (first.sign == -1 && second.sign == -1) {
        if (opposite == 1) {
            return i64_opposite(i64_negate(subtraction64(i64_abs(first), i64_abs(second))));
        }
        else {
            return i64_negate(subtraction64(i64_abs(first), i64_abs(second)));
        }
    }
    if (first.sign == 1 && second.sign == -1) {
        if (opposite == 1) {
            return i64_opposite(summation64(first, i64_abs(second)));
        }
        else {
            return summation64(first, i64_abs(second));
        }
    }
    if (first.sign == -1 && second.sign == 1) {
        if (opposite == 1) {
            return i64_opposite(i64_negate(summation64(i64_abs(first), second)));
        }
        else {
            return i64_negate(summation64(i64_abs(first), second));
        }
    }
    if (opposite == 1) {
        return i64_opposite(subtraction64(first, second));
    }
    else {
        return subtraction64(first, second);
    }
}
fn i128_sum(_a: i128, _b: i128) -> i128 {
    var first  = _a;
    var second = _b;
    if (i128_less(i128_abs(first), i128_abs(second))) {
        var temp = first;
        first  = second;
        second = temp;
    }
    if (first.sign == -1 && second.sign == -1) {
        return i128_negate(summation128(i128_abs(first), i128_abs(second)));
    }
    if (first.sign == 1 && second.sign == -1) {
        return subtraction128(first, i128_abs(second));
    }
    if (first.sign == -1 && second.sign == 1) {
        return i128_negate(subtraction128(i128_abs(first), second));
    }
    return summation128(first, second);
}
fn i128_sub(_a: i128, _b: i128) -> i128 {
    var first    = _a;
    var second   = _b;
    var opposite = u32(0);
    if (i128_less(i128_abs(first), i128_abs(second))) {
        var temp = first;
        first    = second;
        second   = temp;
        opposite = 1;
    }
    if (first.sign == -1 && second.sign == -1) {
        if (opposite == 1) {
            return i128_opposite(i128_negate(subtraction128(i128_abs(first), i128_abs(second))));
        }
        else {
            return i128_negate(subtraction128(i128_abs(first), i128_abs(second)));
        }
    }
    if (first.sign == 1 && second.sign == -1) {
        if (opposite == 1) {
            return i128_opposite(summation128(first, i128_abs(second)));
        }
        else {
            return summation128(first, i128_abs(second));
        }
    }
    if (first.sign == -1 && second.sign == 1) {
        if (opposite == 1) {
            return i128_opposite(i128_negate(summation128(i128_abs(first), second)));
        }
        else {
            return i128_negate(summation128(i128_abs(first), second));
        }
    }
    if (opposite == 1) {
        return i128_opposite(subtraction128(first, second));
    }
    else {
        return subtraction128(first, second);
    }
}
fn i256_sum(_a: i256, _b: i256) -> i256 {
    var first  = _a;
    var second = _b;
    if (i256_less(i256_abs(first), i256_abs(second))) {
        var temp = first;
        first  = second;
        second = temp;
    }
    if (first.sign == -1 && second.sign == -1) {
        return i256_negate(summation256(i256_abs(first), i256_abs(second)));
    }
    if (first.sign == 1 && second.sign == -1) {
        return subtraction256(first, i256_abs(second));
    }
    if (first.sign == -1 && second.sign == 1) {
        return i256_negate(subtraction256(i256_abs(first), second));
    }
    return summation256(first, second);
}
fn i256_sub(_a: i256, _b: i256) -> i256 {
    var first    = _a;
    var second   = _b;
    var opposite = u32(0);
    if (i256_less(i256_abs(first), i256_abs(second))) {
        var temp = first;
        first    = second;
        second   = temp;
        opposite = 1;
    }
    if (first.sign == -1 && second.sign == -1) {
        if (opposite == 1) {
            return i256_opposite(i256_negate(subtraction256(i256_abs(first), i256_abs(second))));
        }
        else {
            return i256_negate(subtraction256(i256_abs(first), i256_abs(second)));
        }
    }
    if (first.sign == 1 && second.sign == -1) {
        if (opposite == 1) {
            return i256_opposite(summation256(first, i256_abs(second)));
        }
        else {
            return summation256(first, i256_abs(second));
        }
    }
    if (first.sign == -1 && second.sign == 1) {
        if (opposite == 1) {
            return i256_opposite(i256_negate(summation256(i256_abs(first), second)));
        }
        else {
            return i256_negate(summation256(i256_abs(first), second));
        }
    }
    if (opposite == 1) {
        return i256_opposite(subtraction256(first, second));
    }
    else {
        return subtraction256(first, second);
    }
}
fn i512_sum(_a: i512, _b: i512) -> i512 {
    var first  = _a;
    var second = _b;
    if (i512_less(i512_abs(first), i512_abs(second))) {
        var temp = first;
        first  = second;
        second = temp;
    }
    if (first.sign == -1 && second.sign == -1) {
        return i512_negate(summation512(i512_abs(first), i512_abs(second)));
    }
    if (first.sign == 1 && second.sign == -1) {
        return subtraction512(first, i512_abs(second));
    }
    if (first.sign == -1 && second.sign == 1) {
        return i512_negate(subtraction512(i512_abs(first), second));
    }
    return summation512(first, second);
}
fn i512_sub(_a: i512, _b: i512) -> i512 {
    var first    = _a;
    var second   = _b;
    var opposite = u32(0);
    if (i512_less(i512_abs(first), i512_abs(second))) {
        var temp = first;
        first    = second;
        second   = temp;
        opposite = 1;
    }
    if (first.sign == -1 && second.sign == -1) {
        if (opposite == 1) {
            return i512_opposite(i512_negate(subtraction512(i512_abs(first), i512_abs(second))));
        }
        else {
            return i512_negate(subtraction512(i512_abs(first), i512_abs(second)));
        }
    }
    if (first.sign == 1 && second.sign == -1) {
        if (opposite == 1) {
            return i512_opposite(summation512(first, i512_abs(second)));
        }
        else {
            return summation512(first, i512_abs(second));
        }
    }
    if (first.sign == -1 && second.sign == 1) {
        if (opposite == 1) {
            return i512_opposite(i512_negate(summation512(i512_abs(first), second)));
        }
        else {
            return i512_negate(summation512(i512_abs(first), second));
        }
    }
    if (opposite == 1) {
        return i512_opposite(subtraction512(first, second));
    }
    else {
        return subtraction512(first, second);
    }
}
fn i1024_sum(_a: i1024, _b: i1024) -> i1024 {
    var first  = _a;
    var second = _b;
    if (i1024_less(i1024_abs(first), i1024_abs(second))) {
        var temp = first;
        first  = second;
        second = temp;
    }
    if (first.sign == -1 && second.sign == -1) {
        return i1024_negate(summation1024(i1024_abs(first), i1024_abs(second)));
    }
    if (first.sign == 1 && second.sign == -1) {
        return subtraction1024(first, i1024_abs(second));
    }
    if (first.sign == -1 && second.sign == 1) {
        return i1024_negate(subtraction1024(i1024_abs(first), second));
    }
    return summation1024(first, second);
}
fn i1024_sub(_a: i1024, _b: i1024) -> i1024 {
    var first    = _a;
    var second   = _b;
    var opposite = u32(0);
    if (i1024_less(i1024_abs(first), i1024_abs(second))) {
        var temp = first;
        first    = second;
        second   = temp;
        opposite = 1;
    }
    if (first.sign == -1 && second.sign == -1) {
        if (opposite == 1) {
            return i1024_opposite(i1024_negate(subtraction1024(i1024_abs(first), i1024_abs(second))));
        }
        else {
            return i1024_negate(subtraction1024(i1024_abs(first), i1024_abs(second)));
        }
    }
    if (first.sign == 1 && second.sign == -1) {
        if (opposite == 1) {
            return i1024_opposite(summation1024(first, i1024_abs(second)));
        }
        else {
            return summation1024(first, i1024_abs(second));
        }
    }
    if (first.sign == -1 && second.sign == 1) {
        if (opposite == 1) {
            return i1024_opposite(i1024_negate(summation1024(i1024_abs(first), second)));
        }
        else {
            return i1024_negate(summation1024(i1024_abs(first), second));
        }
    }
    if (opposite == 1) {
        return i1024_opposite(subtraction1024(first, second));
    }
    else {
        return subtraction1024(first, second);
    }
}
fn i2048_sum(_a: i2048, _b: i2048) -> i2048 {
    var first  = _a;
    var second = _b;
    if (i2048_less(i2048_abs(first), i2048_abs(second))) {
        var temp = first;
        first  = second;
        second = temp;
    }
    if (first.sign == -1 && second.sign == -1) {
        return i2048_negate(summation2048(i2048_abs(first), i2048_abs(second)));
    }
    if (first.sign == 1 && second.sign == -1) {
        return subtraction2048(first, i2048_abs(second));
    }
    if (first.sign == -1 && second.sign == 1) {
        return i2048_negate(subtraction2048(i2048_abs(first), second));
    }
    return summation2048(first, second);
}
fn i2048_sub(_a: i2048, _b: i2048) -> i2048 {
    var first    = _a;
    var second   = _b;
    var opposite = u32(0);
    if (i2048_less(i2048_abs(first), i2048_abs(second))) {
        var temp = first;
        first    = second;
        second   = temp;
        opposite = 1;
    }
    if (first.sign == -1 && second.sign == -1) {
        if (opposite == 1) {
            return i2048_opposite(i2048_negate(subtraction2048(i2048_abs(first), i2048_abs(second))));
        }
        else {
            return i2048_negate(subtraction2048(i2048_abs(first), i2048_abs(second)));
        }
    }
    if (first.sign == 1 && second.sign == -1) {
        if (opposite == 1) {
            return i2048_opposite(summation2048(first, i2048_abs(second)));
        }
        else {
            return summation2048(first, i2048_abs(second));
        }
    }
    if (first.sign == -1 && second.sign == 1) {
        if (opposite == 1) {
            return i2048_opposite(i2048_negate(summation2048(i2048_abs(first), second)));
        }
        else {
            return i2048_negate(summation2048(i2048_abs(first), second));
        }
    }
    if (opposite == 1) {
        return i2048_opposite(subtraction2048(first, second));
    }
    else {
        return subtraction2048(first, second);
    }
}
fn i4096_sum(_a: i4096, _b: i4096) -> i4096 {
    var first  = _a;
    var second = _b;
    if (i4096_less(i4096_abs(first), i4096_abs(second))) {
        var temp = first;
        first  = second;
        second = temp;
    }
    if (first.sign == -1 && second.sign == -1) {
        return i4096_negate(summation4096(i4096_abs(first), i4096_abs(second)));
    }
    if (first.sign == 1 && second.sign == -1) {
        return subtraction4096(first, i4096_abs(second));
    }
    if (first.sign == -1 && second.sign == 1) {
        return i4096_negate(subtraction4096(i4096_abs(first), second));
    }
    return summation4096(first, second);
}
fn i4096_sub(_a: i4096, _b: i4096) -> i4096 {
    var first    = _a;
    var second   = _b;
    var opposite = u32(0);
    if (i4096_less(i4096_abs(first), i4096_abs(second))) {
        var temp = first;
        first    = second;
        second   = temp;
        opposite = 1;
    }
    if (first.sign == -1 && second.sign == -1) {
        if (opposite == 1) {
            return i4096_opposite(i4096_negate(subtraction4096(i4096_abs(first), i4096_abs(second))));
        }
        else {
            return i4096_negate(subtraction4096(i4096_abs(first), i4096_abs(second)));
        }
    }
    if (first.sign == 1 && second.sign == -1) {
        if (opposite == 1) {
            return i4096_opposite(summation4096(first, i4096_abs(second)));
        }
        else {
            return summation4096(first, i4096_abs(second));
        }
    }
    if (first.sign == -1 && second.sign == 1) {
        if (opposite == 1) {
            return i4096_opposite(i4096_negate(summation4096(i4096_abs(first), second)));
        }
        else {
            return i4096_negate(summation4096(i4096_abs(first), second));
        }
    }
    if (opposite == 1) {
        return i4096_opposite(subtraction4096(first, second));
    }
    else {
        return subtraction4096(first, second);
    }
}
fn i8192_sum(_a: i8192, _b: i8192) -> i8192 {
    var first  = _a;
    var second = _b;
    if (i8192_less(i8192_abs(first), i8192_abs(second))) {
        var temp = first;
        first  = second;
        second = temp;
    }
    if (first.sign == -1 && second.sign == -1) {
        return i8192_negate(summation8192(i8192_abs(first), i8192_abs(second)));
    }
    if (first.sign == 1 && second.sign == -1) {
        return subtraction8192(first, i8192_abs(second));
    }
    if (first.sign == -1 && second.sign == 1) {
        return i8192_negate(subtraction8192(i8192_abs(first), second));
    }
    return summation8192(first, second);
}
fn i8192_sub(_a: i8192, _b: i8192) -> i8192 {
    var first    = _a;
    var second   = _b;
    var opposite = u32(0);
    if (i8192_less(i8192_abs(first), i8192_abs(second))) {
        var temp = first;
        first    = second;
        second   = temp;
        opposite = 1;
    }
    if (first.sign == -1 && second.sign == -1) {
        if (opposite == 1) {
            return i8192_opposite(i8192_negate(subtraction8192(i8192_abs(first), i8192_abs(second))));
        }
        else {
            return i8192_negate(subtraction8192(i8192_abs(first), i8192_abs(second)));
        }
    }
    if (first.sign == 1 && second.sign == -1) {
        if (opposite == 1) {
            return i8192_opposite(summation8192(first, i8192_abs(second)));
        }
        else {
            return summation8192(first, i8192_abs(second));
        }
    }
    if (first.sign == -1 && second.sign == 1) {
        if (opposite == 1) {
            return i8192_opposite(i8192_negate(summation8192(i8192_abs(first), second)));
        }
        else {
            return i8192_negate(summation8192(i8192_abs(first), second));
        }
    }
    if (opposite == 1) {
        return i8192_opposite(subtraction8192(first, second));
    }
    else {
        return subtraction8192(first, second);
    }
}
fn i16384_sum(_a: i16384, _b: i16384) -> i16384 {
    var first  = _a;
    var second = _b;
    if (i16384_less(i16384_abs(first), i16384_abs(second))) {
        var temp = first;
        first  = second;
        second = temp;
    }
    if (first.sign == -1 && second.sign == -1) {
        return i16384_negate(summation16384(i16384_abs(first), i16384_abs(second)));
    }
    if (first.sign == 1 && second.sign == -1) {
        return subtraction16384(first, i16384_abs(second));
    }
    if (first.sign == -1 && second.sign == 1) {
        return i16384_negate(subtraction16384(i16384_abs(first), second));
    }
    return summation16384(first, second);
}
fn i16384_sub(_a: i16384, _b: i16384) -> i16384 {
    var first    = _a;
    var second   = _b;
    var opposite = u32(0);
    if (i16384_less(i16384_abs(first), i16384_abs(second))) {
        var temp = first;
        first    = second;
        second   = temp;
        opposite = 1;
    }
    if (first.sign == -1 && second.sign == -1) {
        if (opposite == 1) {
            return i16384_opposite(i16384_negate(subtraction16384(i16384_abs(first), i16384_abs(second))));
        }
        else {
            return i16384_negate(subtraction16384(i16384_abs(first), i16384_abs(second)));
        }
    }
    if (first.sign == 1 && second.sign == -1) {
        if (opposite == 1) {
            return i16384_opposite(summation16384(first, i16384_abs(second)));
        }
        else {
            return summation16384(first, i16384_abs(second));
        }
    }
    if (first.sign == -1 && second.sign == 1) {
        if (opposite == 1) {
            return i16384_opposite(i16384_negate(summation16384(i16384_abs(first), second)));
        }
        else {
            return i16384_negate(summation16384(i16384_abs(first), second));
        }
    }
    if (opposite == 1) {
        return i16384_opposite(subtraction16384(first, second));
    }
    else {
        return subtraction16384(first, second);
    }
}

// Mul and Div operators
fn i64_mul_to_i64(_a: i64, _b: i64) -> i64 {
    var r_temp = karatsuba64(_a, _b);
    var arr = array<u32, 2>();
    for (var i = u32(0); i != 2; i++) {
        arr[1 - i] = r_temp.number[3 - i];
    }
    return i64_from_u32_array(arr, _a.sign * _b.sign);
}
fn i64_mul_to_i128(_a: i64, _b: i64) -> i128 {
    var r = karatsuba64(_a, _b);
    r.sign = _a.sign * _b.sign;
    return r;
}
fn i64_div(_a: i64, _b: i64) -> array<i64, 2> {
    let a    = i64_abs(_a);
    let b    = i64_abs(_b);
    let zero = i64_from_u32(0);
    let one  = i64_from_u32(1);
    if (i64_eq(b, zero)) {
        return array<i64, 2>(i64_from_u32_array(array<u32, 2>(), 1), i64_from_u32_array(array<u32, 2>(), 1));
    }
    else if (i64_eq(b, one)) {
        return array<i64, 2>(a, zero);
    }
    else if (i64_eq(a, b)) {
        return array<i64, 2>(one, zero);
    }
    else if ((i64_eq(a, zero)) || (i64_less(a, b))) {
        return array<i64, 2>(zero, a);
    }
    var qr = array<i64, 2>(zero, zero);
    for (var x = u32(64); x > 0; x--) {
        qr[0] = i64_left_shift(qr[0], 1);
        qr[1] = i64_left_shift(qr[1], 1);
        if ((i64_right_shift(a, x - 1).number[1] & 1) == 1) {
            qr[1] = i64_sum(qr[1], one);
        }
        if (i64_greater_eq(qr[1], b)) {
            qr[1] = i64_sub(qr[1], b);
            qr[0] = i64_sum(qr[0], one);
        }
    }
    qr[0].sign = _a.sign * _b.sign;
    return qr;
}
fn i128_mul_to_i128(_a: i128, _b: i128) -> i128 {
    var r_temp = karatsuba128(_a, _b);
    var arr = array<u32, 4>();
    for (var i = u32(0); i != 4; i++) {
        arr[3 - i] = r_temp.number[7 - i];
    }
    return i128_from_u32_array(arr, _a.sign * _b.sign);
}
fn i128_mul_to_i256(_a: i128, _b: i128) -> i256 {
    var r = karatsuba128(_a, _b);
    r.sign = _a.sign * _b.sign;
    return r;
}
fn i128_div(_a: i128, _b: i128) -> array<i128, 2> {
    let a    = i128_abs(_a);
    let b    = i128_abs(_b);
    let zero = i128_from_u32(0);
    let one  = i128_from_u32(1);
    if (i128_eq(b, zero)) {
        return array<i128, 2>(i128_from_u32_array(array<u32, 4>(), 1), i128_from_u32_array(array<u32, 4>(), 1));
    }
    else if (i128_eq(b, one)) {
        return array<i128, 2>(a, zero);
    }
    else if (i128_eq(a, b)) {
        return array<i128, 2>(one, zero);
    }
    else if ((i128_eq(a, zero)) || (i128_less(a, b))) {
        return array<i128, 2>(zero, a);
    }
    var qr = array<i128, 2>(zero, zero);
    for (var x = u32(128); x > 0; x--) {
        qr[0] = i128_left_shift(qr[0], 1);
        qr[1] = i128_left_shift(qr[1], 1);
        if ((i128_right_shift(a, x - 1).number[3] & 1) == 1) {
            qr[1] = i128_sum(qr[1], one);
        }
        if (i128_greater_eq(qr[1], b)) {
            qr[1] = i128_sub(qr[1], b);
            qr[0] = i128_sum(qr[0], one);
        }
    }
    qr[0].sign = _a.sign * _b.sign;
    return qr;
}
fn i256_mul_to_i256(_a: i256, _b: i256) -> i256 {
    var r_temp = karatsuba256(_a, _b);
    var arr = array<u32, 8>();
    for (var i = u32(0); i != 8; i++) {
        arr[7 - i] = r_temp.number[15 - i];
    }
    return i256_from_u32_array(arr, _a.sign * _b.sign);
}
fn i256_mul_to_i512(_a: i256, _b: i256) -> i512 {
    var r = karatsuba256(_a, _b);
    r.sign = _a.sign * _b.sign;
    return r;
}
fn i256_div(_a: i256, _b: i256) -> array<i256, 2> {
    let a    = i256_abs(_a);
    let b    = i256_abs(_b);
    let zero = i256_from_u32(0);
    let one  = i256_from_u32(1);
    if (i256_eq(b, zero)) {
        return array<i256, 2>(i256_from_u32_array(array<u32, 8>(), 1), i256_from_u32_array(array<u32, 8>(), 1));
    }
    else if (i256_eq(b, one)) {
        return array<i256, 2>(a, zero);
    }
    else if (i256_eq(a, b)) {
        return array<i256, 2>(one, zero);
    }
    else if ((i256_eq(a, zero)) || (i256_less(a, b))) {
        return array<i256, 2>(zero, a);
    }
    var qr = array<i256, 2>(zero, zero);
    for (var x = u32(256); x > 0; x--) {
        qr[0] = i256_left_shift(qr[0], 1);
        qr[1] = i256_left_shift(qr[1], 1);
        if ((i256_right_shift(a, x - 1).number[7] & 1) == 1) {
            qr[1] = i256_sum(qr[1], one);
        }
        if (i256_greater_eq(qr[1], b)) {
            qr[1] = i256_sub(qr[1], b);
            qr[0] = i256_sum(qr[0], one);
        }
    }
    qr[0].sign = _a.sign * _b.sign;
    return qr;
}
fn i512_mul_to_i512(_a: i512, _b: i512) -> i512 {
    var r_temp = karatsuba512(_a, _b);
    var arr = array<u32, 16>();
    for (var i = u32(0); i != 16; i++) {
        arr[15 - i] = r_temp.number[31 - i];
    }
    return i512_from_u32_array(arr, _a.sign * _b.sign);
}
fn i512_mul_to_i1024(_a: i512, _b: i512) -> i1024 {
    var r = karatsuba512(_a, _b);
    r.sign = _a.sign * _b.sign;
    return r;
}
fn i512_div(_a: i512, _b: i512) -> array<i512, 2> {
    let a    = i512_abs(_a);
    let b    = i512_abs(_b);
    let zero = i512_from_u32(0);
    let one  = i512_from_u32(1);
    if (i512_eq(b, zero)) {
        return array<i512, 2>(i512_from_u32_array(array<u32, 16>(), 1), i512_from_u32_array(array<u32, 16>(), 1));
    }
    else if (i512_eq(b, one)) {
        return array<i512, 2>(a, zero);
    }
    else if (i512_eq(a, b)) {
        return array<i512, 2>(one, zero);
    }
    else if ((i512_eq(a, zero)) || (i512_less(a, b))) {
        return array<i512, 2>(zero, a);
    }
    var qr = array<i512, 2>(zero, zero);
    for (var x = u32(512); x > 0; x--) {
        qr[0] = i512_left_shift(qr[0], 1);
        qr[1] = i512_left_shift(qr[1], 1);
        if ((i512_right_shift(a, x - 1).number[15] & 1) == 1) {
            qr[1] = i512_sum(qr[1], one);
        }
        if (i512_greater_eq(qr[1], b)) {
            qr[1] = i512_sub(qr[1], b);
            qr[0] = i512_sum(qr[0], one);
        }
    }
    qr[0].sign = _a.sign * _b.sign;
    return qr;
}
fn i1024_mul_to_i1024(_a: i1024, _b: i1024) -> i1024 {
    var r_temp = karatsuba1024(_a, _b);
    var arr = array<u32, 32>();
    for (var i = u32(0); i != 32; i++) {
        arr[31 - i] = r_temp.number[63 - i];
    }
    return i1024_from_u32_array(arr, _a.sign * _b.sign);
}
fn i1024_mul_to_i2048(_a: i1024, _b: i1024) -> i2048 {
    var r = karatsuba1024(_a, _b);
    r.sign = _a.sign * _b.sign;
    return r;
}
fn i1024_div(_a: i1024, _b: i1024) -> array<i1024, 2> {
    let a    = i1024_abs(_a);
    let b    = i1024_abs(_b);
    let zero = i1024_from_u32(0);
    let one  = i1024_from_u32(1);
    if (i1024_eq(b, zero)) {
        return array<i1024, 2>(i1024_from_u32_array(array<u32, 32>(), 1), i1024_from_u32_array(array<u32, 32>(), 1));
    }
    else if (i1024_eq(b, one)) {
        return array<i1024, 2>(a, zero);
    }
    else if (i1024_eq(a, b)) {
        return array<i1024, 2>(one, zero);
    }
    else if ((i1024_eq(a, zero)) || (i1024_less(a, b))) {
        return array<i1024, 2>(zero, a);
    }
    var qr = array<i1024, 2>(zero, zero);
    for (var x = u32(1024); x > 0; x--) {
        qr[0] = i1024_left_shift(qr[0], 1);
        qr[1] = i1024_left_shift(qr[1], 1);
        if ((i1024_right_shift(a, x - 1).number[31] & 1) == 1) {
            qr[1] = i1024_sum(qr[1], one);
        }
        if (i1024_greater_eq(qr[1], b)) {
            qr[1] = i1024_sub(qr[1], b);
            qr[0] = i1024_sum(qr[0], one);
        }
    }
    qr[0].sign = _a.sign * _b.sign;
    return qr;
}
fn i2048_mul_to_i2048(_a: i2048, _b: i2048) -> i2048 {
    var r_temp = karatsuba2048(_a, _b);
    var arr = array<u32, 64>();
    for (var i = u32(0); i != 64; i++) {
        arr[63 - i] = r_temp.number[127 - i];
    }
    return i2048_from_u32_array(arr, _a.sign * _b.sign);
}
fn i2048_mul_to_i4096(_a: i2048, _b: i2048) -> i4096 {
    var r = karatsuba2048(_a, _b);
    r.sign = _a.sign * _b.sign;
    return r;
}
fn i2048_div(_a: i2048, _b: i2048) -> array<i2048, 2> {
    let a    = i2048_abs(_a);
    let b    = i2048_abs(_b);
    let zero = i2048_from_u32(0);
    let one  = i2048_from_u32(1);
    if (i2048_eq(b, zero)) {
        return array<i2048, 2>(i2048_from_u32_array(array<u32, 64>(), 1), i2048_from_u32_array(array<u32, 64>(), 1));
    }
    else if (i2048_eq(b, one)) {
        return array<i2048, 2>(a, zero);
    }
    else if (i2048_eq(a, b)) {
        return array<i2048, 2>(one, zero);
    }
    else if ((i2048_eq(a, zero)) || (i2048_less(a, b))) {
        return array<i2048, 2>(zero, a);
    }
    var qr = array<i2048, 2>(zero, zero);
    for (var x = u32(2048); x > 0; x--) {
        qr[0] = i2048_left_shift(qr[0], 1);
        qr[1] = i2048_left_shift(qr[1], 1);
        if ((i2048_right_shift(a, x - 1).number[63] & 1) == 1) {
            qr[1] = i2048_sum(qr[1], one);
        }
        if (i2048_greater_eq(qr[1], b)) {
            qr[1] = i2048_sub(qr[1], b);
            qr[0] = i2048_sum(qr[0], one);
        }
    }
    qr[0].sign = _a.sign * _b.sign;
    return qr;
}
fn i4096_mul_to_i4096(_a: i4096, _b: i4096) -> i4096 {
    var r_temp = karatsuba4096(_a, _b);
    var arr = array<u32, 128>();
    for (var i = u32(0); i != 128; i++) {
        arr[127 - i] = r_temp.number[255 - i];
    }
    return i4096_from_u32_array(arr, _a.sign * _b.sign);
}
fn i4096_mul_to_i8192(_a: i4096, _b: i4096) -> i8192 {
    var r = karatsuba4096(_a, _b);
    r.sign = _a.sign * _b.sign;
    return r;
}
fn i4096_div(_a: i4096, _b: i4096) -> array<i4096, 2> {
    let a    = i4096_abs(_a);
    let b    = i4096_abs(_b);
    let zero = i4096_from_u32(0);
    let one  = i4096_from_u32(1);
    if (i4096_eq(b, zero)) {
        return array<i4096, 2>(i4096_from_u32_array(array<u32, 128>(), 1), i4096_from_u32_array(array<u32, 128>(), 1));
    }
    else if (i4096_eq(b, one)) {
        return array<i4096, 2>(a, zero);
    }
    else if (i4096_eq(a, b)) {
        return array<i4096, 2>(one, zero);
    }
    else if ((i4096_eq(a, zero)) || (i4096_less(a, b))) {
        return array<i4096, 2>(zero, a);
    }
    var qr = array<i4096, 2>(zero, zero);
    for (var x = u32(4096); x > 0; x--) {
        qr[0] = i4096_left_shift(qr[0], 1);
        qr[1] = i4096_left_shift(qr[1], 1);
        if ((i4096_right_shift(a, x - 1).number[127] & 1) == 1) {
            qr[1] = i4096_sum(qr[1], one);
        }
        if (i4096_greater_eq(qr[1], b)) {
            qr[1] = i4096_sub(qr[1], b);
            qr[0] = i4096_sum(qr[0], one);
        }
    }
    qr[0].sign = _a.sign * _b.sign;
    return qr;
}
fn i8192_mul_to_i8192(_a: i8192, _b: i8192) -> i8192 {
    var r_temp = karatsuba8192(_a, _b);
    var arr = array<u32, 256>();
    for (var i = u32(0); i != 256; i++) {
        arr[255 - i] = r_temp.number[511 - i];
    }
    return i8192_from_u32_array(arr, _a.sign * _b.sign);
}
fn i8192_mul_to_i16384(_a: i8192, _b: i8192) -> i16384 {
    var r = karatsuba8192(_a, _b);
    r.sign = _a.sign * _b.sign;
    return r;
}
fn i8192_div(_a: i8192, _b: i8192) -> array<i8192, 2> {
    let a    = i8192_abs(_a);
    let b    = i8192_abs(_b);
    let zero = i8192_from_u32(0);
    let one  = i8192_from_u32(1);
    if (i8192_eq(b, zero)) {
        return array<i8192, 2>(i8192_from_u32_array(array<u32, 256>(), 1), i8192_from_u32_array(array<u32, 256>(), 1));
    }
    else if (i8192_eq(b, one)) {
        return array<i8192, 2>(a, zero);
    }
    else if (i8192_eq(a, b)) {
        return array<i8192, 2>(one, zero);
    }
    else if ((i8192_eq(a, zero)) || (i8192_less(a, b))) {
        return array<i8192, 2>(zero, a);
    }
    var qr = array<i8192, 2>(zero, zero);
    for (var x = u32(8192); x > 0; x--) {
        qr[0] = i8192_left_shift(qr[0], 1);
        qr[1] = i8192_left_shift(qr[1], 1);
        if ((i8192_right_shift(a, x - 1).number[255] & 1) == 1) {
            qr[1] = i8192_sum(qr[1], one);
        }
        if (i8192_greater_eq(qr[1], b)) {
            qr[1] = i8192_sub(qr[1], b);
            qr[0] = i8192_sum(qr[0], one);
        }
    }
    qr[0].sign = _a.sign * _b.sign;
    return qr;
}

// PowerMod operators
fn i64_powermod(_b: i64, _e: i64, _m: i64) -> i64 {
    if (i64_eq(_m, i64_from_u32(0))) {
        return i64_from_i32(-1);
    }
    if (i64_eq(_m, i64_from_u32(1))) {
        return i64_from_u32(0);
    }
    var base     = _b;
    var exponent = _e;
    var result   = i64_from_i32(1);
    base = i64_div(base, _m)[1];
    while (i64_greater(exponent, i64_from_u32(0))) {
        if (exponent.number[1] % 2 == 1) {
            result = i64_div(i64_mul_to_i64(result, base), _m)[1];
        }
        exponent = i64_right_shift(exponent, 1);
        base     = i64_div(i64_mul_to_i64(base, base), _m)[1];
    }
    return result;
}
fn i128_powermod(_b: i128, _e: i128, _m: i128) -> i128 {
    if (i128_eq(_m, i128_from_u32(0))) {
        return i128_from_i32(-1);
    }
    if (i128_eq(_m, i128_from_u32(1))) {
        return i128_from_u32(0);
    }
    var base     = _b;
    var exponent = _e;
    var result   = i128_from_i32(1);
    base = i128_div(base, _m)[1];
    while (i128_greater(exponent, i128_from_u32(0))) {
        if (exponent.number[3] % 2 == 1) {
            result = i128_div(i128_mul_to_i128(result, base), _m)[1];
        }
        exponent = i128_right_shift(exponent, 1);
        base     = i128_div(i128_mul_to_i128(base, base), _m)[1];
    }
    return result;
}
fn i256_powermod(_b: i256, _e: i256, _m: i256) -> i256 {
    if (i256_eq(_m, i256_from_u32(0))) {
        return i256_from_i32(-1);
    }
    if (i256_eq(_m, i256_from_u32(1))) {
        return i256_from_u32(0);
    }
    var base     = _b;
    var exponent = _e;
    var result   = i256_from_i32(1);
    base = i256_div(base, _m)[1];
    while (i256_greater(exponent, i256_from_u32(0))) {
        if (exponent.number[7] % 2 == 1) {
            result = i256_div(i256_mul_to_i256(result, base), _m)[1];
        }
        exponent = i256_right_shift(exponent, 1);
        base     = i256_div(i256_mul_to_i256(base, base), _m)[1];
    }
    return result;
}
fn i512_powermod(_b: i512, _e: i512, _m: i512) -> i512 {
    if (i512_eq(_m, i512_from_u32(0))) {
        return i512_from_i32(-1);
    }
    if (i512_eq(_m, i512_from_u32(1))) {
        return i512_from_u32(0);
    }
    var base     = _b;
    var exponent = _e;
    var result   = i512_from_i32(1);
    base = i512_div(base, _m)[1];
    while (i512_greater(exponent, i512_from_u32(0))) {
        if (exponent.number[15] % 2 == 1) {
            result = i512_div(i512_mul_to_i512(result, base), _m)[1];
        }
        exponent = i512_right_shift(exponent, 1);
        base     = i512_div(i512_mul_to_i512(base, base), _m)[1];
    }
    return result;
}
fn i1024_powermod(_b: i1024, _e: i1024, _m: i1024) -> i1024 {
    if (i1024_eq(_m, i1024_from_u32(0))) {
        return i1024_from_i32(-1);
    }
    if (i1024_eq(_m, i1024_from_u32(1))) {
        return i1024_from_u32(0);
    }
    var base     = _b;
    var exponent = _e;
    var result   = i1024_from_i32(1);
    base = i1024_div(base, _m)[1];
    while (i1024_greater(exponent, i1024_from_u32(0))) {
        if (exponent.number[31] % 2 == 1) {
            result = i1024_div(i1024_mul_to_i1024(result, base), _m)[1];
        }
        exponent = i1024_right_shift(exponent, 1);
        base     = i1024_div(i1024_mul_to_i1024(base, base), _m)[1];
    }
    return result;
}
fn i2048_powermod(_b: i2048, _e: i2048, _m: i2048) -> i2048 {
    if (i2048_eq(_m, i2048_from_u32(0))) {
        return i2048_from_i32(-1);
    }
    if (i2048_eq(_m, i2048_from_u32(1))) {
        return i2048_from_u32(0);
    }
    var base     = _b;
    var exponent = _e;
    var result   = i2048_from_i32(1);
    base = i2048_div(base, _m)[1];
    while (i2048_greater(exponent, i2048_from_u32(0))) {
        if (exponent.number[63] % 2 == 1) {
            result = i2048_div(i2048_mul_to_i2048(result, base), _m)[1];
        }
        exponent = i2048_right_shift(exponent, 1);
        base     = i2048_div(i2048_mul_to_i2048(base, base), _m)[1];
    }
    return result;
}
fn i4096_powermod(_b: i4096, _e: i4096, _m: i4096) -> i4096 {
    if (i4096_eq(_m, i4096_from_u32(0))) {
        return i4096_from_i32(-1);
    }
    if (i4096_eq(_m, i4096_from_u32(1))) {
        return i4096_from_u32(0);
    }
    var base     = _b;
    var exponent = _e;
    var result   = i4096_from_i32(1);
    base = i4096_div(base, _m)[1];
    while (i4096_greater(exponent, i4096_from_u32(0))) {
        if (exponent.number[127] % 2 == 1) {
            result = i4096_div(i4096_mul_to_i4096(result, base), _m)[1];
        }
        exponent = i4096_right_shift(exponent, 1);
        base     = i4096_div(i4096_mul_to_i4096(base, base), _m)[1];
    }
    return result;
}
fn i8192_powermod(_b: i8192, _e: i8192, _m: i8192) -> i8192 {
    if (i8192_eq(_m, i8192_from_u32(0))) {
        return i8192_from_i32(-1);
    }
    if (i8192_eq(_m, i8192_from_u32(1))) {
        return i8192_from_u32(0);
    }
    var base     = _b;
    var exponent = _e;
    var result   = i8192_from_i32(1);
    base = i8192_div(base, _m)[1];
    while (i8192_greater(exponent, i8192_from_u32(0))) {
        if (exponent.number[255] % 2 == 1) {
            result = i8192_div(i8192_mul_to_i8192(result, base), _m)[1];
        }
        exponent = i8192_right_shift(exponent, 1);
        base     = i8192_div(i8192_mul_to_i8192(base, base), _m)[1];
    }
    return result;
}

// Auxiliary functions
fn summation64(_a: i64, _b: i64) -> i64 {
    var r = i64_from_u32(0);
    r.sign = _a.sign;
    var overflow = u32(0);
    for (var i = u32(0); i != 2; i++) {
        let a_low = _a.number[1 - i] & 0xFFFF;
        let b_low = _b.number[1 - i] & 0xFFFF;
        let sum_low = a_low + b_low + overflow;
        overflow = sum_low >> 16;
        r.number[1 - i] |= sum_low & 0xFFFF;
        let a_high = _a.number[1 - i] >> 16;
        let b_high = _b.number[1 - i] >> 16;
        let sum_high = a_high + b_high + overflow;
        overflow = sum_high >> 16;
        r.number[1 - i] |= sum_high << 16;
    }
    return r;
}
fn subtraction64(_a: i64, _b: i64) -> i64 {
    var r = i64_from_u32(0);
    r.sign = _a.sign;
    var underflow = u32(0);
    for (var i = u32(0); i != 2; i++) {
        let a_low = _a.number[1 - i] & 0xFFFF;
        let b_low = _b.number[1 - i] & 0xFFFF;
        var sub_low = u32(0);
        if (a_low == 0 && underflow == 1) {
            sub_low = 65535 - b_low;
            underflow = 1;
        }
        else if (a_low - underflow >= b_low) {
            sub_low = a_low - underflow - b_low;
            underflow = 0;
        }
        else {
            sub_low = (65536 + (a_low - underflow)) - b_low;
            underflow = 1;
        }
        r.number[1 - i] |= sub_low;
        let a_high = _a.number[1 - i] >> 16;
        let b_high = _b.number[1 - i] >> 16;
        var sub_high = u32(0);
        if (a_high == 0 && underflow == 1) {
            sub_high = 65535 - b_high;
            underflow = 1;
        }
        else if (a_high - underflow >= b_high) {
            sub_high = a_high - underflow - b_high;
            underflow = 0;
        }
        else {
            sub_high = (65536 + (a_high - underflow)) - b_high;
            underflow = 1;
        }
        r.number[1 - i] |= sub_high << 16;
    }
    return r;
}
fn summation128(_a: i128, _b: i128) -> i128 {
    var r = i128_from_u32(0);
    r.sign = _a.sign;
    var overflow = u32(0);
    for (var i = u32(0); i != 4; i++) {
        let a_low = _a.number[3 - i] & 0xFFFF;
        let b_low = _b.number[3 - i] & 0xFFFF;
        let sum_low = a_low + b_low + overflow;
        overflow = sum_low >> 16;
        r.number[3 - i] |= sum_low & 0xFFFF;
        let a_high = _a.number[3 - i] >> 16;
        let b_high = _b.number[3 - i] >> 16;
        let sum_high = a_high + b_high + overflow;
        overflow = sum_high >> 16;
        r.number[3 - i] |= sum_high << 16;
    }
    return r;
}
fn subtraction128(_a: i128, _b: i128) -> i128 {
    var r = i128_from_u32(0);
    r.sign = _a.sign;
    var underflow = u32(0);
    for (var i = u32(0); i != 4; i++) {
        let a_low = _a.number[3 - i] & 0xFFFF;
        let b_low = _b.number[3 - i] & 0xFFFF;
        var sub_low = u32(0);
        if (a_low == 0 && underflow == 1) {
            sub_low = 65535 - b_low;
            underflow = 1;
        }
        else if (a_low - underflow >= b_low) {
            sub_low = a_low - underflow - b_low;
            underflow = 0;
        }
        else {
            sub_low = (65536 + (a_low - underflow)) - b_low;
            underflow = 1;
        }
        r.number[3 - i] |= sub_low;
        let a_high = _a.number[3 - i] >> 16;
        let b_high = _b.number[3 - i] >> 16;
        var sub_high = u32(0);
        if (a_high == 0 && underflow == 1) {
            sub_high = 65535 - b_high;
            underflow = 1;
        }
        else if (a_high - underflow >= b_high) {
            sub_high = a_high - underflow - b_high;
            underflow = 0;
        }
        else {
            sub_high = (65536 + (a_high - underflow)) - b_high;
            underflow = 1;
        }
        r.number[3 - i] |= sub_high << 16;
    }
    return r;
}
fn summation256(_a: i256, _b: i256) -> i256 {
    var r = i256_from_u32(0);
    r.sign = _a.sign;
    var overflow = u32(0);
    for (var i = u32(0); i != 8; i++) {
        let a_low = _a.number[7 - i] & 0xFFFF;
        let b_low = _b.number[7 - i] & 0xFFFF;
        let sum_low = a_low + b_low + overflow;
        overflow = sum_low >> 16;
        r.number[7 - i] |= sum_low & 0xFFFF;
        let a_high = _a.number[7 - i] >> 16;
        let b_high = _b.number[7 - i] >> 16;
        let sum_high = a_high + b_high + overflow;
        overflow = sum_high >> 16;
        r.number[7 - i] |= sum_high << 16;
    }
    return r;
}
fn subtraction256(_a: i256, _b: i256) -> i256 {
    var r = i256_from_u32(0);
    r.sign = _a.sign;
    var underflow = u32(0);
    for (var i = u32(0); i != 8; i++) {
        let a_low = _a.number[7 - i] & 0xFFFF;
        let b_low = _b.number[7 - i] & 0xFFFF;
        var sub_low = u32(0);
        if (a_low == 0 && underflow == 1) {
            sub_low = 65535 - b_low;
            underflow = 1;
        }
        else if (a_low - underflow >= b_low) {
            sub_low = a_low - underflow - b_low;
            underflow = 0;
        }
        else {
            sub_low = (65536 + (a_low - underflow)) - b_low;
            underflow = 1;
        }
        r.number[7 - i] |= sub_low;
        let a_high = _a.number[7 - i] >> 16;
        let b_high = _b.number[7 - i] >> 16;
        var sub_high = u32(0);
        if (a_high == 0 && underflow == 1) {
            sub_high = 65535 - b_high;
            underflow = 1;
        }
        else if (a_high - underflow >= b_high) {
            sub_high = a_high - underflow - b_high;
            underflow = 0;
        }
        else {
            sub_high = (65536 + (a_high - underflow)) - b_high;
            underflow = 1;
        }
        r.number[7 - i] |= sub_high << 16;
    }
    return r;
}
fn summation512(_a: i512, _b: i512) -> i512 {
    var r = i512_from_u32(0);
    r.sign = _a.sign;
    var overflow = u32(0);
    for (var i = u32(0); i != 16; i++) {
        let a_low = _a.number[15 - i] & 0xFFFF;
        let b_low = _b.number[15 - i] & 0xFFFF;
        let sum_low = a_low + b_low + overflow;
        overflow = sum_low >> 16;
        r.number[15 - i] |= sum_low & 0xFFFF;
        let a_high = _a.number[15 - i] >> 16;
        let b_high = _b.number[15 - i] >> 16;
        let sum_high = a_high + b_high + overflow;
        overflow = sum_high >> 16;
        r.number[15 - i] |= sum_high << 16;
    }
    return r;
}
fn subtraction512(_a: i512, _b: i512) -> i512 {
    var r = i512_from_u32(0);
    r.sign = _a.sign;
    var underflow = u32(0);
    for (var i = u32(0); i != 16; i++) {
        let a_low = _a.number[15 - i] & 0xFFFF;
        let b_low = _b.number[15 - i] & 0xFFFF;
        var sub_low = u32(0);
        if (a_low == 0 && underflow == 1) {
            sub_low = 65535 - b_low;
            underflow = 1;
        }
        else if (a_low - underflow >= b_low) {
            sub_low = a_low - underflow - b_low;
            underflow = 0;
        }
        else {
            sub_low = (65536 + (a_low - underflow)) - b_low;
            underflow = 1;
        }
        r.number[15 - i] |= sub_low;
        let a_high = _a.number[15 - i] >> 16;
        let b_high = _b.number[15 - i] >> 16;
        var sub_high = u32(0);
        if (a_high == 0 && underflow == 1) {
            sub_high = 65535 - b_high;
            underflow = 1;
        }
        else if (a_high - underflow >= b_high) {
            sub_high = a_high - underflow - b_high;
            underflow = 0;
        }
        else {
            sub_high = (65536 + (a_high - underflow)) - b_high;
            underflow = 1;
        }
        r.number[15 - i] |= sub_high << 16;
    }
    return r;
}
fn summation1024(_a: i1024, _b: i1024) -> i1024 {
    var r = i1024_from_u32(0);
    r.sign = _a.sign;
    var overflow = u32(0);
    for (var i = u32(0); i != 32; i++) {
        let a_low = _a.number[31 - i] & 0xFFFF;
        let b_low = _b.number[31 - i] & 0xFFFF;
        let sum_low = a_low + b_low + overflow;
        overflow = sum_low >> 16;
        r.number[31 - i] |= sum_low & 0xFFFF;
        let a_high = _a.number[31 - i] >> 16;
        let b_high = _b.number[31 - i] >> 16;
        let sum_high = a_high + b_high + overflow;
        overflow = sum_high >> 16;
        r.number[31 - i] |= sum_high << 16;
    }
    return r;
}
fn subtraction1024(_a: i1024, _b: i1024) -> i1024 {
    var r = i1024_from_u32(0);
    r.sign = _a.sign;
    var underflow = u32(0);
    for (var i = u32(0); i != 32; i++) {
        let a_low = _a.number[31 - i] & 0xFFFF;
        let b_low = _b.number[31 - i] & 0xFFFF;
        var sub_low = u32(0);
        if (a_low == 0 && underflow == 1) {
            sub_low = 65535 - b_low;
            underflow = 1;
        }
        else if (a_low - underflow >= b_low) {
            sub_low = a_low - underflow - b_low;
            underflow = 0;
        }
        else {
            sub_low = (65536 + (a_low - underflow)) - b_low;
            underflow = 1;
        }
        r.number[31 - i] |= sub_low;
        let a_high = _a.number[31 - i] >> 16;
        let b_high = _b.number[31 - i] >> 16;
        var sub_high = u32(0);
        if (a_high == 0 && underflow == 1) {
            sub_high = 65535 - b_high;
            underflow = 1;
        }
        else if (a_high - underflow >= b_high) {
            sub_high = a_high - underflow - b_high;
            underflow = 0;
        }
        else {
            sub_high = (65536 + (a_high - underflow)) - b_high;
            underflow = 1;
        }
        r.number[31 - i] |= sub_high << 16;
    }
    return r;
}
fn summation2048(_a: i2048, _b: i2048) -> i2048 {
    var r = i2048_from_u32(0);
    r.sign = _a.sign;
    var overflow = u32(0);
    for (var i = u32(0); i != 64; i++) {
        let a_low = _a.number[63 - i] & 0xFFFF;
        let b_low = _b.number[63 - i] & 0xFFFF;
        let sum_low = a_low + b_low + overflow;
        overflow = sum_low >> 16;
        r.number[63 - i] |= sum_low & 0xFFFF;
        let a_high = _a.number[63 - i] >> 16;
        let b_high = _b.number[63 - i] >> 16;
        let sum_high = a_high + b_high + overflow;
        overflow = sum_high >> 16;
        r.number[63 - i] |= sum_high << 16;
    }
    return r;
}
fn subtraction2048(_a: i2048, _b: i2048) -> i2048 {
    var r = i2048_from_u32(0);
    r.sign = _a.sign;
    var underflow = u32(0);
    for (var i = u32(0); i != 64; i++) {
        let a_low = _a.number[63 - i] & 0xFFFF;
        let b_low = _b.number[63 - i] & 0xFFFF;
        var sub_low = u32(0);
        if (a_low == 0 && underflow == 1) {
            sub_low = 65535 - b_low;
            underflow = 1;
        }
        else if (a_low - underflow >= b_low) {
            sub_low = a_low - underflow - b_low;
            underflow = 0;
        }
        else {
            sub_low = (65536 + (a_low - underflow)) - b_low;
            underflow = 1;
        }
        r.number[63 - i] |= sub_low;
        let a_high = _a.number[63 - i] >> 16;
        let b_high = _b.number[63 - i] >> 16;
        var sub_high = u32(0);
        if (a_high == 0 && underflow == 1) {
            sub_high = 65535 - b_high;
            underflow = 1;
        }
        else if (a_high - underflow >= b_high) {
            sub_high = a_high - underflow - b_high;
            underflow = 0;
        }
        else {
            sub_high = (65536 + (a_high - underflow)) - b_high;
            underflow = 1;
        }
        r.number[63 - i] |= sub_high << 16;
    }
    return r;
}
fn summation4096(_a: i4096, _b: i4096) -> i4096 {
    var r = i4096_from_u32(0);
    r.sign = _a.sign;
    var overflow = u32(0);
    for (var i = u32(0); i != 128; i++) {
        let a_low = _a.number[127 - i] & 0xFFFF;
        let b_low = _b.number[127 - i] & 0xFFFF;
        let sum_low = a_low + b_low + overflow;
        overflow = sum_low >> 16;
        r.number[127 - i] |= sum_low & 0xFFFF;
        let a_high = _a.number[127 - i] >> 16;
        let b_high = _b.number[127 - i] >> 16;
        let sum_high = a_high + b_high + overflow;
        overflow = sum_high >> 16;
        r.number[127 - i] |= sum_high << 16;
    }
    return r;
}
fn subtraction4096(_a: i4096, _b: i4096) -> i4096 {
    var r = i4096_from_u32(0);
    r.sign = _a.sign;
    var underflow = u32(0);
    for (var i = u32(0); i != 128; i++) {
        let a_low = _a.number[127 - i] & 0xFFFF;
        let b_low = _b.number[127 - i] & 0xFFFF;
        var sub_low = u32(0);
        if (a_low == 0 && underflow == 1) {
            sub_low = 65535 - b_low;
            underflow = 1;
        }
        else if (a_low - underflow >= b_low) {
            sub_low = a_low - underflow - b_low;
            underflow = 0;
        }
        else {
            sub_low = (65536 + (a_low - underflow)) - b_low;
            underflow = 1;
        }
        r.number[127 - i] |= sub_low;
        let a_high = _a.number[127 - i] >> 16;
        let b_high = _b.number[127 - i] >> 16;
        var sub_high = u32(0);
        if (a_high == 0 && underflow == 1) {
            sub_high = 65535 - b_high;
            underflow = 1;
        }
        else if (a_high - underflow >= b_high) {
            sub_high = a_high - underflow - b_high;
            underflow = 0;
        }
        else {
            sub_high = (65536 + (a_high - underflow)) - b_high;
            underflow = 1;
        }
        r.number[127 - i] |= sub_high << 16;
    }
    return r;
}
fn summation8192(_a: i8192, _b: i8192) -> i8192 {
    var r = i8192_from_u32(0);
    r.sign = _a.sign;
    var overflow = u32(0);
    for (var i = u32(0); i != 256; i++) {
        let a_low = _a.number[255 - i] & 0xFFFF;
        let b_low = _b.number[255 - i] & 0xFFFF;
        let sum_low = a_low + b_low + overflow;
        overflow = sum_low >> 16;
        r.number[255 - i] |= sum_low & 0xFFFF;
        let a_high = _a.number[255 - i] >> 16;
        let b_high = _b.number[255 - i] >> 16;
        let sum_high = a_high + b_high + overflow;
        overflow = sum_high >> 16;
        r.number[255 - i] |= sum_high << 16;
    }
    return r;
}
fn subtraction8192(_a: i8192, _b: i8192) -> i8192 {
    var r = i8192_from_u32(0);
    r.sign = _a.sign;
    var underflow = u32(0);
    for (var i = u32(0); i != 256; i++) {
        let a_low = _a.number[255 - i] & 0xFFFF;
        let b_low = _b.number[255 - i] & 0xFFFF;
        var sub_low = u32(0);
        if (a_low == 0 && underflow == 1) {
            sub_low = 65535 - b_low;
            underflow = 1;
        }
        else if (a_low - underflow >= b_low) {
            sub_low = a_low - underflow - b_low;
            underflow = 0;
        }
        else {
            sub_low = (65536 + (a_low - underflow)) - b_low;
            underflow = 1;
        }
        r.number[255 - i] |= sub_low;
        let a_high = _a.number[255 - i] >> 16;
        let b_high = _b.number[255 - i] >> 16;
        var sub_high = u32(0);
        if (a_high == 0 && underflow == 1) {
            sub_high = 65535 - b_high;
            underflow = 1;
        }
        else if (a_high - underflow >= b_high) {
            sub_high = a_high - underflow - b_high;
            underflow = 0;
        }
        else {
            sub_high = (65536 + (a_high - underflow)) - b_high;
            underflow = 1;
        }
        r.number[255 - i] |= sub_high << 16;
    }
    return r;
}
fn summation16384(_a: i16384, _b: i16384) -> i16384 {
    var r = i16384_from_u32(0);
    r.sign = _a.sign;
    var overflow = u32(0);
    for (var i = u32(0); i != 512; i++) {
        let a_low = _a.number[511 - i] & 0xFFFF;
        let b_low = _b.number[511 - i] & 0xFFFF;
        let sum_low = a_low + b_low + overflow;
        overflow = sum_low >> 16;
        r.number[511 - i] |= sum_low & 0xFFFF;
        let a_high = _a.number[511 - i] >> 16;
        let b_high = _b.number[511 - i] >> 16;
        let sum_high = a_high + b_high + overflow;
        overflow = sum_high >> 16;
        r.number[511 - i] |= sum_high << 16;
    }
    return r;
}
fn subtraction16384(_a: i16384, _b: i16384) -> i16384 {
    var r = i16384_from_u32(0);
    r.sign = _a.sign;
    var underflow = u32(0);
    for (var i = u32(0); i != 512; i++) {
        let a_low = _a.number[511 - i] & 0xFFFF;
        let b_low = _b.number[511 - i] & 0xFFFF;
        var sub_low = u32(0);
        if (a_low == 0 && underflow == 1) {
            sub_low = 65535 - b_low;
            underflow = 1;
        }
        else if (a_low - underflow >= b_low) {
            sub_low = a_low - underflow - b_low;
            underflow = 0;
        }
        else {
            sub_low = (65536 + (a_low - underflow)) - b_low;
            underflow = 1;
        }
        r.number[511 - i] |= sub_low;
        let a_high = _a.number[511 - i] >> 16;
        let b_high = _b.number[511 - i] >> 16;
        var sub_high = u32(0);
        if (a_high == 0 && underflow == 1) {
            sub_high = 65535 - b_high;
            underflow = 1;
        }
        else if (a_high - underflow >= b_high) {
            sub_high = a_high - underflow - b_high;
            underflow = 0;
        }
        else {
            sub_high = (65536 + (a_high - underflow)) - b_high;
            underflow = 1;
        }
        r.number[511 - i] |= sub_high << 16;
    }
    return r;
}
fn karatsuba32(_a: u32, _b: u32) -> i64 {
    let x_h = _a >> 16;
    let x_l = _a & 0x0000FFFF;
    let y_h = _b >> 16;
    let y_l = _b & 0x0000FFFF;
    let hh = x_h * y_h;
    let hl = x_h * y_l;
    let lh = x_l * y_h;
    let ll = x_l * y_l;
    return i64_sum(i64_sum(i64_left_shift(i64_from_u32(hh), 32), i64_left_shift(i64_sum(i64_from_u32(hl), i64_from_u32(lh)), 16)), i64_from_u32(ll));
}
fn karatsuba64(_a: i64, _b: i64) -> i128 {
    let x_h = _a.number[0];
    let x_l = _a.number[1];
    let y_h = _b.number[0];
    let y_l = _b.number[1];
    let hh = karatsuba32(x_h, y_h);
    let hl = karatsuba32(x_h, y_l);
    let lh = karatsuba32(x_l, y_h);
    let ll = karatsuba32(x_l, y_l);
    return i128_sum(i128_sum(i128_left_shift(i128_from_i64(hh), 64), i128_left_shift(i128_sum(i128_from_i64(hl), i128_from_i64(lh)), 32)), i128_from_i64(ll));
}
fn karatsuba128(_a: i128, _b: i128) -> i256 {
    var a_high = array<u32, 2>();
    for (var i = u32(0); i != 2; i++) {
        a_high[i] = _a.number[i];
    }
    var a_low = array<u32, 2>();
    for (var i = u32(0); i != 2; i++) {
        a_low[i] = _a.number[2 + i];
    }
    var b_high = array<u32, 2>();
    for (var i = u32(0); i != 2; i++) {
        b_high[i] = _b.number[i];
    }
    var b_low = array<u32, 2>();
    for (var i = u32(0); i != 2; i++) {
        b_low[i] = _b.number[2 + i];
    }
    let x_h = i64_from_u32_array(a_high, 1);
    let x_l = i64_from_u32_array(a_low, 1);
    let y_h = i64_from_u32_array(b_high, 1);
    let y_l = i64_from_u32_array(b_low, 1);
    let hh = karatsuba64(x_h, y_h);
    let hl = karatsuba64(x_h, y_l);
    let lh = karatsuba64(x_l, y_h);
    let ll = karatsuba64(x_l, y_l);
    return i256_sum(i256_sum(i256_left_shift(i256_from_i128(hh), 128), i256_left_shift(i256_sum(i256_from_i128(hl), i256_from_i128(lh)), 64)), i256_from_i128(ll));
}
fn karatsuba256(_a: i256, _b: i256) -> i512 {
    var a_high = array<u32, 4>();
    for (var i = u32(0); i != 4; i++) {
        a_high[i] = _a.number[i];
    }
    var a_low = array<u32, 4>();
    for (var i = u32(0); i != 4; i++) {
        a_low[i] = _a.number[4 + i];
    }
    var b_high = array<u32, 4>();
    for (var i = u32(0); i != 4; i++) {
        b_high[i] = _b.number[i];
    }
    var b_low = array<u32, 4>();
    for (var i = u32(0); i != 4; i++) {
        b_low[i] = _b.number[4 + i];
    }
    let x_h = i128_from_u32_array(a_high, 1);
    let x_l = i128_from_u32_array(a_low, 1);
    let y_h = i128_from_u32_array(b_high, 1);
    let y_l = i128_from_u32_array(b_low, 1);
    let hh = karatsuba128(x_h, y_h);
    let hl = karatsuba128(x_h, y_l);
    let lh = karatsuba128(x_l, y_h);
    let ll = karatsuba128(x_l, y_l);
    return i512_sum(i512_sum(i512_left_shift(i512_from_i256(hh), 256), i512_left_shift(i512_sum(i512_from_i256(hl), i512_from_i256(lh)), 128)), i512_from_i256(ll));
}
fn karatsuba512(_a: i512, _b: i512) -> i1024 {
    var a_high = array<u32, 8>();
    for (var i = u32(0); i != 8; i++) {
        a_high[i] = _a.number[i];
    }
    var a_low = array<u32, 8>();
    for (var i = u32(0); i != 8; i++) {
        a_low[i] = _a.number[8 + i];
    }
    var b_high = array<u32, 8>();
    for (var i = u32(0); i != 8; i++) {
        b_high[i] = _b.number[i];
    }
    var b_low = array<u32, 8>();
    for (var i = u32(0); i != 8; i++) {
        b_low[i] = _b.number[8 + i];
    }
    let x_h = i256_from_u32_array(a_high, 1);
    let x_l = i256_from_u32_array(a_low, 1);
    let y_h = i256_from_u32_array(b_high, 1);
    let y_l = i256_from_u32_array(b_low, 1);
    let hh = karatsuba256(x_h, y_h);
    let hl = karatsuba256(x_h, y_l);
    let lh = karatsuba256(x_l, y_h);
    let ll = karatsuba256(x_l, y_l);
    return i1024_sum(i1024_sum(i1024_left_shift(i1024_from_i512(hh), 512), i1024_left_shift(i1024_sum(i1024_from_i512(hl), i1024_from_i512(lh)), 256)), i1024_from_i512(ll));
}
fn karatsuba1024(_a: i1024, _b: i1024) -> i2048 {
    var a_high = array<u32, 16>();
    for (var i = u32(0); i != 16; i++) {
        a_high[i] = _a.number[i];
    }
    var a_low = array<u32, 16>();
    for (var i = u32(0); i != 16; i++) {
        a_low[i] = _a.number[16 + i];
    }
    var b_high = array<u32, 16>();
    for (var i = u32(0); i != 16; i++) {
        b_high[i] = _b.number[i];
    }
    var b_low = array<u32, 16>();
    for (var i = u32(0); i != 16; i++) {
        b_low[i] = _b.number[16 + i];
    }
    let x_h = i512_from_u32_array(a_high, 1);
    let x_l = i512_from_u32_array(a_low, 1);
    let y_h = i512_from_u32_array(b_high, 1);
    let y_l = i512_from_u32_array(b_low, 1);
    let hh = karatsuba512(x_h, y_h);
    let hl = karatsuba512(x_h, y_l);
    let lh = karatsuba512(x_l, y_h);
    let ll = karatsuba512(x_l, y_l);
    return i2048_sum(i2048_sum(i2048_left_shift(i2048_from_i1024(hh), 1024), i2048_left_shift(i2048_sum(i2048_from_i1024(hl), i2048_from_i1024(lh)), 512)), i2048_from_i1024(ll));
}
fn karatsuba2048(_a: i2048, _b: i2048) -> i4096 {
    var a_high = array<u32, 32>();
    for (var i = u32(0); i != 32; i++) {
        a_high[i] = _a.number[i];
    }
    var a_low = array<u32, 32>();
    for (var i = u32(0); i != 32; i++) {
        a_low[i] = _a.number[32 + i];
    }
    var b_high = array<u32, 32>();
    for (var i = u32(0); i != 32; i++) {
        b_high[i] = _b.number[i];
    }
    var b_low = array<u32, 32>();
    for (var i = u32(0); i != 32; i++) {
        b_low[i] = _b.number[32 + i];
    }
    let x_h = i1024_from_u32_array(a_high, 1);
    let x_l = i1024_from_u32_array(a_low, 1);
    let y_h = i1024_from_u32_array(b_high, 1);
    let y_l = i1024_from_u32_array(b_low, 1);
    let hh = karatsuba1024(x_h, y_h);
    let hl = karatsuba1024(x_h, y_l);
    let lh = karatsuba1024(x_l, y_h);
    let ll = karatsuba1024(x_l, y_l);
    return i4096_sum(i4096_sum(i4096_left_shift(i4096_from_i2048(hh), 2048), i4096_left_shift(i4096_sum(i4096_from_i2048(hl), i4096_from_i2048(lh)), 1024)), i4096_from_i2048(ll));
}
fn karatsuba4096(_a: i4096, _b: i4096) -> i8192 {
    var a_high = array<u32, 64>();
    for (var i = u32(0); i != 64; i++) {
        a_high[i] = _a.number[i];
    }
    var a_low = array<u32, 64>();
    for (var i = u32(0); i != 64; i++) {
        a_low[i] = _a.number[64 + i];
    }
    var b_high = array<u32, 64>();
    for (var i = u32(0); i != 64; i++) {
        b_high[i] = _b.number[i];
    }
    var b_low = array<u32, 64>();
    for (var i = u32(0); i != 64; i++) {
        b_low[i] = _b.number[64 + i];
    }
    let x_h = i2048_from_u32_array(a_high, 1);
    let x_l = i2048_from_u32_array(a_low, 1);
    let y_h = i2048_from_u32_array(b_high, 1);
    let y_l = i2048_from_u32_array(b_low, 1);
    let hh = karatsuba2048(x_h, y_h);
    let hl = karatsuba2048(x_h, y_l);
    let lh = karatsuba2048(x_l, y_h);
    let ll = karatsuba2048(x_l, y_l);
    return i8192_sum(i8192_sum(i8192_left_shift(i8192_from_i4096(hh), 4096), i8192_left_shift(i8192_sum(i8192_from_i4096(hl), i8192_from_i4096(lh)), 2048)), i8192_from_i4096(ll));
}
fn karatsuba8192(_a: i8192, _b: i8192) -> i16384 {
    var a_high = array<u32, 128>();
    for (var i = u32(0); i != 128; i++) {
        a_high[i] = _a.number[i];
    }
    var a_low = array<u32, 128>();
    for (var i = u32(0); i != 128; i++) {
        a_low[i] = _a.number[128 + i];
    }
    var b_high = array<u32, 128>();
    for (var i = u32(0); i != 128; i++) {
        b_high[i] = _b.number[i];
    }
    var b_low = array<u32, 128>();
    for (var i = u32(0); i != 128; i++) {
        b_low[i] = _b.number[128 + i];
    }
    let x_h = i4096_from_u32_array(a_high, 1);
    let x_l = i4096_from_u32_array(a_low, 1);
    let y_h = i4096_from_u32_array(b_high, 1);
    let y_l = i4096_from_u32_array(b_low, 1);
    let hh = karatsuba4096(x_h, y_h);
    let hl = karatsuba4096(x_h, y_l);
    let lh = karatsuba4096(x_l, y_h);
    let ll = karatsuba4096(x_l, y_l);
    return i16384_sum(i16384_sum(i16384_left_shift(i16384_from_i8192(hh), 8192), i16384_left_shift(i16384_sum(i16384_from_i8192(hl), i16384_from_i8192(lh)), 4096)), i16384_from_i8192(ll));
}
