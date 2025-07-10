@secret_data = global [17 x i8] c"SecretValueHere!\00"
@probe_array = global [256 x i8] zeroinitializer
@public_data = global [16 x i8] c"abcdefghijklmno\00"

define i8 @main(){
    entry:
        %secret_ptr = getelementptr [16 x i8], ptr @secret_data, i32 0, i32 0
        %val1 = load i8, ptr %secret_ptr
        %val2 = add i8 %val1, 1
        store i8 %val2, ptr %secret_ptr
        %public_ptr = getelementptr [256 x i8], ptr @public_data, i32 0, i32 0
        %x = load ptr, ptr %public_ptr
        ;%x_i32 = zext i8 %x to i32
        ;%probe_ptr = getelementptr [256 x i8], ptr @probe_array, i32 0, i32 %x_i32
        ;%y = load i8, ptr %probe_ptr
        %y = load i8, ptr %x
        ret i8 %y
}

