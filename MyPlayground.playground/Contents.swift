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

//let countingUp = ["one","two"]

var countingUp = ["one", "two"]

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

/* Working with Initializers:
 *
 * "Some standard types have initializers that return empty literals when no
 *  arguments are supplied. Add an empty string and an empty array to your
 *  playground.”
 *
 *  Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 *  p. 101 (Robert Hieger's Library). iBooks.
 *
*/

let emptyString = String()      // NOTE: Once again, this is a String constant,
                                // not a variable.

let emptyArrayOfInts = [Int]()  // NOTE: Just as above, this is an Array
                                // constant, being initialized as an
                                // empty Array.

let emptySetOfFloats = Set<Float>()     // NOTE: Also as above, this is a Set
                                        // constant (immutable), being
                                        // initialized as an empty Set.

/* Exploring Types With Multiple Initializers:
 *
 * “Types can have multiple initializers. For example, String has an
 *  initializer that accepts an Int and creates a string based on
 *  that value.”
 *
 * Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 * p. 101 (Robert Hieger's Library). iBooks.
 *
*/

// Use Integer Constant of number from line 63:

let meaningOfLife = String(number)

// Initialize a Set using an Array literal:

let availableRooms = Set([205, 411, 412])

/* Examples of Float Initializers:
 *
 * “Float has several initializers. The parameter-less initializer returns an
 *  instance of Float with the default value. There is also an initializer that 
 *  accepts a floating-point literal.”
 *
 *  Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 *  p. 102 (Robert Hieger's Library). iBooks.
 *
*/

// Float with Default Value:

let defaultFloat = Float()      // Results in output of '0', interestingly,
                                // rather than 0.0

// Float Initialized with Float Literal:

let floatFromLiteral = Float(3.14)

/* Use Type Inferrence to Create Float Literal:
 *
 * “If you use type inference for a floating-point literal, the type
 *  defaults to Double.”
 *
 * Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 * p. 102 (Robert Hieger's Library). iBooks.
 *
*/

let easyPi = 3.14

/* Now use this Double to Initialize an Explicitly Typed Float:
 *
 * “Use the Float initializer that accepts a Double to create a Float”
 *
 * Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 * p. 102 (Robert Hieger's Library). iBooks.
 *
*/

let floatFromDouble = Float(easyPi)

/* Now Initialize the Float with Explicit Typing:
 *
 * “You can achieve the same result by specifying the type in the declaration.”
 *
 * Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 * p. 102 (Robert Hieger's Library). iBooks.
 *
*/

let floatingPi: Float = 3.14

/* Working with Properties:
 *
 * “A property is a value associated with an instance of a type. For example,
 *  String has the property isEmpty, which is a Bool that tells you whether
 *  the string is empty. Array<T> has the property count, which is the number
 *  of elements in the array as an Int.”
 *
 * Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 * p. 102-103 (Robert Hieger's Library). iBooks.
 *
*/

// Get number of elements in countingUp Array:

countingUp.count

// Verify whether emptString String Type is empty:

emptyString.isEmpty

/* Exploring Instance Methods:
 *
 * “An instance method is a function that is specific to a particular
 *  type and can be called on an instance of that type. Try out the
 *  append(_:) instance method from Array<T>.”
 *
 * Excerpt From: Christian Keur. “iOS Programming: The Big Nerd Ranch Guide,
 * p. 103 (Robert Hieger's Library). iBooks.
*/

// Demonstrate the append(_:) method of an Array instance.
// NOTE: In order to do this, we are converting the countingUp Array
// from a constant to a variable. See commented-out code on line 76
// and its replacement on line 78.

countingUp.append("three")          // Adds an element of value "three"
                                    // to the countingUp Array.

/* Exploring Optionals:
*
* “Swift types can be optional, which is indicated by appending ? to a
*  type name.
*
*   v​a​r​ ​a​n​O​p​t​i​o​n​a​l​F​l​o​a​t​:​ ​F​l​o​a​t​?
*   v​a​r​ ​a​n​O​p​t​i​o​n​a​l​A​r​r​a​y​O​f​S​t​r​i​n​g​s​:​ ​[​S​t​r​i​n​g​]​?
*   v​a​r​ ​a​n​O​p​t​i​o​n​a​l​A​r​r​a​y​O​f​O​p​t​i​o​n​a​l​S​t​r​i​n​g​s​:​ ​[​S​t​r​i​n​g​?​]​?
*
*  An optional lets you express the possibility that a variable may not
*  store a value at all. The value of an optional will either be an
*  instance of the specified type or nil.”
*
*  Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
*  p. 105 (Robert Hieger's Library). iBooks.
*/

// Example instrument readings, implemented as optionals, from p. 106:

var reading1: Float?

var reading2: Float?

var reading3: Float?

// NOTE: All values of the reading* variables defaulted to nil because
// the variables were only declared, not initialized with any value.

// Now we will assign values to the Float optionals:

reading1 = 9.8

reading2 = 9.2

reading3 = 9.7

/* Exploring "Unrwapping the Optional":
 *
 * “...you cannot use these optional floats like non-optional floats –
 *  even if they have been assigned Float values. Before you can read
 *  the value of an optional variable, you must address the possibility
 *  of its value being nil. This is called unwrapping the optional.”
 *
 * Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 * page 106(Robert Hieger's Library). iBooks.
 *
*/

// Demonstrate "Unwrapping the Optional", Method 1--Forced Unwrapping:

// First we will try to average the optionals to demonstrate that you
// cannot directly access the value of an optional. This will throw an
// error. Then we will comment out the offending line of code.

//let avgReading = (reading1 + reading2 + reading3) / 3

// Now, we will used Forced Unwrapping:

let avgReading = (reading1! + reading2! + reading3!) / 3    // Now this works!

// HOWEVER...

/*
 * “Everything looks fine, and you see the correct average in the sidebar.
 *  But a danger lurks in your code. When you forcibly unwrap an optional,
 *  you tell the compiler that you are sure that the optional will not be
 *  nil and can be treated as if it were a normal Float. But what if you
 *  are wrong?”
 *
 * Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 * page 107 (Robert Hieger's Library). iBooks.
*/

// In point of fact, if we commented out the value assignment on any one of
// the optional floats, the Swift compiler would throw an error reading
// "fatal error: unexpectedly found nil while unwrapping an Optional value."

// Demonstrate Unwrapping the Optional, Method 2--Optional Binding:

/* This method is considered safer:
 *
 * “Optional binding works within a conditional if-let statement: You assign
 *  the optional to a temporary constant of the corresponding non-optional
 *  type. If your optional has a value, then the assignment is valid and you
 *  proceed using the non-optional constant. If the optional is nil, then you
 *  can handle that case with an else clause.”
 *
 * Excerpt From: Christian Keur. iOS Programming: The Big Nerd Ranch Guide,
 * page 108 (Robert Hieger's Library). iBooks.
 *
*/

if let r1 = reading1,
       r2 = reading2,
       r3 = reading3    {
       
    let avgReading = (r1 + r2 + r3) / 3
        
}   else {
    
    let errorString = "Instrument reported a reading that was nil."
    
}   // end if let-else

// NOTE: I tried all cases as noted in the book, but prefer to have both
// methods demonstrated, so uncommented the lines that would have caused
// the program to crash if they were commented out.

