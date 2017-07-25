//: Playground - noun: a place where people can play

import Cocoa

let str = "Hello, playground"
let characters = str.characters

// Map: Iterate a collection and applies the same block operation to each element in it.
print(characters.map({ String($0).uppercased() }))

// Filter: Iterate a collection and return elements that meet a condition.
print(characters.filter({ $0 == "o"}))

// Reduce: Combine all elements in a collection to create a single output.
print(characters.reduce("", { String($0) + String($1) }))

// FlatMap: Flattens a collection of collections.
let _characters = ["Hello".characters, ", ".characters, "playground".characters]
print(_characters.flatMap({ $0 }))