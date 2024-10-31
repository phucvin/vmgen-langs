	.file	"engine.c"
	.text
	.section	.rodata
.LC0:
	.string	"entering engine(%p,%p,%p)\n"
	.text
	.globl	engine
	.type	engine, @function
engine:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$680, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -664(%rbp)
	movq	%rsi, -672(%rbp)
	movq	%rdx, -680(%rbp)
	movq	%fs:40, %rdi
	movq	%rdi, -24(%rbp)
	xorl	%edi, %edi
	movl	vm_debug(%rip), %edx
	testl	%edx, %edx
	je	.L2
	movq	vm_out(%rip), %rax
	movq	-680(%rbp), %rsi
	movq	-672(%rbp), %rcx
	movq	-664(%rbp), %rdx
	movq	%rsi, %r8
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L2:
	cmpq	$0, -664(%rbp)
	jne	.L3
	leaq	labels.2373(%rip), %rax
	movq	%rax, vm_prim(%rip)
	movl	$0, %eax
	jmp	.L40
.L3:
	movq	-672(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -640(%rbp)
	movq	-664(%rbp), %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L6:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-672(%rbp), %rdx
	movq	-640(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	-648(%rbp), %rdx
	movq	%rdx, -80(%rbp)
	movq	-632(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	subq	$8, -672(%rbp)
	movq	-80(%rbp), %rdx
	movq	%rdx, -72(%rbp)
	addq	$8, -632(%rbp)
	movq	-72(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	nop
.L5:
	jmp	*%rdx
.L7:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-672(%rbp), %rdx
	movq	-640(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	-648(%rbp), %rdx
	movq	%rdx, -96(%rbp)
	movq	-632(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	subq	$8, -672(%rbp)
	movq	-96(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rdx
	movq	%rdx, -88(%rbp)
	addq	$8, -632(%rbp)
	movq	-88(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L8:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -112(%rbp)
	movq	-640(%rbp), %rdx
	movq	%rdx, -104(%rbp)
	movq	-632(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	addq	$8, -672(%rbp)
	movq	-112(%rbp), %rdx
	movq	-104(%rbp), %rcx
	movq	%rcx, -64(%rbp,%rdx,8)
	addq	$8, -632(%rbp)
	movq	-672(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L9:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-640(%rbp), %rdx
	movq	%rdx, -136(%rbp)
	subq	$8, -672(%rbp)
	movq	-136(%rbp), %rdx
	movq	%rdx, -128(%rbp)
	movq	-136(%rbp), %rdx
	movq	%rdx, -120(%rbp)
	addq	$8, -632(%rbp)
	movq	-672(%rbp), %rdx
	leaq	8(%rdx), %rcx
	movq	-128(%rbp), %rdx
	movq	%rdx, (%rcx)
	movq	-120(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L10:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-672(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -168(%rbp)
	movq	-640(%rbp), %rdx
	movq	%rdx, -160(%rbp)
	movq	-160(%rbp), %rdx
	movq	%rdx, -152(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rdx, -144(%rbp)
	addq	$8, -632(%rbp)
	movq	-672(%rbp), %rdx
	leaq	8(%rdx), %rcx
	movq	-152(%rbp), %rdx
	movq	%rdx, (%rcx)
	movq	-144(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L11:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-672(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -192(%rbp)
	movq	-640(%rbp), %rdx
	movq	%rdx, -184(%rbp)
	addq	$8, -672(%rbp)
	movq	-192(%rbp), %rcx
	movq	-184(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, -176(%rbp)
	addq	$8, -632(%rbp)
	movq	-176(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L12:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -216(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -208(%rbp)
	movq	-632(%rbp), %rdx
	addq	$16, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -200(%rbp)
	movq	-632(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$24, -632(%rbp)
	movq	-208(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rcx
	movq	-200(%rbp), %rdx
	addq	%rdx, %rcx
	movq	-216(%rbp), %rdx
	movq	%rcx, -64(%rbp,%rdx,8)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L13:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -240(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -232(%rbp)
	movq	-632(%rbp), %rdx
	addq	$16, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -224(%rbp)
	movq	-632(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$24, -632(%rbp)
	movq	-232(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rcx
	movq	-224(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rdx
	addq	%rdx, %rcx
	movq	-240(%rbp), %rdx
	movq	%rcx, -64(%rbp,%rdx,8)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L14:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-672(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -264(%rbp)
	movq	-640(%rbp), %rdx
	movq	%rdx, -256(%rbp)
	addq	$8, -672(%rbp)
	movq	-264(%rbp), %rdx
	subq	-256(%rbp), %rdx
	movq	%rdx, -248(%rbp)
	addq	$8, -632(%rbp)
	movq	-248(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L15:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -288(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -280(%rbp)
	movq	-632(%rbp), %rdx
	addq	$16, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -272(%rbp)
	movq	-632(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$24, -632(%rbp)
	movq	-280(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rdx
	movq	%rdx, %rcx
	subq	-272(%rbp), %rcx
	movq	-288(%rbp), %rdx
	movq	%rcx, -64(%rbp,%rdx,8)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L16:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -312(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -304(%rbp)
	movq	-632(%rbp), %rdx
	addq	$16, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -296(%rbp)
	movq	-632(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$24, -632(%rbp)
	movq	-296(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rdx
	movq	-304(%rbp), %rcx
	subq	%rdx, %rcx
	movq	-312(%rbp), %rdx
	movq	%rcx, -64(%rbp,%rdx,8)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L17:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -336(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -328(%rbp)
	movq	-632(%rbp), %rdx
	addq	$16, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -320(%rbp)
	movq	-632(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$24, -632(%rbp)
	movq	-328(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rcx
	movq	-320(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rdx
	subq	%rdx, %rcx
	movq	-336(%rbp), %rdx
	movq	%rcx, -64(%rbp,%rdx,8)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L18:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-672(%rbp), %rdx
	movq	-640(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	-648(%rbp), %rdx
	movq	%rdx, -352(%rbp)
	movq	-632(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	subq	$8, -672(%rbp)
	movq	-352(%rbp), %rdx
	movq	%rdx, -344(%rbp)
	addq	$8, -632(%rbp)
	movq	-344(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L19:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-672(%rbp), %rdx
	movq	-640(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	-648(%rbp), %rdx
	movq	%rdx, -368(%rbp)
	movq	-632(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	subq	$8, -672(%rbp)
	movq	-368(%rbp), %rcx
	movq	-632(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, -360(%rbp)
	addq	$8, -632(%rbp)
	movq	-360(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L20:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-640(%rbp), %rdx
	movq	%rdx, -376(%rbp)
	addq	$8, -672(%rbp)
	movq	-376(%rbp), %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-672(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L21:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -384(%rbp)
	movq	-632(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-384(%rbp), %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L22:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -392(%rbp)
	movq	-632(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-392(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L23:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -416(%rbp)
	movq	-672(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -408(%rbp)
	movq	-640(%rbp), %rdx
	movq	%rdx, -400(%rbp)
	movq	-632(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	addq	$16, -672(%rbp)
	movq	-408(%rbp), %rdx
	cmpq	-400(%rbp), %rdx
	jge	.L24
	movq	-416(%rbp), %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
.L24:
	addq	$8, -632(%rbp)
	movq	-672(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L25:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -440(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -432(%rbp)
	movq	-632(%rbp), %rdx
	addq	$16, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -424(%rbp)
	movq	-632(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$24, -632(%rbp)
	movq	-432(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rdx
	cmpq	%rdx, -424(%rbp)
	jle	.L26
	movq	-440(%rbp), %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
.L26:
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L27:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-640(%rbp), %rdx
	movq	%rdx, -464(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -456(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -448(%rbp)
	movq	-632(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$16, -632(%rbp)
	addq	$8, -672(%rbp)
	movq	-456(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rdx
	cmpq	%rdx, -448(%rbp)
	jle	.L28
	movq	-464(%rbp), %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
.L28:
	addq	$8, -632(%rbp)
	movq	-672(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L29:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -480(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -472(%rbp)
	movq	-632(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$16, -632(%rbp)
	movq	-480(%rbp), %rdx
	movq	-472(%rbp), %rcx
	movq	%rcx, -64(%rbp,%rdx,8)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L30:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -496(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -488(%rbp)
	movq	-632(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$16, -632(%rbp)
	movq	-488(%rbp), %rdx
	movq	-64(%rbp,%rdx,8), %rcx
	movq	-496(%rbp), %rdx
	movq	%rcx, -64(%rbp,%rdx,8)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L31:
	endbr64
	movq	-632(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -648(%rbp)
	movq	-640(%rbp), %rax
	movq	%rax, -504(%rbp)
	addq	$8, -672(%rbp)
	movq	-504(%rbp), %rax
	jmp	.L40
.L32:
	endbr64
	movq	-632(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -648(%rbp)
	movq	-648(%rbp), %rax
	movq	%rax, -512(%rbp)
	movq	-632(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-512(%rbp), %rax
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L33:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -520(%rbp)
	movq	-632(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-520(%rbp), %rbx
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L34:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-672(%rbp), %rdx
	movq	-640(%rbp), %rcx
	movq	%rcx, (%rdx)
	subq	$8, -672(%rbp)
	movq	%rax, -528(%rbp)
	addq	$8, -632(%rbp)
	movq	-528(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L35:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	%rax, %rax
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L36:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	%rbx, %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L37:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -552(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -544(%rbp)
	movq	-552(%rbp), %rdx
	movq	-544(%rbp), %rcx
	movq	%rcx, -64(%rbp,%rdx,8)
	movq	-632(%rbp), %rdx
	addq	$16, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -536(%rbp)
	movq	-632(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$24, -632(%rbp)
	movq	-536(%rbp), %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L38:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -584(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -576(%rbp)
	movq	-584(%rbp), %rdx
	movq	-576(%rbp), %rcx
	movq	%rcx, -64(%rbp,%rdx,8)
	movq	-632(%rbp), %rdx
	addq	$16, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -568(%rbp)
	movq	-632(%rbp), %rdx
	addq	$24, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -560(%rbp)
	movq	-632(%rbp), %rdx
	movq	32(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$32, -632(%rbp)
	movq	-568(%rbp), %rdx
	movq	-560(%rbp), %rcx
	movq	%rcx, -64(%rbp,%rdx,8)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L39:
	endbr64
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -624(%rbp)
	movq	-632(%rbp), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -616(%rbp)
	movq	-624(%rbp), %rdx
	movq	-616(%rbp), %rcx
	movq	%rcx, -64(%rbp,%rdx,8)
	movq	-632(%rbp), %rdx
	addq	$16, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -608(%rbp)
	movq	-632(%rbp), %rdx
	addq	$24, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -600(%rbp)
	movq	-608(%rbp), %rdx
	movq	-600(%rbp), %rcx
	movq	%rcx, -64(%rbp,%rdx,8)
	movq	-632(%rbp), %rdx
	addq	$32, %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -592(%rbp)
	movq	-632(%rbp), %rdx
	movq	40(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$40, -632(%rbp)
	movq	-592(%rbp), %rdx
	movq	%rdx, -632(%rbp)
	movq	-632(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -648(%rbp)
	addq	$8, -632(%rbp)
	movq	-648(%rbp), %rdx
	jmp	.L5
.L40:
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	addq	$680, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	engine, .-engine
	.section	.data.rel.local,"aw"
	.align 32
	.type	labels.2373, @object
	.size	labels.2373, 248
labels.2373:
	.quad	.L6
	.quad	.L7
	.quad	.L8
	.quad	.L9
	.quad	.L10
	.quad	.L11
	.quad	.L12
	.quad	.L13
	.quad	.L14
	.quad	.L15
	.quad	.L16
	.quad	.L17
	.quad	.L18
	.quad	.L19
	.quad	.L20
	.quad	.L21
	.quad	.L22
	.quad	.L23
	.quad	.L25
	.quad	.L27
	.quad	.L29
	.quad	.L30
	.quad	.L31
	.quad	.L32
	.quad	.L33
	.quad	.L34
	.quad	.L35
	.quad	.L36
	.quad	.L37
	.quad	.L38
	.quad	.L39
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
