	.file "gcm-hash8.asm"
	.text
	.align 16
.globl _nettle_gcm_hash8
.def _nettle_gcm_hash8
.scl 2
.type 32
.endef
_nettle_gcm_hash8:
        push	%rdi
      mov	%rcx, %rdi
            push	%rsi
      mov	%rdx, %rsi
      mov	%r8, %rdx
      mov	%r9, %rcx
	push	%rbx
	push	%rbp
	push	%r12
	push	%r13
	sub	$16, %rdx
	lea	.Lshift_table(%rip), %r13
	mov	(%rsi), %rax
	mov	8(%rsi), %rbx
	jc	.Lfinal
.align 16
.Lblock_loop:
	xor (%rcx), %rax
	xor 8(%rcx), %rbx
.Lblock_mul:
	rol	$8, %rbx
	movzbl	%bl, %r9d
	shl	$4, %r9
	mov	(%rdi, %r9), %r11
	mov	8(%rdi, %r9), %r12
	mov	$7, %ebp
.align 16
.Loop_X1:
	mov	%r12, %r9
	shr	$56, %r9
	shl	$8, %r12
	mov	%r11, %r8
	shl	$8, %r11
	shr	$56, %r8
	movzwl	(%r13, %r9, 2), %r9d
	xor	%r9, %r11
	rol	$8, %rbx
	movzbl	%bl, %r10d
	shl	$4, %r10
	xor	(%rdi, %r10), %r11
	add	%r8, %r12
	xor	8(%rdi, %r10), %r12
	decl	%ebp
	jne	.Loop_X1
	mov	$7, %ebp
.align 16
.Loop_X0:
	mov	%r12, %r9
	shr	$56, %r9
	shl	$8, %r12
	mov	%r11, %r8
	shl	$8, %r11
	shr	$56, %r8
	movzwl	(%r13, %r9, 2), %r9d
	xor	%r9, %r11
	rol	$8, %rax
	movzbl	%al, %r10d
	shl	$4, %r10
	xor	(%rdi, %r10), %r11
	add	%r8, %r12
	xor	8(%rdi, %r10), %r12
	decl	%ebp
	jne	.Loop_X0
	mov	%r12, %r9
	shr	$56, %r9
	shl	$8, %r12
	mov	%r11, %r8
	shl	$8, %r11
	shr	$56, %r8
	movzwl	(%r13, %r9, 2), %r9d
	xor	%r9, %r11
	rol	$8, %rax
	movzbl	%al, %r10d
	shl	$4, %r10
	mov	(%rdi, %r10), %rax
	xor	%r11, %rax
	add	%r8, %r12
	mov	8(%rdi, %r10), %rbx
	xor	%r12, %rbx
	add	$16, %rcx
	sub	$16, %rdx
	jnc	.Lblock_loop
.Lfinal:
	add	$16, %rdx
	jnz	.Lpartial
	mov	%rax, (%rsi)
	mov	%rbx, 8(%rsi)
	pop	%r13
	pop	%r12
	pop	%rbp
	pop	%rbx
      pop	%rsi
    pop	%rdi
	ret
.Lpartial:
	cmp	$8, %rdx
	jc	.Llt8
	xor	(%rcx), %rax
	add	$8, %rcx
	sub	$8, %rdx
	jz	.Lblock_mul
	call	.Lread_bytes
	xor	%r8, %rbx
	jmp	.Lblock_mul
.Llt8:
	call	.Lread_bytes
	xor	%r8, %rax
	jmp	.Lblock_mul
.Lread_bytes:
	xor	%r8, %r8
	sub	$1, %rcx
.align 16
.Lread_loop:
	shl	$8, %r8
	orb	(%rcx, %rdx), %r8b
.Lread_next:
	sub	$1, %rdx
	jnz	.Lread_loop
	ret
	.section .rodata
	.align 2
