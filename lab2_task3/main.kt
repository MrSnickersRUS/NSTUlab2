fun countSequences(sequence: List<Int>): Int {
    if (sequence.size < 2) return 0
    
    var seqLen = 1
    var seqCount = 0
    
    for (i in 0 until sequence.size - 1) {
        if (sequence[i+1] >= sequence[i]) {
            seqLen++
        } else if (seqLen > 1) {
            seqCount++
            seqLen = 1
        } else {
            seqLen = 1
        }
    }
    
    if (seqLen > 1) seqCount++
    
    return seqCount
}

fun main() {
    println("Введите последовательность чисел через пробел:")
    val nums = readLine()!!.split(" ").map { it.toInt() }
    println(countSequences(nums))
}