	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_zmmul1p0_zaamo1p0_zalrsc1p0"
	.file	"test1_dfence.ll"
	.text
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	lui	a0, %hi(secret_data)
	lbu	a1, %lo(secret_data)(a0)
	lui	a2, %hi(public_data)
	lbu	a2, %lo(public_data)(a2)
	addi	a1, a1, 1
	sb	a1, %lo(secret_data)(a0)
	dfence	a0, a2

	ret
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
