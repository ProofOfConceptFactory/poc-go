#!/usr/bin/env bats

setup() {
  # Compile the Go program before running tests
  go build -o hello_test
}

teardown() {
  # Clean up after tests
  rm -f hello_test
}

@test "go program compiles successfully" {
  # Check that the compilation in setup worked
  [ -f "hello_test" ]
}

@test "go program runs successfully" {
  # Run the program and capture output
  run ./hello_test

  # Check that the program executed successfully
  [ "$status" -eq 0 ]
}

@test "go program displays the hello message" {
  # Run the program and capture output
  run ./hello_test

  # Verify that the output contains exactly the expected message
  [ "$output" = "Hello from Go!👋" ]
}
