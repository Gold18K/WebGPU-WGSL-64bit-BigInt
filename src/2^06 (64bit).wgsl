// Structs
struct i64 {
    number: array<u32, 2>,
    sign:   i32
};
struct i128 {
    number: array<u32, 4>,
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
