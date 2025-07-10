@public_data = global [16 x i8] c"abcdefghijklmno\00"
@secret_data = global [17 x i8] c"SecretValueHere!\00"
@probe_array = global [256 x i8] zeroinitializer

define void @victim(i32 %idx) {
entry:
  %cmp = icmp ult i32 %idx, 16
  br i1 %cmp, label %ok, label %exit

ok:
  %secret_ptr = getelementptr [16 x i8], ptr @public_data, i32 0, i32 %idx
  %val = load i8, ptr %secret_ptr
  %val_i32 = zext i8 %val to i32
  dfence i32 %val_i32
  %probe_ptr = getelementptr [256 x i8], ptr @probe_array, i32 0, i32 %val_i32
  %y = load i8, ptr %probe_ptr
  ret void

exit:
  ret void
}

define void @main() {
entry:
    %ret = call void @victim(i32 17)
    ret void
}