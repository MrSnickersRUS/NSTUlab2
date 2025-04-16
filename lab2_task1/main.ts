function checkBoardBounds(n: number, m: number, steps: string): string {
    for (let startX = 1; startX <= n; startX++) {
        for (let startY = 1; startY <= m; startY++) {
            let x = startX, y = startY;
            let isValid = true;
            for (const step of steps) {
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

const [n, m, steps] = require('fs').readFileSync(0, 'utf-8').trim().split('\n');
console.log(checkBoardBounds(parseInt(n), parseInt(m), steps));