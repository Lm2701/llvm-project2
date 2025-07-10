	.file	"test2.ll"
	.text
	.globl	myfunc                          # -- Begin function myfunc
	.p2align	4
	.type	myfunc,@function
myfunc:                                 # @myfunc
	.cfi_startproc
# %bb.0:                                # %entry
	
.Lfunc_end0:
	.size	myfunc, .Lfunc_end0-myfunc
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
	callq	myfunc@PLT
	
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
