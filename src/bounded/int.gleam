//// A wrapper for the base [`bounded`](/bounded) module to work with integers.
////
//// ---
////
//// * **Creating bounded integers**
////   * [`by`](#by)
////   * [`between`](#between)
//// * **Preset bounds**
////   * [`int_8`](#int_8)
////   * [`uint_8`](#uint_8)
////   * [`int_16`](#int_16)
////   * [`uint168`](#uint_16)
////   * [`int_32`](#int_32)
////   * [`uint_32`](#uint_32)
////   * [`js_safe_int`](#js_safe_int)
//// * **Updating bounded integers**
////   * [`increment`](#increment)
////   * [`decrement`](#decrement)
////


import bounded.{Bounded}
import gleam/int.{Int}


// CREATING BOUNDED VALUES -----------------------------------------------------


/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Create an integer bounded by a min and max value. This defaults to using the
/// provided min as the initial value.
///
/// Although function parameters are named `min` and `max` for convenience, this
/// will always use whichever value is smaller as the minimum bound as determined
/// by your comparison function.
///
/// See also: [`bounded.by`](/bounded#by)
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn by (min: Int, max: Int) -> Bounded(Int) {
    bounded.by(min, max, int.compare)
}

/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Create an integer bounded by a min and max value. The first parameter determines
/// the initial value, although it will be clamped if it is out of bounds.
///
/// Although function parameters are named `min` and `max` for convenience, this
/// will always use whichever value is smaller as the minimum bound as determined
/// by your comparison function.
///
/// See also: [`bounded.between`](/bounded#between)
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn between (val: Int, min: Int, max: Int) -> Bounded(Int) {
    bounded.between(val, min, max, int.compare)
}


// PRESET BOUNDED VALUES -------------------------------------------------------


/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Mimics the bounds of a signed 8-bit integer.
///
/// <details>
///     <summary>Example:</summary>
///
///     import bounded
///     import bounded/int.{int_8}
///     import gleam/should
/// 
///     pub fn example () {
///         let foo = int_8(0)
///     
///         bounded.min(of: foo) |> should.equal(-128)
///         bounded.max(of: foo) |> should.equal(127)
///     }
/// </details>
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn int_8 (val: Int) -> Bounded(Int) {
    between(val, -128, 127)
}

/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Mimics the bounds of an unsigned 8-bit integer.
///
/// <details>
///     <summary>Example:</summary>
///
///     import bounded
///     import bounded/int.{uint_8}
///     import gleam/should
/// 
///     pub fn example () {
///         let foo = uint_8(0)
///     
///         bounded.min(of: foo) |> should.equal(0)
///         bounded.max(of: foo) |> should.equal(255)
///     }
/// </details>
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn uint_8 (val: Int) -> Bounded(Int) {
    between(val, 0, 255)
}

/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Mimics the bounds of a signed 16-bit integer.
///
/// <details>
///     <summary>Example:</summary>
///
///     import bounded
///     import bounded/int.{int_16}
///     import gleam/should
/// 
///     pub fn example () {
///         let foo = int_16(0)
///     
///         bounded.min(of: foo) |> should.equal(-32768)
///         bounded.max(of: foo) |> should.equal(32767)
///     }
/// </details>
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn int_16 (val: Int) -> Bounded(Int) {
    between(val, -32768, 32767)
}

/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Mimics the bounds of an unsigned 16-bit integer.
///
/// <details>
///     <summary>Example:</summary>
///
///     import bounded
///     import bounded/int.{uint_16}
///     import gleam/should
/// 
///     pub fn example () {
///         let foo = uint_16(0)
///     
///         bounded.min(of: foo) |> should.equal(0)
///         bounded.max(of: foo) |> should.equal(65535)
///     }
/// </details>
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn uint_16 (val: Int) -> Bounded(Int) {
    between(val, 0, 65535)
}

/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Mimics the bounds of a signed 32-bit integer.
///
/// <details>
///     <summary>Example:</summary>
///
///     import bounded
///     import bounded/int.{int_32}
///     import gleam/should
/// 
///     pub fn example () {
///         let foo = int_32(0)
///     
///         bounded.min(of: foo) |> should.equal(-2147483648)
///         bounded.max(of: foo) |> should.equal(2147483647)
///     }
/// </details>
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn int_32 (val: Int) -> Bounded(Int) {
    between(val, -2147483648, 2147483647)
}

/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Mimics the bounds of an unsigned 32-bit integer.
///
/// <details>
///     <summary>Example:</summary>
///
///     import bounded
///     import bounded/int.{uint_32}
///     import gleam/should
/// 
///     pub fn example () {
///         let foo = uint_32(0)
///     
///         bounded.min(of: foo) |> should.equal(0)
///         bounded.max(of: foo) |> should.equal(4294967295)
///     }
/// </details>
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn uint_32 (val: Int) -> Bounded(Int) {
    between(val, 0, 4294967295)
}

/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Integers in JavaScript have a safe range of `2^53 - 1` to `-(2^53 - 1)`. This
/// bounded constructor will keep you within those constraints if you don't want
/// to deal with serializing and subsequent decoding of `BigInt`s in your JSON.
///
/// <details>
///     <summary>Example:</summary>
///
///     import bounded
///     import bounded/int.{js_safe_int}
///     import gleam/should
/// 
///     pub fn example () {
///         let foo = js_safe_int(0)
///     
///         bounded.min(of: foo) |> should.equal(-9007199254740991)
///         bounded.max(of: foo) |> should.equal(9007199254740991)
///     }
/// </details>
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn js_safe_int (val: Int) -> Bounded(Int) {
    between(val, -9007199254740991, 9007199254740991)
}


// UPDATING BOUNDED VALUES -----------------------------------------------------


/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Increment a bounded value by one. This is a convenience function that might
/// be useful if you're implementing something like a counter with a min/max
/// range.
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn increment (bounded_int: Bounded(Int)) -> Bounded(Int) {
    bounded.update(bounded_int, fn (n) {
        n + 1
    })
}

/// <div style="text-align: right;">
///     <a href="https://github.com/pd-andy/gleam_bounded/issues">
///         <small>Spot a typo? Open an issue!</small>
///     </a>
/// </div>
///
/// Decrement a bounded value by one. This is a convenience function that might
/// be useful if you're implementing something like a counter with a min/max
/// range.
///
/// <div style="text-align: right;">
///     <a href="#">
///         <small>Back to top ↑</small>
///     </a>
/// </div>
///
pub fn decrement (bounded_int: Bounded(Int)) -> Bounded(Int) {
    bounded.update(bounded_int, fn (n) {
        n - 1
    })
}
