# WebGPU-WGSL-BigInt
This repository contains various WGSL source codes needed to be able to use, in your shaders, 64bit integer arithmetic and more!

More precisely, it allows to manage arithmetic and logical operations between integers with size up to 2^16 bits, or 19728 decimal digits.

Now, why different source codes?

The WGSL shading language has various limitations:

- No function overloading;
- Only f32, i32, u32, bool scalar types;
- No arbitrary length arrays;
- No implicit scalar conversion;
- No recursion;
- No cyclic dependencies;

Follows that the source must be extremely more verbose than usual, making the code unpleasantly long.
So, I decided to split the complete source code so that you can choose the best fit for your shader (If you only need 64bit support, there's no need to include the full 2^16 bits source code, that has a total length of around 4500 rows, and just stick with the 64bit one that has around 680.)

To use it, just copy the content of ONE of the .wgsl files present in the "Source Codes" folder, and paste it into the string of your WGSL shader.
_Using the content of a particular .wgsl file automatically includes support for all smaller integers._

### _Disclaimer: because of WebGPU intrinsic stack size limitations, your browser might not be able to compile shaders that make use of the bigger BigInts._

## Documentation

1) K is a power of 2, with the exponent ranging from 6 to 19, extremes included;
2) J is equal to K >> 1 (Right shift);
3) L is equal to K >> 5 (Right shift);

### Constructors

- iK_from_i32(_n: i32) -> iK;

Instantiate an iK integer from an i32;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i128_from_i32(-42);
    }

- iK_from_u32(_n: u32) -> iK;

Instantiate an iK integer from an u32;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_u32(42);
    }

- iK_from_iJ(_n: iJ) -> iK;

Instantiate an iK integer from an iJ, useful when you realize that the result of your future operations might not fit in the current iJ;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(-42);
        var b = i128_from_i64(a);
    }

- iK_from_u32_array(_number: array<u32, L>, _sign: i32) -> iK;

Instantiate an iK integer from an array of L u32 integers, useful when moving a BigInt from CPU to GPU;

_sign must be either 1 (Non-negative integer) or -1 (Negative integer), undefined behaviour otherwise;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var arr = array<u32, 4>(1, 2, 3, 4);
        var a   = i128_from_u32_array(arr, 1); // Now contains 1*2^96 + 2*2^64 + 3*2^32 + 4, or 79228162551157825753847955460
    }

### Unary Operators

- iK_abs(_n: iK) -> iK;

Returns the absolute value of the input iK;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i256_from_i32(-42);
        var b = i256_abs(a); // Now contains 42
    }

- iK_negate(_n: iK) -> iK;

Returns the opposite of the absolute value of the input iK;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i256_from_i32(-42);
        var b = i256_negate(a); // Value did not change
    }

- iK_opposite(_n: iK) -> iK;

Returns the opposite value of the input iK;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i256_from_u32(42);
        var b = i256_opposite(a); // Now contains -42
    }

### Logic Operators

- iK_and(_a: iK, _b: iK) -> iK;

Returns the logic AND between _a and _b, the resulting iK will be non negative;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(0xF0F0);
        var b = i64_from_i32(0xFF00);
        var c = i64_and(a, b); // Now contains 0xF000
    }

- iK_or(_a: iK, _b: iK) -> iK;

Returns the logic OR between _a and _b, the resulting iK will be non negative;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(0xF0F0);
        var b = i64_from_i32(0xFF00);
        var c = i64_or(a, b); // Now contains 0xFFF0
    }

- iK_xor(_a: iK, _b: iK) -> iK;

Returns the logic XOR between _a and _b, the resulting iK will be non negative;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(0xF0F0);
        var b = i64_from_i32(0xFF00);
        var c = i64_xor(a, b); // Now contains 0x0FF0
    }

### Bitwise shift operators

- iK_left_shift(_n: iK, _s: u32) -> iK;

Returns the number iK shifted to the left _s bits;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(1);
        var b = i64_left_shift(a, 1); // Now contains 2
    }

- iK_right_shift(_n: iK, _s: u32) -> iK;

