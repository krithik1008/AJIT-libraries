	.file	"main.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global conv
	.type	conv, #function
	.proc	0114
conv:
.LFB0:
	.file 1 "main.c"
	.loc 1 4 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	.loc 1 6 0
	st	%g0, [%fp-8]
	st	%g0, [%fp-12]
	.loc 1 7 0
	st	%g0, [%fp-4]
	.loc 1 8 0
	b	.L2
	 nop
.L3:
	.loc 1 11 0 discriminator 2
	ld	[%fp-4], %g1
	sra	%g1, 3, %g1
	st	%g1, [%fp-8]
	.loc 1 12 0 discriminator 2
	ld	[%fp-8], %g1
	sll	%g1, 3, %g1
	st	%g1, [%fp-8]
	.loc 1 13 0 discriminator 2
	ld	[%fp-4], %g2
	ld	[%fp-8], %g1
	sub	%g2, %g1, %g1
	st	%g1, [%fp-12]
	.loc 1 14 0 discriminator 2
	ld	[%fp-4], %g1
	ld	[%fp+84], %g2
	add	%g2, %g1, %i5
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp+76], %o2
	ld	[%fp+80], %o3
	ld	[%fp-8], %o4
	ld	[%fp-12], %o5
	call	u8dot, 0
	 nop
	mov	%o0, %g1
	stb	%g1, [%i5]
	.loc 1 8 0 discriminator 2
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L2:
	.loc 1 8 0 is_stmt 0 discriminator 1
	ld	[%fp+68], %g2
	ld	[%fp+76], %g1
	sub	%g2, %g1, %g1
	add	%g1, 1, %g2
	ld	[%fp-4], %g1
	cmp	%g2, %g1
	bg	.L3
	 nop
	.loc 1 16 0 is_stmt 1
	ld	[%fp-4], %g1
	ld	[%fp+84], %g2
	add	%g2, %g1, %g1
	.loc 1 17 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	conv, .-conv
	.align 4
	.global main
	.type	main, #function
	.proc	0114
