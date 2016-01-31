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

/* The next few lines explore adding literals to declared variables. For
 * example, a String literal would be assigned to a variable of type String
 * by enclosing it in double quote marks; a numeric literal is assigned by
 * by simply typing the number (integer or float) in numeral form following
 * the assignment operator (=).
*/

// Assigning numeric literals (in this case, to constants):

let number = 42

let fmStation = 91.1    // NOTE: Book incorrectly lists sidebar output as
                        // 91.1. Because the inferred type of fmStation is
                        // double, the sidebar output is 91.099999999999999,
                        // the best approximation of the value in 64-bit float
                        // or double.

                        // Apple's documentation says that type Double supports
                        // at least 15 decimal places.

// Assigning literals to an Array (in this case, array constant):

let countingUp = ["one","two"]

// Assigning literals to a Dictionary (in this case, also constant):

let nameByParkingSpace = [13: "Alice", 27: "Bob"]       // NOTE: Strange that
                                                        // Swift would apply
                                                        // a descending sort
                                                        // on the dictionary's
                                                        // numeric key without
                                                        // our specifying it.

// Subscripting the countingUp Array:

let secondElement = countingUp[1]           // Assigns the second Array element
                                            // to constant secondElement.