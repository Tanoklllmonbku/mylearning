	.file	"calculator.c"
	.text
	.globl	char_ops
	.data
	.type	char_ops, @object
	.size	char_ops, 4
char_ops:
	.byte	43
	.byte	45
	.byte	47
	.byte	42
	.text
	.globl	delete_spaces
	.type	delete_spaces, @function
delete_spaces:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L2
.L4:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L3
	movq	-16(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	addq	$1, -8(%rbp)
.L3:
	addq	$1, -16(%rbp)
.L2:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L4
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	delete_spaces, .-delete_spaces
	.type	skip_spaces, @function
skip_spaces:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	jmp	.L6
.L7:
	addl	$1, -12(%rbp)
.L6:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L7
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	je	.L7
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	skip_spaces, .-skip_spaces
	.type	parse_tokens, @function
parse_tokens:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -4(%rbp)
	jmp	.L10
.L21:
	movl	-16(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	skip_spaces
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.L23
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -17(%rbp)
	cmpb	$40, -17(%rbp)
	je	.L13
	cmpb	$41, -17(%rbp)
	jne	.L14
.L13:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, (%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-17(%rbp), %eax
	movb	%al, 8(%rdx)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 4(%rax)
	addl	$1, -12(%rbp)
	addl	$1, -16(%rbp)
	jmp	.L10
.L14:
	cmpb	$43, -17(%rbp)
	je	.L15
	cmpb	$45, -17(%rbp)
	je	.L15
	cmpb	$42, -17(%rbp)
	je	.L15
	cmpb	$47, -17(%rbp)
	jne	.L16
.L15:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, (%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-17(%rbp), %eax
	movb	%al, 8(%rdx)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 4(%rax)
	addl	$1, -12(%rbp)
	addl	$1, -16(%rbp)
	jmp	.L10
.L16:
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movsbq	-17(%rbp), %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	je	.L17
	movl	$0, -8(%rbp)
	jmp	.L18
.L20:
	movl	-8(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %ecx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	addl	%ecx, %eax
	movl	%eax, -8(%rbp)
	addl	$1, -16(%rbp)
.L18:
	movl	-16(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.L19
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	movsbq	%dl, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	jne	.L20
.L19:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	movl	%eax, 4(%rdx)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, 8(%rax)
	addl	$1, -12(%rbp)
	jmp	.L10
.L17:
	addl	$1, -16(%rbp)
.L10:
	movl	-16(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.L12
	movl	-12(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L21
	jmp	.L12
.L23:
	nop
.L12:
	movl	-12(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	parse_tokens, .-parse_tokens
	.type	handle_unary_minus, @function
handle_unary_minus:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	%rdx, -56(%rbp)
	movl	$0, -20(%rbp)
	movb	$1, -21(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L25
.L32:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	%rdx, -12(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	jne	.L26
	movzbl	-4(%rbp), %eax
	cmpb	$45, %al
	jne	.L26
	cmpb	$0, -21(%rbp)
	je	.L26
	movl	-16(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -44(%rbp)
	jle	.L26
	movl	-16(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L26
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	movl	-16(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %ecx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	negl	%ecx
	movl	%ecx, %edx
	movl	%edx, 4(%rax)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, 8(%rax)
	addl	$1, -20(%rbp)
	addl	$1, -16(%rbp)
	movb	$0, -21(%rbp)
	jmp	.L27
.L26:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	-12(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	-4(%rbp), %edx
	movl	%edx, 8(%rax)
	addl	$1, -20(%rbp)
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	je	.L28
	movzbl	-4(%rbp), %eax
	cmpb	$41, %al
	jne	.L29
.L28:
	movb	$0, -21(%rbp)
	jmp	.L27
.L29:
	movzbl	-4(%rbp), %eax
	cmpb	$40, %al
	je	.L31
	movzbl	-4(%rbp), %eax
	cmpb	$43, %al
	je	.L31
	movzbl	-4(%rbp), %eax
	cmpb	$45, %al
	je	.L31
	movzbl	-4(%rbp), %eax
	cmpb	$42, %al
	je	.L31
	movzbl	-4(%rbp), %eax
	cmpb	$47, %al
	jne	.L27
.L31:
	movb	$1, -21(%rbp)
.L27:
	addl	$1, -16(%rbp)
.L25:
	movl	-16(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L32
	movl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	handle_unary_minus, .-handle_unary_minus
	.type	find_matching_paren, @function
find_matching_paren:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	$1, -8(%rbp)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L35
.L39:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L36
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	8(%rax), %eax
	cmpb	$40, %al
	jne	.L37
	addl	$1, -8(%rbp)
	jmp	.L36
.L37:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	8(%rax), %eax
	cmpb	$41, %al
	jne	.L36
	subl	$1, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jne	.L36
	movl	-4(%rbp), %eax
	jmp	.L38
.L36:
	addl	$1, -4(%rbp)
.L35:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L39
	movl	$-1, %eax
.L38:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	find_matching_paren, .-find_matching_paren
	.type	find_deepest_paren, @function
find_deepest_paren:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$-1, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L41
.L44:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L42
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	8(%rax), %eax
	cmpb	$40, %al
	jne	.L43
	addl	$1, -12(%rbp)
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jle	.L42
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L42
.L43:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	8(%rax), %eax
	cmpb	$41, %al
	jne	.L42
	subl	$1, -12(%rbp)
.L42:
	addl	$1, -4(%rbp)
.L41:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L44
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	find_deepest_paren, .-find_deepest_paren
	.type	evaluate_simple, @function
evaluate_simple:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$560, %rsp
	movq	%rdi, -552(%rbp)
	movl	%esi, -556(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$0, -556(%rbp)
	jne	.L47
	movl	$0, %eax
	jmp	.L67
.L47:
	cmpl	$1, -556(%rbp)
	jne	.L49
	movq	-552(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L49
	movq	-552(%rbp), %rax
	movl	4(%rax), %eax
	jmp	.L67
.L49:
	movl	$0, -536(%rbp)
	movl	$0, -532(%rbp)
	movq	-552(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L50
	movl	-536(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -536(%rbp)
	movq	-552(%rbp), %rdx
	movl	4(%rdx), %edx
	cltq
	movl	%edx, -512(%rbp,%rax,4)
.L50:
	movl	$1, -528(%rbp)
	jmp	.L51
.L61:
	movl	-528(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-552(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L52
	movl	-528(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-552(%rbp), %rax
	addq	%rdx, %rax
	movzbl	8(%rax), %eax
	movb	%al, -537(%rbp)
	cmpb	$42, -537(%rbp)
	je	.L53
	cmpb	$47, -537(%rbp)
	jne	.L54
.L53:
	cmpl	$0, -536(%rbp)
	jle	.L69
	movl	-528(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -556(%rbp)
	jle	.L69
	movl	-528(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-552(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L69
	movl	-528(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-552(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	movl	%eax, -516(%rbp)
	cmpb	$42, -537(%rbp)
	jne	.L56
	movl	-536(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-512(%rbp,%rax,4), %eax
	movl	-536(%rbp), %edx
	leal	-1(%rdx), %ecx
	imull	-516(%rbp), %eax
	movl	%eax, %edx
	movslq	%ecx, %rax
	movl	%edx, -512(%rbp,%rax,4)
	jmp	.L57
.L56:
	cmpl	$0, -516(%rbp)
	je	.L57
	movl	-536(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-512(%rbp,%rax,4), %eax
	movl	-536(%rbp), %edx
	leal	-1(%rdx), %ecx
	cltd
	idivl	-516(%rbp)
	movl	%eax, %edx
	movslq	%ecx, %rax
	movl	%edx, -512(%rbp,%rax,4)
.L57:
	addl	$1, -528(%rbp)
	jmp	.L69
.L54:
	cmpb	$43, -537(%rbp)
	je	.L59
	cmpb	$45, -537(%rbp)
	jne	.L60
.L59:
	movl	-532(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -532(%rbp)
	cltq
	movzbl	-537(%rbp), %edx
	movb	%dl, -112(%rbp,%rax)
	movl	-528(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -556(%rbp)
	jle	.L60
	movl	-528(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-552(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L60
	movl	-528(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-552(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-536(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -536(%rbp)
	movl	4(%rcx), %edx
	cltq
	movl	%edx, -512(%rbp,%rax,4)
	addl	$1, -528(%rbp)
	jmp	.L60
.L52:
	movl	-528(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-552(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L60
	movl	-528(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-552(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-536(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -536(%rbp)
	movl	4(%rcx), %edx
	cltq
	movl	%edx, -512(%rbp,%rax,4)
	jmp	.L60
.L69:
	nop
.L60:
	addl	$1, -528(%rbp)
.L51:
	movl	-528(%rbp), %eax
	cmpl	-556(%rbp), %eax
	jl	.L61
	movl	-512(%rbp), %eax
	movl	%eax, -524(%rbp)
	movl	$0, -520(%rbp)
	jmp	.L62
.L66:
	movl	-520(%rbp), %eax
	cltq
	movzbl	-112(%rbp,%rax), %eax
	cmpb	$43, %al
	jne	.L63
	movl	-520(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-512(%rbp,%rax,4), %edx
	movl	-524(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	__SUM@PLT
	movl	%eax, -524(%rbp)
	jmp	.L64
.L63:
	movl	-520(%rbp), %eax
	cltq
	movzbl	-112(%rbp,%rax), %eax
	cmpb	$45, %al
	jne	.L64
	movl	-520(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-512(%rbp,%rax,4), %eax
	subl	%eax, -524(%rbp)
.L64:
	addl	$1, -520(%rbp)
.L62:
	movl	-520(%rbp), %eax
	cmpl	-532(%rbp), %eax
	jge	.L65
	movl	-520(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -536(%rbp)
	jg	.L66
.L65:
	movl	-524(%rbp), %eax
.L67:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L68
	call	__stack_chk_fail@PLT
.L68:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	evaluate_simple, .-evaluate_simple
	.globl	get_result
	.type	get_result, @function
get_result:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4864, %rsp
	movq	%rdi, -4856(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-4800(%rbp), %rcx
	movq	-4856(%rbp), %rax
	movl	$99, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_tokens
	movl	%eax, -4840(%rbp)
	leaq	-3600(%rbp), %rdx
	movl	-4840(%rbp), %ecx
	leaq	-4800(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	handle_unary_minus
	movl	%eax, -4840(%rbp)
.L82:
	movl	-4840(%rbp), %edx
	leaq	-3600(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	find_deepest_paren
	movl	%eax, -4812(%rbp)
	cmpl	$-1, -4812(%rbp)
	je	.L85
	movl	-4812(%rbp), %edx
	movl	-4840(%rbp), %ecx
	leaq	-3600(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	find_matching_paren
	movl	%eax, -4808(%rbp)
	cmpl	$-1, -4808(%rbp)
	je	.L86
	movl	$0, -4836(%rbp)
	movl	-4812(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4832(%rbp)
	jmp	.L74
.L75:
	movl	-4836(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4836(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	leaq	-2400(%rax), %rdx
	movl	-4832(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$3600, %rax
	movq	(%rax), %rcx
	movq	%rcx, (%rdx)
	movl	8(%rax), %eax
	movl	%eax, 8(%rdx)
	addl	$1, -4832(%rbp)
.L74:
	movl	-4832(%rbp), %eax
	cmpl	-4808(%rbp), %eax
	jl	.L75
	movl	-4836(%rbp), %edx
	leaq	-2400(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	evaluate_simple
	movl	%eax, -4804(%rbp)
	movl	$0, -4828(%rbp)
	movl	$0, -4824(%rbp)
	jmp	.L76
.L77:
	movl	-4828(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4828(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	leaq	-1200(%rax), %rdx
	movl	-4824(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$3600, %rax
	movq	(%rax), %rcx
	movq	%rcx, (%rdx)
	movl	8(%rax), %eax
	movl	%eax, 8(%rdx)
	addl	$1, -4824(%rbp)
.L76:
	movl	-4824(%rbp), %eax
	cmpl	-4812(%rbp), %eax
	jl	.L77
	movl	-4828(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1200, %rax
	movl	$0, (%rax)
	movl	-4828(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	leaq	-1196(%rax), %rdx
	movl	-4804(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-4828(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1192, %rax
	movb	$0, (%rax)
	addl	$1, -4828(%rbp)
	movl	-4808(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4820(%rbp)
	jmp	.L78
.L79:
	movl	-4828(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4828(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	leaq	-1200(%rax), %rdx
	movl	-4820(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$3600, %rax
	movq	(%rax), %rcx
	movq	%rcx, (%rdx)
	movl	8(%rax), %eax
	movl	%eax, 8(%rdx)
	addl	$1, -4820(%rbp)
.L78:
	movl	-4820(%rbp), %eax
	cmpl	-4840(%rbp), %eax
	jl	.L79
	movl	$0, -4816(%rbp)
	jmp	.L80
.L81:
	movl	-4816(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	leaq	-3600(%rax), %rdx
	movl	-4816(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1200, %rax
	movq	(%rax), %rcx
	movq	%rcx, (%rdx)
	movl	8(%rax), %eax
	movl	%eax, 8(%rdx)
	addl	$1, -4816(%rbp)
.L80:
	movl	-4816(%rbp), %eax
	cmpl	-4828(%rbp), %eax
	jl	.L81
	movl	-4828(%rbp), %eax
	movl	%eax, -4840(%rbp)
	jmp	.L82
.L85:
	nop
	jmp	.L72
.L86:
	nop
.L72:
	movl	-4840(%rbp), %edx
	leaq	-3600(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	evaluate_simple
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L84
	call	__stack_chk_fail@PLT
.L84:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	get_result, .-get_result
	.globl	scan_input
	.type	scan_input, @function
scan_input:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	stdin(%rip), %rdx
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jle	.L89
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L89
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
.L89:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	scan_input, .-scan_input
	.section	.rodata
.LC0:
	.string	"Enter the expression:"
.LC1:
	.string	"Result: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L91:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-112(%rbp), %rax
	movl	$100, %esi
	movq	%rax, %rdi
	call	scan_input
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	delete_spaces
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	get_result
	movl	%eax, -116(%rbp)
	movl	-116(%rbp), %eax
	leaq	.LC1(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L91
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20260103"
	.section	.note.GNU-stack,"",@progbits
