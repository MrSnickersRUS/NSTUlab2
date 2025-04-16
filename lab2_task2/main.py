import re

def countValidEmails(emails):
    valid_emails = set()
    pattern = re.compile(r'^([a-zA-Z0-9\.]{6,30})(\*[a-zA-Z0-9\.]*)?@([a-zA-Z0-9\-\.]+)$')
    
    for email in emails:
        match = pattern.fullmatch(email)
        if not match:
            print(f"Неверная почта: {email}")
            continue
            
        username, domain = match.group(1), match.group(3)
        
        if username.startswith('.') or username.endswith('.') or '..' in username:
            print(f"Лишние точки в имени: {email}")
            continue
            
        if domain.startswith('.') or domain.endswith('.') or '..' in domain:
            print(f"Лишние точки в домене: {email}")
            continue
            
        clean_username = username.replace('.', '')
        if '*' in clean_username:
            clean_username = clean_username.split('*')[0]
            if len(clean_username) < 6:
                print(f"Имя пользователя слишком короткое: {email}")
                continue
                
        valid_emails.add(f"{clean_username}@{domain}")
    
    return len(valid_emails)

emails = input("Введите адреса почт через пробел: ").split()
print(f"Количество уникальных адресов: {countValidEmails(emails)}")