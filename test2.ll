define i32 @myfunc() {
entry:
  ret i32 42
}


define i32 @main() {
entry:
  %result = call i32 @myfunc()
  ret i32 %result
}
