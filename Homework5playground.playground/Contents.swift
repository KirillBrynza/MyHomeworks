import UIKit
import Foundation
// MARK: 1 задание

enum Currency: String {
    case USD
    case EUR
    case BYN
    case RUB // для проверки nil
}
func getExchangeRate(from: Currency, to: Currency) ->Double? {
    let rates: [Currency: [Currency: Double]] = [
        .USD: [.EUR: 0.9, .BYN: 3.2],
        .EUR: [.USD: 1.1, .BYN: 3.5],
        .BYN: [.USD: 0.31, .EUR: 0.29]
    ]
    if from == to {
        return 1.0
    }
    return rates[from]?[to]
}

func convertCurrency(amount: Double, from: Currency, to: Currency) -> Double? {
    guard let rate = getExchangeRate(from: from, to: to) else {
        return nil
    }
    return amount * rate
}

// пример: Курс не найден (отсуствует значение валюты RUB)
if let result = convertCurrency(amount: 1, from: .USD, to: .RUB) {
    print("Сконвертированная сумма: \(result)")
} else {
    print("Курс не найден")
}

// пример: Курс найден, всё ок
if let result = convertCurrency(amount: 1, from: .USD, to: .BYN) {
    print("Сконвертированная сумма: \(result)")
}
else {
    print("Курс не найден")
}




// MARK: 2 задание
enum Grade: Int {
    case A = 90
    case B = 80
    case C = 70
    case D = 60
    case F = 0
}
    func getLetterGrade(score: Int) ->Grade? {
        guard score >= 0 && score <= 100 else {
            return nil
        }
        switch score {
        case 90...100:
            return .A
        case 80..<90:
            return .B
        case 70..<80:
            return .C
        case 60..<70:
            return .D
        default:
            return .F
            
        }
    }
    
    
func printExamResult(name: String, score: Int)-> String {
    if let grade = getLetterGrade(score: score) {
        return "\(name) получил \(grade) (Балл: \(score))"
    }else {
        return "\(name) получил недопустимый балл: \(score)"
    }
}
    
    
    
// Студенты получили допустимые баллы
print(printExamResult(name: "Денис", score: 90))
print(printExamResult(name: "Виктор", score: 73))
print(printExamResult(name: "Петр", score: 0))

// Студенты получили недопустимые баллы
print(printExamResult(name: "Павел", score: 121))
print(printExamResult(name: "Генадий", score: -1))

