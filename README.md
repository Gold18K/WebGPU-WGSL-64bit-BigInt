# WebGPU-WGSL-BigInt
This repository contains various source codes needed to be able to work with BigInts ("Arbitrary" large signed integers) in your WGSL shaders.

More precisely, it allows to manage operations between BigInts with length up to 2^19 bits, or 157826 decimal digits.

Now, why different source codes?

The WGSL shading language has various limitations:

- No function overloading;
- Only f32, i32, u32, bool scalar types;
- No arbitrary length arrays;
- No implicit scalar conversion;
- No recursion;
- No Cyclic dependencies;

Follows that the source must be more verbose than usual, making the code unpleasantly long.
So, I decided to split the complete source code so that you can choose the best fit for your shader (If you only need 64bit support, there no need to include the full 2^19 bits (524288bit BigInt) source code, that has a total length of 5392 rows, and just stick with the 64bit one that has 660 rows.)

## Documentation

1) K represents a multiple of 64, ranging from 64 to 524288, extremes included;
2) J corresponds to K >> 1 (Left shift);
3) L corresponds to K >> 5 (Left shift);

### Constructors

- iK_from_i32(_n: i32) -> iK;

Instantiate an iK integer from an i32;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i256_from_i32(-42);
    }

- iK_from_u32(_n: u32) -> iK;

Instantiate an iK integer from an i32;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i256_from_u32(42);
    }

- fn iK_from_iJ(_n: iJ) -> iK;

Instantiate an iK integer from an iJ, useful when you realize that the result of your operations might not fit in the current iJ;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(-42);
        var b = i128_from_i64(a);
    }

- fn iK_from_u32_array(_number: array<u32, L>, _sign: i32) -> iK;

Instantiate an iK integer from an array of L unsigned integers, useful when moving a BigInt represented as L unsigned integers from CPU to GPU;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var arr = array<u32, 4>(1, 2, 3, 4);
        var a = i128_from_u32_array(arr, 1);
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

Returns the negative of the input iK;

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
        var a = i64_from_i32(42);
        var b = i64_from_i32(57);
        var b = i64_and(a, b);
    }

- iK_or(_a: iK, _b: iK) -> iK;

Returns the logic OR between _a and _b, the resulting iK will be non negative;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(42);
        var b = i64_from_i32(57);
        var b = i64_or(a, b);
    }

- iK_xor(_a: iK, _b: iK) -> iK;

Returns the logic XOR between _a and _b, the resulting iK will be non negative;

    @compute
    @workgroup_size(1, 1)
    fn cs() {
        var a = i64_from_i32(42);
        var b = i64_from_i32(57);
        var b = i64_xor(a, b);
    }


