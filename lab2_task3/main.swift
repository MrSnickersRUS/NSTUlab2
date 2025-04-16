func countSequences(_ sequence: [Int]) -> Int {
    guard sequence.count >= 2 else { return 0 }
    
    var seqLen = 1
    var seqCount = 0
    
    for i in 0..<sequence.count - 1 {
        if sequence[i+1] >= sequence[i] {
            seqLen += 1
        } else if seqLen > 1 {
            seqCount += 1
            seqLen = 1
        } else {
            seqLen = 1
        }
    }
    
    if seqLen > 1 {
        seqCount += 1
    }
    
    return seqCount
}

print("Введите последовательность чисел через пробел:")
if let input = readLine() {
    let nums = input.split(separator: " ").compactMap { Int($0) }
    print(countSequences(nums))
}