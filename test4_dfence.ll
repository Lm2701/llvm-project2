@secret_data = global [16 x i8] c"SecretValueHere!\00"
@probe_array = global [256 x i8] zeroinitializer

define void @main() { 
entry: 
    %secret_ptr = getelementptr [16 x i8], ptr @secret_data, i32 0, i32 0
    store i8 0, ptr %secret_ptr
    %x = load i8, ptr %secret_ptr
    %x_i32 = zext i8 %x to i32
    dfence i32 %x_i32
    %probe_ptr = getelementptr [256 x i8], ptr @probe_array, i32 0, i32 %x_i32
    %y = load i8, ptr %probe_ptr
    ret void 
}