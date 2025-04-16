function countValidEmails(emails: string[]): number {
    const validEmails = new Set<string>();
    const pattern = /^([a-zA-Z0-9\.]{6,30})(\*[a-zA-Z0-9\.]*)?@([a-zA-Z0-9\-\.]+)$/;
    
    for (const email of emails) {
        const match = email.match(pattern);
        if (!match) {
            console.log(`Неверная почта: ${email}`);
            continue;
        }
        
        const username = match[1];
        const domain = match[3];
        
        if (username.startsWith('.') || username.endsWith('.') || username.includes('..')) {
            console.log(`Лишние точки в имени: ${email}`);
            continue;
        }
        
        if (domain.startsWith('.') || domain.endsWith('.') || domain.includes('..')) {
            console.log(`Лишние точки в домене: ${email}`);
            continue;
        }
        
        let cleanUsername = username.replace(/\./g, '');
        if (cleanUsername.includes('*')) {
            cleanUsername = cleanUsername.split('*')[0];
            if (cleanUsername.length < 6) {
                console.log(`Имя пользователя слишком короткое: ${email}`);
                continue;
            }
        }
        
        validEmails.add(`${cleanUsername}@${domain}`);
    }
    
    return validEmails.size;
}

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Введите адреса почт через пробел: ', (input: string) => {
    const emails = input.split(' ').filter(Boolean);
    console.log(`Количество уникальных адресов: ${countValidEmails(emails)}`);
    rl.close();
});