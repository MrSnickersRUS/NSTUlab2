import Foundation

func countValidEmails(_ emails: [String]) -> Int {
    var validEmails = Set<String>()
    let pattern = try! NSRegularExpression(pattern: "^([a-zA-Z0-9\\.]{6,30})(\\*[a-zA-Z0-9\\.]*)?@([a-zA-Z0-9\\-\\.]+)$")
    
    for email in emails {
        let range = NSRange(location: 0, length: email.utf16.count)
        guard let match = pattern.firstMatch(in: email, options: [], range: range),
              let usernameRange = Range(match.range(at: 1), in: email),
              let domainRange = Range(match.range(at: 3), in: email) else {
            print("Неверная почта: \(email)")
            continue
        }
        
        let username = String(email[usernameRange])
        let domain = String(email[domainRange])
        
        if username.hasPrefix(".") || username.hasSuffix(".") || username.contains("..") {
            print("Лишние точки в имени: \(email)")
            continue
        }
        
        if domain.hasPrefix(".") || domain.hasSuffix(".") || domain.contains("..") {
            print("Лишние точки в домене: \(email)")
            continue
        }
        
        var cleanUsername = username.replacingOccurrences(of: ".", with: "")
        if cleanUsername.contains("*") {
            let parts = cleanUsername.components(separatedBy: "*")
            cleanUsername = parts[0]
            if cleanUsername.count < 6 {
                print("Имя пользователя слишком короткое: \(email)")
                continue
            }
        }
        
        validEmails.insert("\(cleanUsername)@\(domain)")
    }
    
    return validEmails.count
}

print("Введите адреса почт через пробел:", terminator: " ")
guard let input = readLine() else { exit(0) }
let emails = input.components(separatedBy: " ").filter { !$0.isEmpty }
print("Количество уникальных адресов: \(countValidEmails(emails))")