fun checkBoardBounds(n: Int, m: Int, steps: String): String {
    var startX = 1
    while (startX <= n) {
        var startY = 1
        while (startY <= m) {
            var x = startX
            var y = startY
            var isValid = true
            var i = 0
            while (i < steps.length && isValid) {
                val step = steps[i]
                when (step) {
                    'L' -> x -= 1
                    'R' -> x += 1
                    'D' -> y -= 1
                    'U' -> y += 1
                    else -> return "Ошибка в ходах"
                }
                if (x < 1 || x > n || y < 1 || y > m) {
                    isValid = false
                }
                i += 1
            }
            if (isValid) {
                return "($startX,$startY)"
            }
            startY += 1
        }
        startX += 1
    }
    return "No"
}

fun main() {
    val n = readLine()!!.toInt()
    val m = readLine()!!.toInt()
    val steps = readLine()!!.trim()
    println(checkBoardBounds(n, m, steps))
}