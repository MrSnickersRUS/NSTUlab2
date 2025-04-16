package main

import "fmt"

func checkBoardBounds(n, m int, steps string) string {
    for startX := 1; startX <= n; startX++ {
        for startY := 1; startY <= m; startY++ {
            x, y := startX, startY
            isValid := true
            for _, step := range steps {
                switch step {
                case 'L': x--
                case 'R': x++
                case 'D': y--
                case 'U': y++
                default: return "Ошибка в ходах"
                }
                if x < 1 || x > n || y < 1 || y > m {
                    isValid = false
                    break
                }
            }
            if isValid {
                return fmt.Sprintf("(%d,%d)", startX, startY)
            }
        }
    }
    return "No"
}

func main() {
    var n, m int
    var steps string
    fmt.Scan(&n, &m, &steps)
    fmt.Println(checkBoardBounds(n, m, steps))
}