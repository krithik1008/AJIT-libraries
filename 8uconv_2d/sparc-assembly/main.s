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
	.loc 1 5 0
	.cfi_startproc
	save	%sp, -136, %sp
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
	mov	3, %g1
	st	%g1, [%fp-24]
	ld	[%fp+68], %g2
	ld	[%fp-24], %g1
	sub	%g2, %g1, %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-28]
	ld	[%fp+72], %g2
	ld	[%fp-24], %g1
	sub	%g2, %g1, %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-32]
	.loc 1 8 0
	st	%g0, [%fp-20]
	.loc 1 9 0
	st	%g0, [%fp-12]
	b	.L2
	 nop
.L9:
	.loc 1 11 0
	ld	[%fp+72], %g2
	ld	[%fp-12], %g1
	smul	%g2, %g1, %g1
	st	%g1, [%fp-36]
	.loc 1 12 0
	st	%g0, [%fp-16]
	b	.L3
	 nop
.L8:
	.loc 1 14 0
	ld	[%fp-36], %g2
	ld	[%fp-16], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-40]
	.loc 1 15 0
	st	%g0, [%fp-8]
	b	.L4
	 nop
.L7:
	.loc 1 16 0
	st	%g0, [%fp-4]
	b	.L5
	 nop
.L6:
	.loc 1 17 0 discriminator 2
	ld	[%fp-20], %g1
	ld	[%fp+84], %g2
	add	%g2, %g1, %g1
	ld	[%fp-20], %g2
	ld	[%fp+84], %g3
	add	%g3, %g2, %g2
	ldub	[%g2], %g3
	ld	[%fp-24], %g4
	ld	[%fp-8], %g2
	smul	%g4, %g2, %g4
	ld	[%fp-4], %g2
	add	%g4, %g2, %g2
	ld	[%fp+80], %g4
	add	%g4, %g2, %g2
	ldub	[%g2], %g4
	ld	[%fp+72], %i5
	ld	[%fp-8], %g2
	smul	%i5, %g2, %i5
	ld	[%fp-40], %g2
	add	%i5, %g2, %i5
	ld	[%fp-4], %g2
	add	%i5, %g2, %g2
	ld	[%fp+76], %i5
	add	%i5, %g2, %g2
	ldub	[%g2], %g2
	smul	%g4, %g2, %g2
	add	%g3, %g2, %g2
	stb	%g2, [%g1]
	.loc 1 16 0 discriminator 2
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L5:
	.loc 1 16 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g2
	ld	[%fp-24], %g1
	cmp	%g2, %g1
	bl	.L6
	 nop
	.loc 1 15 0 is_stmt 1
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
.L4:
	.loc 1 15 0 is_stmt 0 discriminator 1
	ld	[%fp-8], %g2
	ld	[%fp-24], %g1
	cmp	%g2, %g1
	bl	.L7
	 nop
	.loc 1 18 0 is_stmt 1
	ld	[%fp-20], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-20]
	.loc 1 12 0
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-16]
.L3:
	.loc 1 12 0 is_stmt 0 discriminator 1
	ld	[%fp-16], %g2
	ld	[%fp-32], %g1
	cmp	%g2, %g1
	bl	.L8
	 nop
	.loc 1 9 0 is_stmt 1
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
.L2:
	.loc 1 9 0 is_stmt 0 discriminator 1
	ld	[%fp-12], %g2
	ld	[%fp-28], %g1
	cmp	%g2, %g1
	bl	.L9
	 nop
	.loc 1 21 0 is_stmt 1
	ld	[%fp+84], %g1
	.loc 1 22 0
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
	.loc 1 26 0
	.cfi_startproc
	save	%sp, -2416, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 27 0
	mov	48, %g1
	st	%g1, [%fp-4]
	mov	48, %g1
	st	%g1, [%fp-8]
	.loc 1 45 0
	call	genx, 0
	 nop
	st	%o0, [%fp-12]
	.loc 1 46 0
	call	geny, 0
	 nop
	st	%o0, [%fp-16]
	.loc 1 47 0
	add	%fp, -2320, %g1
	ld	[%fp-4], %o0
	ld	[%fp-8], %o1
	ld	[%fp-12], %o2
	ld	[%fp-16], %o3
	mov	%g1, %o4
	call	conv, 0
	 nop
	mov	%o0, %g1
	.loc 1 48 0
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
	.uaword	0x1ce
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF15
	.byte	0x1
	.uaword	.LASF16
	.uaword	.LASF17
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
	.uaword	.LASF18
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.uaword	0x15f
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x15f
	.uleb128 0x5
	.asciz	"nx"
	.byte	0x1
	.byte	0x4
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x5
	.asciz	"ny"
	.byte	0x1
	.byte	0x4
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x5
	.asciz	"x"
	.byte	0x1
	.byte	0x4
	.uaword	0x15f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x5
	.asciz	"y"
	.byte	0x1
	.byte	0x4
	.uaword	0x15f
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x5
	.asciz	"res"
	.byte	0x1
	.byte	0x4
	.uaword	0x15f
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x6
	.asciz	"k"
	.byte	0x1
	.byte	0x6
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.uaword	.LASF11
	.byte	0x1
	.byte	0x6
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.uaword	.LASF12
	.byte	0x1
	.byte	0x6
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x7
	.uaword	.LASF13
	.byte	0x1
	.byte	0x7
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x7
	.uaword	.LASF14
	.byte	0x1
	.byte	0x7
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x6
	.asciz	"w"
	.byte	0x1
	.byte	0x7
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x6
	.asciz	"h"
	.byte	0x1
	.byte	0x7
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x6
	.asciz	"i"
	.byte	0x1
	.byte	0x8
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x6
	.asciz	"j"
	.byte	0x1
	.byte	0x8
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x6
	.asciz	"pos"
	.byte	0x1
	.byte	0x8
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0x2c
	.uleb128 0x9
	.byte	0x1
	.uaword	.LASF19
	.byte	0x1
	.byte	0x19
	.uaword	0x15f
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x1c4
	.uleb128 0x6
	.asciz	"nx"
	.byte	0x1
	.byte	0x1b
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x6
	.asciz	"ny"
	.byte	0x1
	.byte	0x1b
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x6
	.asciz	"res"
	.byte	0x1
	.byte	0x27
	.uaword	0x1c4
	.byte	0x3
	.byte	0x91
	.sleb128 -2320
	.uleb128 0x6
	.asciz	"x"
	.byte	0x1
	.byte	0x2d
	.uaword	0x15f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x6
	.asciz	"y"
	.byte	0x1
	.byte	0x2e
	.uaword	0x15f
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xa
	.uaword	0x2c
	.uleb128 0xb
	.uaword	0x6b
	.uahalf	0x8ff
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
	.uleb128 0x2117
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
	.uleb128 0x7
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
	.uleb128 0x5
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
.LASF13:
	.asciz	"temp"
.LASF5:
	.asciz	"short int"
.LASF9:
	.asciz	"sizetype"
.LASF19:
	.asciz	"main"
.LASF17:
	.asciz	"/home/krithik/Desktop/marshal/ajit-toolchain/workspace/8uconv_2d"
.LASF11:
	.asciz	"compi"
.LASF12:
	.asciz	"compj"
.LASF18:
	.asciz	"conv"
.LASF6:
	.asciz	"long long int"
.LASF8:
	.asciz	"long int"
.LASF1:
	.asciz	"unsigned char"
.LASF4:
	.asciz	"signed char"
.LASF7:
	.asciz	"long long unsigned int"
.LASF0:
	.asciz	"unsigned int"
.LASF15:
	.asciz	"GNU C 4.7.4"
.LASF2:
	.asciz	"short unsigned int"
.LASF10:
	.asciz	"char"
.LASF16:
	.asciz	"main.c"
.LASF3:
	.asciz	"long unsigned int"
.LASF14:
	.asciz	"temp1"
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
