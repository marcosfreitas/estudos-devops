package main

import "testing"

func TestSum(t *testing.T) {
	result := sum(5,5)
	if result != (5+5) {
		t.Fatalf(`Wrong sum`)
	}
}