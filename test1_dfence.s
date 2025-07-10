	.file	"test1_dfence.ll"
	.text
	.globl	main                            # -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	movq	secret_data@GOTPCREL(%rip), %rax
	incb	(%rax)
	movq	public_data@GOTPCREL(%rip), %rax
	movzbl	(%rax), %eax
	dfence	%eax
	
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	secret_data,@object             # @secret_data
	.data
	.globl	secret_data
	.p2align	4, 0x0
secret_data:
	.asciz	"SecretValueHere!"
	.size	secret_data, 17

	.type	probe_array,@object             # @probe_array
	.bss
	.globl	probe_array
	.p2align	4, 0x0
probe_array:
	.zero	256
	.size	probe_array, 256

	.type	public_data,@object             # @public_data
	.data
	.globl	public_data
public_data:
	.asciz	"abcdefghijklmno"
	.size	public_data, 16

	.section	".note.GNU-stack","",@progbits
