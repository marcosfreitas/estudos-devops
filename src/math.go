package main

import "fmt"

func sum(a int, b int) int {
	return a+b
}

func main() {
	result := sum(5,5)
	fmt.Println("5+5 = ", result)
}
