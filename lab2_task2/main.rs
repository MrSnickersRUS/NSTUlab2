use std::collections::HashSet;
use std::io;

fn is_valid_email(email: &str) -> Option<(String, String)> {
    let parts: Vec<&str> = email.split('@').collect();
    if parts.len() != 2 {
        println!("Неверный формат email: отсутствует @ в {}", email);
        return None;
    }
    
    let (username, domain) = (parts[0], parts[1]);
    
    // Проверки имени пользователя
    if username.len() < 6 || username.len() > 30 {
        println!("Имя пользователя должно быть от 6 до 30 символов в {}", email);
        return None;
    }
    
    if username.starts_with('.') || username.ends_with('.') || username.contains("..") {
        println!("Недопустимое расположение точек в имени пользователя в {}", email);
        return None;
    }
    
    for c in username.chars() {
        if !(c.is_ascii_alphanumeric() || c == '.' || c == '*') {
            println!("Недопустимый символ '{}' в имени пользователя в {}", c, email);
            return None;
        }
    }
    
    // Проверки домена
    if domain.is_empty() || domain.starts_with('.') || domain.ends_with('.') || domain.contains("..") {
        println!("Недопустимое расположение точек в домене в {}", email);
        return None;
    }
    
    for c in domain.chars() {
        if !(c.is_ascii_alphanumeric() || c == '.' || c == '-') {
            println!("Недопустимый символ '{}' в домене в {}", c, email);
            return None;
        }
    }
    
    // Обработка звездочки в имени пользователя
    let clean_username = username.replace('.', "");
    let final_username = if clean_username.contains('*') {
        let parts: Vec<&str> = clean_username.split('*').collect();
        if parts[0].len() < 6 {
            println!("Имя пользователя слишком короткое после обработки в {}", email);
            return None;
        }
        parts[0].to_string()
    } else {
        clean_username
    };
    
    Some((final_username, domain.to_string()))
}

fn count_valid_emails(emails: &[&str]) -> usize {
    let mut valid_emails = HashSet::new();
    
    for email in emails {
        if let Some((user, domain)) = is_valid_email(email) {
            valid_emails.insert(format!("{}@{}", user, domain));
        }
    }
    
    valid_emails.len()
}

fn main() {
    println!("Введите адреса почт через пробел:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Ошибка чтения ввода");
    
    let emails: Vec<&str> = input.trim().split_whitespace().collect();
    let count = count_valid_emails(&emails);
    
    println!("Количество уникальных адресов: {}", count);
}