main:
.LFB1:
	.loc 1 21 0
	.cfi_startproc
	save	%sp, -152, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 22 0
	mov	8, %g1
	st	%g1, [%fp-4]
	mov	2, %g1
	st	%g1, [%fp-8]
	.loc 1 24 0
	st	%g0, [%fp-24]
	st	%g0, [%fp-20]
	st	%g0, [%fp-16]
	st	%g0, [%fp-12]
	mov	2, %g1
	stb	%g1, [%fp-24]
	mov	2, %g1
	stb	%g1, [%fp-23]
	mov	3, %g1
	stb	%g1, [%fp-22]
	mov	3, %g1
	stb	%g1, [%fp-21]
	mov	4, %g1
	stb	%g1, [%fp-20]
	mov	4, %g1
	stb	%g1, [%fp-19]
	mov	7, %g1
	stb	%g1, [%fp-18]
	.loc 1 25 0
	mov	8, %g1
	stb	%g1, [%fp-17]
	.loc 1 26 0
	mov	3, %g1
	stb	%g1, [%fp-16]
	.loc 1 27 0
	mov	2, %g1
	stb	%g1, [%fp-15]
	.loc 1 28 0
	mov	8, %g1
	stb	%g1, [%fp-14]
	.loc 1 29 0
	mov	3, %g1
	stb	%g1, [%fp-13]
	.loc 1 30 0
	mov	2, %g1
	stb	%g1, [%fp-12]
	.loc 1 31 0
	mov	8, %g1
	stb	%g1, [%fp-11]
	.loc 1 32 0
	mov	3, %g1
	stb	%g1, [%fp-10]
	.loc 1 33 0
	mov	2, %g1
	stb	%g1, [%fp-9]
	.loc 1 34 0
	st	%g0, [%fp-40]
	st	%g0, [%fp-36]
	st	%g0, [%fp-32]
	st	%g0, [%fp-28]
	mov	1, %g1
	stb	%g1, [%fp-40]
	mov	2, %g1
	stb	%g1, [%fp-39]
	mov	2, %g1
	stb	%g1, [%fp-38]
	mov	3, %g1
	stb	%g1, [%fp-37]
	mov	4, %g1
	stb	%g1, [%fp-36]
	mov	4, %g1
	stb	%g1, [%fp-35]
	mov	7, %g1
	stb	%g1, [%fp-34]
	.loc 1 35 0
	mov	8, %g1
	stb	%g1, [%fp-33]
	.loc 1 36 0
	mov	3, %g1
	stb	%g1, [%fp-32]
	.loc 1 37 0
	mov	2, %g1
	stb	%g1, [%fp-31]
	.loc 1 38 0
	mov	8, %g1
	stb	%g1, [%fp-30]
	.loc 1 39 0
	mov	3, %g1
	stb	%g1, [%fp-29]
	.loc 1 40 0
	mov	2, %g1
	stb	%g1, [%fp-28]
	.loc 1 41 0
	mov	8, %g1
	stb	%g1, [%fp-27]
	.loc 1 42 0
	mov	3, %g1
	stb	%g1, [%fp-26]
	.loc 1 43 0
	mov	2, %g1
	stb	%g1, [%fp-25]
	.loc 1 54 0
	add	%fp, -24, %g3
	add	%fp, -40, %g2
	add	%fp, -56, %g1
	ld	[%fp-4], %o0
	mov	%g3, %o1
	ld	[%fp-8], %o2
	mov	%g2, %o3
	mov	%g1, %o4
	call	conv, 0
	 nop
	mov	%o0, %g1
	.loc 1 55 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x172
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF13
	.byte	0x1
	.uaword	.LASF14
	.uaword	.LASF15
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.uaword	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.uaword	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF10
	.uleb128 0x4
	.byte	0x1
	.uaword	.LASF16
	.byte	0x1
	.byte	0x3
	.byte	0x1
	.uaword	0x105
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x105
	.uleb128 0x5
	.asciz	"sx"
	.byte	0x1
	.byte	0x3
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x5
	.asciz	"x"
	.byte	0x1
	.byte	0x3
	.uaword	0x105
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x5
	.asciz	"sy"
	.byte	0x1
	.byte	0x3
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x5
	.asciz	"y"
	.byte	0x1
	.byte	0x3
	.uaword	0x105
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x5
	.asciz	"res"
	.byte	0x1
	.byte	0x3
	.uaword	0x105
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x6
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x6
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x7
	.asciz	"i"
	.byte	0x1
	.byte	0x7
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0x2c
	.uleb128 0x9
	.byte	0x1
	.uaword	.LASF17
	.byte	0x1
	.byte	0x14
	.uaword	0x105
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x169
	.uleb128 0x7
	.asciz	"nx"
	.byte	0x1
	.byte	0x16
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x7
	.asciz	"ny"
	.byte	0x1
	.byte	0x16
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x7
	.asciz	"x"
	.byte	0x1
	.byte	0x18
	.uaword	0x169
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.asciz	"y"
	.byte	0x1
	.byte	0x22
	.uaword	0x169
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.asciz	"res"
	.byte	0x1
	.byte	0x2c
	.uaword	0x169
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0xa
	.uaword	0x2c
	.uleb128 0xb
	.uaword	0x6b
	.byte	0xf
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LFB0-.Ltext0
	.uaword	.LCFI0-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI0-.Ltext0
	.uaword	.LFE0-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LFB1-.Ltext0
	.uaword	.LCFI1-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI1-.Ltext0
	.uaword	.LFE1-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
	.section	.debug_aranges,"",@progbits
	.uaword	0x1c
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.Ltext0
	.uaword	.Letext0-.Ltext0
	.uaword	0
	.uaword	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF6:
	.asciz	"long long int"
.LASF0:
	.asciz	"unsigned int"
.LASF15:
	.asciz	"/home/krithik/Desktop/marshal/ajit-toolchain/workspace/1d_conv_1"
.LASF13:
	.asciz	"GNU C 4.7.4"
.LASF11:
	.asciz	"load"
.LASF7:
	.asciz	"long long unsigned int"
.LASF10:
	.asciz	"char"
.LASF1:
	.asciz	"unsigned char"
.LASF17:
	.asciz	"main"
.LASF14:
	.asciz	"main.c"
.LASF8:
	.asciz	"long int"
.LASF3:
	.asciz	"long unsigned int"
.LASF2:
	.asciz	"short unsigned int"
.LASF4:
	.asciz	"signed char"
.LASF12:
	.asciz	"shift"
.LASF5:
	.asciz	"short int"
.LASF9:
	.asciz	"sizetype"
.LASF16:
	.asciz	"conv"
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
