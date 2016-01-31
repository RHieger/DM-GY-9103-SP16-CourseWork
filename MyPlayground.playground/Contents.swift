//: Playground - noun: a place where people can play
//: First playground for Chapter 2

import Cocoa

var str = "Hello, playground"

str = "Hello, Swift"

// Set new constant to the value of str.

let constString = str

/* In the next few lines, we declare (but do not initialize) specified
 * data types rathar than letting the Swift compiler infer data type.
 * NOTE: Because the variables are declared, but not initialized, no
 * value appears in the Playground sidebar.
*/

var nextYear: Int

var bodyTemp: Float

var hasPet: Bool

/* The next few lines will explore the use of collections, of which there
 * are three types in Swift: Array, Set and Dictionary. There are two methods
 * of declaration, one verbose and the shorthand syntax. Both are explored
 * below for clarity.
*/

// Explicit declaration:

//var arrayOfInts: Array<Int>

// Shorthand declaration:

var arrayOfInts: [Int]

// Explicit declaration of dictionary:

//var dictionaryOfCapitalsByCountry: Dictionary<String, String>

// Shorthand declaration of dictionary:

var dictionaryOfCapitalsByCountry: [String: String]

// Declare a collection variable of type Set, which appears in the book
// to have only an explicit declaration syntax:

var winningLotteryNumbers: Set<Int>     // NOTE: Only elements of Type Int
                                        // may be part of this Set.

