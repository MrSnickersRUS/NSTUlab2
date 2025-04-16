function countSequences(sequence) {
    if (sequence.length < 2) return 0;
    
    let seqLen = 1;
    let seqCount = 0;
    
    for (let i = 0; i < sequence.length - 1; i++) {
        if (sequence[i+1] >= sequence[i]) {
            seqLen++;
        } else if (seqLen > 1) {
            seqCount++;
            seqLen = 1;
        } else {
            seqLen = 1;
        }
    }
    
    if (seqLen > 1) seqCount++;
    
    return seqCount;
}

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Введите последовательность чисел через пробел: ', (input) => {
    const nums = input.split(' ').map(Number);
    console.log(countSequences(nums));
    rl.close();
});