.Lshift_table:
.value 0x0000,0xc201,0x8403,0x4602,0x0807,0xca06,0x8c04,0x4e05
.value 0x100e,0xd20f,0x940d,0x560c,0x1809,0xda08,0x9c0a,0x5e0b
.value 0x201c,0xe21d,0xa41f,0x661e,0x281b,0xea1a,0xac18,0x6e19
.value 0x3012,0xf213,0xb411,0x7610,0x3815,0xfa14,0xbc16,0x7e17
.value 0x4038,0x8239,0xc43b,0x063a,0x483f,0x8a3e,0xcc3c,0x0e3d
.value 0x5036,0x9237,0xd435,0x1634,0x5831,0x9a30,0xdc32,0x1e33
.value 0x6024,0xa225,0xe427,0x2626,0x6823,0xaa22,0xec20,0x2e21
.value 0x702a,0xb22b,0xf429,0x3628,0x782d,0xba2c,0xfc2e,0x3e2f
.value 0x8070,0x4271,0x0473,0xc672,0x8877,0x4a76,0x0c74,0xce75
.value 0x907e,0x527f,0x147d,0xd67c,0x9879,0x5a78,0x1c7a,0xde7b
.value 0xa06c,0x626d,0x246f,0xe66e,0xa86b,0x6a6a,0x2c68,0xee69
.value 0xb062,0x7263,0x3461,0xf660,0xb865,0x7a64,0x3c66,0xfe67
.value 0xc048,0x0249,0x444b,0x864a,0xc84f,0x0a4e,0x4c4c,0x8e4d
.value 0xd046,0x1247,0x5445,0x9644,0xd841,0x1a40,0x5c42,0x9e43
.value 0xe054,0x2255,0x6457,0xa656,0xe853,0x2a52,0x6c50,0xae51
.value 0xf05a,0x325b,0x7459,0xb658,0xf85d,0x3a5c,0x7c5e,0xbe5f
.value 0x00e1,0xc2e0,0x84e2,0x46e3,0x08e6,0xcae7,0x8ce5,0x4ee4
.value 0x10ef,0xd2ee,0x94ec,0x56ed,0x18e8,0xdae9,0x9ceb,0x5eea
.value 0x20fd,0xe2fc,0xa4fe,0x66ff,0x28fa,0xeafb,0xacf9,0x6ef8
.value 0x30f3,0xf2f2,0xb4f0,0x76f1,0x38f4,0xfaf5,0xbcf7,0x7ef6
.value 0x40d9,0x82d8,0xc4da,0x06db,0x48de,0x8adf,0xccdd,0x0edc
.value 0x50d7,0x92d6,0xd4d4,0x16d5,0x58d0,0x9ad1,0xdcd3,0x1ed2
.value 0x60c5,0xa2c4,0xe4c6,0x26c7,0x68c2,0xaac3,0xecc1,0x2ec0
.value 0x70cb,0xb2ca,0xf4c8,0x36c9,0x78cc,0xbacd,0xfccf,0x3ece
.value 0x8091,0x4290,0x0492,0xc693,0x8896,0x4a97,0x0c95,0xce94
.value 0x909f,0x529e,0x149c,0xd69d,0x9898,0x5a99,0x1c9b,0xde9a
.value 0xa08d,0x628c,0x248e,0xe68f,0xa88a,0x6a8b,0x2c89,0xee88
.value 0xb083,0x7282,0x3480,0xf681,0xb884,0x7a85,0x3c87,0xfe86
.value 0xc0a9,0x02a8,0x44aa,0x86ab,0xc8ae,0x0aaf,0x4cad,0x8eac
.value 0xd0a7,0x12a6,0x54a4,0x96a5,0xd8a0,0x1aa1,0x5ca3,0x9ea2
.value 0xe0b5,0x22b4,0x64b6,0xa6b7,0xe8b2,0x2ab3,0x6cb1,0xaeb0
.value 0xf0bb,0x32ba,0x74b8,0xb6b9,0xf8bc,0x3abd,0x7cbf,0xbebe