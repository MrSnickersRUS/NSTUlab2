package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func countSequences(sequence []int) int {
	if len(sequence) < 2 {
		return 0
	}

	seqLen := 1
	seqCount := 0

	for i := 0; i < len(sequence)-1; i++ {
		if sequence[i+1] >= sequence[i] {
			seqLen++
		} else if seqLen > 1 {
			seqCount++
			seqLen = 1
		} else {
			seqLen = 1
		}
	}

	if seqLen > 1 {
		seqCount++
	}

	return seqCount
}

func main() {
	reader := bufio.NewReader(os.Stdin)
	fmt.Println("Введите последовательность чисел через пробел:")
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)
	parts := strings.Split(input, " ")
	
	var nums []int
	for _, s := range parts {
		num, _ := strconv.Atoi(s)
		nums = append(nums, num)
	}

	fmt.Println(countSequences(nums))
}