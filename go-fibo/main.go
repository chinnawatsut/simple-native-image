package main

import (
	"fmt"
	"time"
)

func main() {
	for i := 0; i < 100000; i++ {
		startTime := time.Now()
		_ = fibonacci(12)
		totalTime := time.Since(startTime)
		fmt.Println(totalTime)
	}
}

func fibonacci(index int) int {
	if index <= 1 {
		return index
	}
	return fibonacci(index-1) + fibonacci(index-2)
}
