import java.util.regex.Pattern

fun countValidEmails(emails: List<String>): Int {
    val validEmails = mutableSetOf<String>()
    val pattern = Pattern.compile("^([a-zA-Z0-9\\.]{6,30})(\\*[a-zA-Z0-9\\.]*)?@([a-zA-Z0-9\\-\\.]+)$")
    
    emailLoop@ for (email in emails) {
        val matcher = pattern.matcher(email)
        if (!matcher.matches()) {
            println("Неверная почта: $email")
            continue
        }
        
        val username = matcher.group(1)
        val domain = matcher.group(3)
        
        if (username.startsWith(".") || username.endsWith(".") || username.contains("..")) {
            println("Лишние точки в имени: $email")
            continue
        }
        
        if (domain.startsWith(".") || domain.endsWith(".") || domain.contains("..")) {
            println("Лишние точки в домене: $email")
            continue
        }
        
        val cleanUsername = username.replace(".", "")
        val finalUsername = if (cleanUsername.contains("*")) {
            val parts = cleanUsername.split("*")
            if (parts[0].length < 6) {
                println("Имя пользователя слишком короткое: $email")
                continue@emailLoop
            }
            parts[0]
        } else {
            cleanUsername
        }
        
        validEmails.add("$finalUsername@$domain")
    }
    
    return validEmails.size
}

fun main() {
    print("Введите адреса почт через пробел: ")
    val emails = readLine()?.split(" ") ?: emptyList()
    println("Количество уникальных адресов: ${countValidEmails(emails)}")
}