//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//integer and floating -point conversion:

// int ah float ah matha
let age = 5
let ageFloat = Float(age)
print(ageFloat)
//optionals:

var myAge: Int? = nil

// array
//-------
//order ah output varum
//duplicate elements irukum

//let books: [String] = [
//                     "thirukural",
//                     "bible",
//                     "kuran",
//                     "bible"
//    ]
//print(books)
// yethavathu books ah add pannanum na

var books: [String]=[
    "thirukural",
    "bible",
    "kuran",
    "bible",
]
books.append("bagavathgeetha")
print(books)

//book ah remove panna
books.remove(at: 2)
// book ota index vanum na
for (index, books) in books.enumerated()
{
    print(index)
    print(books)
}

// set
//------
//unorder ah output varum
// duplicate elements varathu
// index vachu set ah access panna mutyathu
// yan na yentha index la yentha variable iruku nu namaku theriyathu
var rollNo: Set<Int> = []
rollNo = [
    1, 2, 3, 4, 5, 1, 2
]
print(rollNo)
// for loop vachu access pannalam
for item in rollNo
{
    print(item)
}
// dictionary
//-----------
//attendance la ovaru rollNo ikum oru name irukum
// values duplicate ana problem ella but key yeppoum unique ah irukanum
//orai name 2,3 person iku irukum ana rollno onna irukathu
var attendanceRecord: [Int: String] = [:]
attendanceRecord = [
    1: "nithiya",
    2: "neha",
    3: "rajasri",
    4: "asvika sri",
    5:"nithiya"
]
print(attendanceRecord)

// string
//---------

// empty string creaton

var StringA = ""
if StringA.isEmpty
{
    print("StringA is empty")
}
else
{
    print("StringA is not empty")
    }
// empty string creation using string instance
let StringB = String()
if StringB.isEmpty
{
    print("StringB is empty")
}
else{
    print("StringB is not empty")
    
}

//string concatenation
// 2 string ah seakurom
var String1 = "rajasri"
var String2 = "sri"
String1 +="neha"
print(String1)
//string ota length ah kantupdika count use pantrom
var newone= "nithiya sri"
print(newone.count)

// string interpolation

//oru string kulla variable , constants use pantrathu than string interpolation
let one = "hi"
var String3 = "welcome \(one)"
print(String3)

// string comparison

// use == this operator
// this boolean function
//equal na true not equal na false
var String4 = one
var String5 = one
print(String4==String5)

// functions
//-----------

// func - keyword
// function call type
fanc addTwoNumbers()
{
    let a = 1
    let b = 2
    let c = a+b
    print(c)
}
addTwoNumbers

// function return type
func sub -> Int
{
    let d = 3
    let e = 4
    let f = e-d
    return(f)
}
let value = sub()
print(value)
// function parameter
func firstone(para1: Int, para2: Int)->Int
{
    let g = para1
    let h = para2
    let i = g+h
    return i
}
let result = firstone(para1: 7, para2: 8)
print(result)

// closurs
//--------

//closurs is function
// oru function la irunthu unaru function iku pass pantrathu closurs



//
