function checkBoardBounds(n, m, steps) {
    for (let startX = 1; startX <= n; startX++) {
    for (let startY = 1; startY <= m; startY++) {
    let x = startX, y = startY;
    let isValid = true;
    for (let step of steps) {
    switch (step) {
    case 'L': x--; break;
    case 'R': x++; break;
    case 'D': y--; break;
    case 'U': y++; break;
    default: return "Ошибка в ходах";
    }
    if (x < 1 || x > n || y < 1 || y > m) {
    isValid = false;
    break;
    }
    }
    if (isValid) return `(${startX},${startY})`;
    }
    }
    return "No";
    }
    
    const readline = require('readline');
    const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
    });
    
    rl.question('Введите длину доски: ', n => {
    rl.question('Введите ширину доски: ', m => {
    rl.question('Введите ходы для фигуры (LRDU): ', steps => {
    console.log(checkBoardBounds(n, m, steps));
    rl.close();
    });
    });
    });