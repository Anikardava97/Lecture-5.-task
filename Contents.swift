//Task 1 - შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.

func factorial(_ n: Int) -> Int {
    if n < 0 {
        return -1
    } else if n == 0 || n == 1 {
        return 1
    } else {
        return n * factorial(n-1)
    }
}

let result = factorial(4)
print("Factorial of 4 is - \(result)")

//Task 2 - შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.

func fibonacci() -> [Int] {
    var fibNumbers = [0, 1]
    
    while fibNumbers.count < 20 {
        let nextNumber = fibNumbers[fibNumbers.count - 1] + fibNumbers[fibNumbers.count - 2]
        fibNumbers.append(nextNumber)
    }
    return fibNumbers
}

let fibonacciNumbers = fibonacci()
print(fibonacciNumbers)

//Task 3 - შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.

func isPalindrome(_ word: String) -> Bool {
    let characters = Array(word)
    let length = characters.count
    
    for i in 0..<length / 2 {
        if characters[i] != characters[length - 1 - i] {
            return false
        }
    }
    
    return true
}

let example = "racecar"
let resultt = isPalindrome(example)
print("Is '\(example)' a palindrome? \(result)")

////second version
//func isPalindrome(_ word: String) -> Bool {
//    let characters = Array(word)
//    return characters == characters.reserved()

//Task 4 - შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.

func printSquares(of numbers: [Int]) {
    for number in numbers {
        let square = number * number
        print("Square of \(number): \(square)")
    }
}

let numbers = [1, 2, 3, 4, 5]
printSquares(of: numbers)

//Task 5 - შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]

func countWords(_ input: String) -> [String: Int] {
    var wordCounts: [String: Int] = [:]
    
    var currentWord = ""
    
    for character in input.lowercased() {
        if character.isLetter || character.isNumber {
            currentWord.append(character)
        } else {
            if !currentWord.isEmpty {
                wordCounts[currentWord, default: 0] += 1
                currentWord = ""
            }
        }
    }
    
    if !currentWord.isEmpty {
        wordCounts[currentWord, default: 0] += 1
    }
    
    return wordCounts
}

let inputString = "TBC x USAID, tbc it academy, we are in TBC academy."
let wordCounts = countWords(inputString)
print(wordCounts)

//Task 6 - შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.

let toBinary: (Int) -> String = { number in
    var result = ""
    var n = number
    
    while n > 0 {
        result = String(n % 2) + result
        n /= 2
    }
    
    return result.isEmpty ? "0" : result
}

let decimalNumber = 10
let binaryRepresentation = toBinary(decimalNumber)
print("\(decimalNumber): \(binaryRepresentation)")

//Task 7 - შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.

let filterOutOdds: ([Int]) -> [Int] = { numbers in
    return numbers.filter { $0 % 2 == 0 }
}

let inputArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let resultArray = filterOutOdds(inputArray)
print("Original Array: \(inputArray)")
print("Filtered Array (no odd numbers): \(resultArray)")

//Task 8 - შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.

let mapToDecuple: ([Int]) -> [Int] = { numbers in
    return numbers.map { $0 * 10 }
}

let inputtArray = [1, 2, 3, 4, 5]
let resulttArray = mapToDecuple(inputArray)
print("Original Array: \(inputArray)")
print("Mapped Array: \(resultArray)")

//Task 9 - გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.

import Foundation

func findSum(_ nnnumbers: [Int], completion: @escaping (Int) -> Void) {
    DispatchQueue.global().async {
        Thread.sleep(forTimeInterval: 3)
        let subtotal = numbers.reduce(0, +)
        completion(subtotal)
    }
}
let nnnumbers = [1, 2, 3, 4, 5]

findSum(nnnumbers) { subtotal in
    print (subtotal)
}

//Task 10 - function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.

func filterOdds(from strings: [String]) -> [Int] {
    let oddNumbers = strings.compactMap { Int($0) }.filter { $0 % 2 != 0 }
    return oddNumbers
}

let stringArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
let oddNumbers = filterOdds(from: stringArray)
print("Original Array: \(stringArray)")
print("Odd Numbers: \(oddNumbers)")