Returns the number iK shifted to the right _s bits;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i128_from_i32(1);
        var b = i128_right_shift(a, 1); // Now contains 0
    }

### Comparison operators

- iK_eq(_a: iK, _b: iK) -> bool;

Returns true if _a is equal to _b;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(1);
        var b = i64_from_i32(2);
        var c = i64_eq(a, b); // Now contains false
    }

- iK_greater(_a: iK, _b: iK) -> bool;

Returns true if _a is greater than _b;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i128_from_i32(2);
        var b = i128_from_i32(1);
        var c = i128_greater(a, b); // Now contains true
    }

- iK_greater_eq(_a: iK, _b: iK) -> bool;

Returns true if _a is greater than or equal to _b;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i128_from_i32(5);
        var b = i128_from_i32(5);
        var c = i128_greater_eq(a, b); // Now contains true
    }

- iK_less(_a: iK, _b: iK) -> bool;

Returns true if _a is less than _b;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i256_from_i32(10);
        var b = i256_from_i32(5);
        var c = i256_less(a, b); // Now contains false
    }

- iK_less_eq(_a: iK, _b: iK) -> bool;

Returns true if _a is less than or equal to _b;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(42);
        var b = i64_from_i32(42);
        var c = i64_less_eq(a, b); // Now contains true
    }

### Max and Min operators

- iK_max(_a: iK, _b: iK) -> iK;

Returns the greatest number between _a and _b;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(-32);
        var b = i64_from_i32(-76);
        var c = i64_max(a, b); // Now contains -32
    }

- iK_min(_a: iK, _b: iK) -> iK;

Returns the smallest number between _a and _b;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(-32);
        var b = i64_from_i32(-76);
        var c = i64_min(a, b); // Now contains -76
    }

### Sum and Sub operators

- iK_sum(_a: iK, _b: iK) -> iK;

Returns the sum between _a and _b, undefined behaviour in case of overflow;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i512_from_i32(50);
        var b = i512_from_i32(50);
        var c = i512_sum(a, b); // Now contains 100
    }

- iK_sub(_a: iK, _b: iK) -> iK;

Returns the difference between _a and _b, undefined behaviour in case of underflow;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i256_from_i32(50);
        var b = i256_from_i32(50);
        var c = i256_sum(a, b); // Now contains 0
    }

### Mul and Div operators

- iK_mul_to_iK(_a: iK, _b: iK) -> iK;

Returns the product between _a and _b using the Karatsuba algorithm, useful when it is known in advance that the product won't exceed the maximum capacity of the current iK;

In case of overflow, the resulting iK will only contains the less significant bits;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(-11);
        var b = i64_from_i32(10);
        var c = i64_mul_to_i64(a, b); // Now contains -110
    }

- iJ_mul_to_iK(_a: iJ, _b: iJ) -> iK;

Returns the product between _a and _b using the Karatsuba algorithm, and stores the result into the next bigger iK;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i128_from_i32(-11);
        var b = i128_from_i32(10);
        var c = i128_mul_to_i256(a, b); // c is a i256, and now contains -110
    }

- iK_div(_a: iK, _b: iK) -> array<iK, 2>;

Returns the quotient and remainder of the division between _a and _b, and stores the result into an array of size two {Quotient, Remainder};

In case of division by zero, the resulting quotient and remainder will be both iK_from_u32(0); 

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i128_from_i32(11);
        var b = i128_from_i32(3);
        var c = i128_div(a, b); // c is array<i128, 2>(i128_from_u32(3), i128_from_u32(2))
    }

- iK_powermod(_b: iK, _e: iK, _m: iK) -> iK;

Modular exponentiation operation, returns (_b ^ _e) mod _m;

_b, _e and _m are assumed non-negative;

If (_m - 1) ^ 2 ≥ 2 ^ K, result is undefined, and you should use the next bigger BigInt;

If _m is 0, result is iK_from_i32(-1);

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var b = i64_from_u32(11);
        var e = i64_from_u32(2);
        var m = i64_from_u32(9);

        var res = i64_powermod(b, e, m); // res is a i64 and now contains 4, that is, 11 ^ 2 mod 9
    }
