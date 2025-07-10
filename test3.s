	.file	"test3.ll"
	.text
	.globl	victim                          # -- Begin function victim
	.p2align	4
	.type	victim,@function
victim:                                 # @victim
	.cfi_startproc
# %bb.0:                                # %entry
	cmpl	$15, %edi
	retq
.Lfunc_end0:
	.size	victim, .Lfunc_end0-victim
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$17, %edi
	callq	victim@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	public_data,@object             # @public_data
	.data
	.globl	public_data
public_data:
	.asciz	"abcdefghijklmno"
	.size	public_data, 16

	.type	secret_data,@object             # @secret_data
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

	.section	".note.GNU-stack","",@progbits
