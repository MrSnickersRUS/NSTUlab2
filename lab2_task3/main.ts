function countSequences(sequence: number[]): number {
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
    
    const input = prompt("Введите последовательность чисел через пробел: ");
    const nums = input.split(' ').map(Number);
    console.log(countSequences(nums));