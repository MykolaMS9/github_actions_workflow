#!/usr/bin/env bats

setup() {
  rm -f /usr/local/bin/hello
}

teardown() {
  rm -f /usr/local/bin/hello
}

@test "інсталює hello у /usr/local/bin" {
  run bash -lc 'source scripts/hello_install.sh; hello_install'
  [ "$status" -eq 0 ]
  run which hello
  [ "$status" -eq 0 ]
}

@test "hello друкує очікуваний текст" {
  run bash -lc 'source scripts/hello_install.sh; hello_install'
  [ "$status" -eq 0 ]
  run hello
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, world!" ]
}

@test "ідемпотентність: повторний запуск не падає" {
  run bash -lc 'source scripts/hello_install.sh; hello_install'
  [ "$status" -eq 0 ]
  run bash -lc 'source scripts/hello_install.sh; hello_install'
  [ "$status" -eq 0 ]
}
