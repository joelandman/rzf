package main

import (
	"fmt"
)

func main() {
	var sum, r float64
	var N int64

	sum = 0.0
	N = 16000000000
	for i := N; i >= 1; i-- {
		r = 1.0 / float64(i)
		sum += r * r
	}
	fmt.Printf("zeta(2) = %18.15f\n", sum)

}
