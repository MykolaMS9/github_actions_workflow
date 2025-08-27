#!/usr/bin/env bats

setup() {
  ./scripts/install-hello.sh
}

@test "hello binary exists" {
  run which hello
  [ "$status" -eq 0 ]
}

@test "hello prints expected text" {
  run hello
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, world!" ]
}
