	.file	"main.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global sscal
	.type	sscal, #function
	.proc	0106
sscal:
.LFB0:
	.file 1 "main.c"
	.loc 1 3 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	.loc 1 4 0
	st	%g0, [%fp-4]
	.loc 1 5 0
	st	%g0, [%fp-8]
	.loc 1 6 0
	ld	[%fp+80], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+80]
	.loc 1 8 0
	ld	[%fp+68], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	bne	.L2
	 nop
	.loc 1 9 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 12 0
	b	.L4
	 nop
.L2:
	.loc 1 10 0
	ld	[%fp+68], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-4]
	.loc 1 12 0
	b	.L4
	 nop
.L5:
	.loc 1 14 0 discriminator 2
	ld	[%fp-8], %g1
	sll	%g1, 2, %g1
	ld	[%fp+76], %g2
	add	%g2, %g1, %g1
	ld	[%fp-8], %g2
	sll	%g2, 2, %g2
	ld	[%fp+76], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp+72], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%g1]
	.loc 1 12 0 discriminator 2
	ld	[%fp-8], %g1
	add	%g1, 2, %g1
	st	%g1, [%fp-8]
.L4:
	.loc 1 12 0 is_stmt 0 discriminator 1
	ld	[%fp-8], %g2
	ld	[%fp-4], %g1
	cmp	%g2, %g1
	bl	.L5
	 nop
	.loc 1 17 0 is_stmt 1
	ld	[%fp+68], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	be	.L6
	 nop
	.loc 1 18 0
	ld	[%fp+68], %g1
	add	%g1, -1, %g1
	sll	%g1, 2, %g1
	ld	[%fp+76], %g2
	add	%g2, %g1, %g1
	ld	[%fp+68], %g2
	add	%g2, -1, %g2
	sll	%g2, 2, %g2
	ld	[%fp+76], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp+72], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%g1]
.L6:
	.loc 1 20 0
	ld	[%fp+76], %g1
	.loc 1 22 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	sscal, .-sscal
	.section	".rodata"
	.align 4
.LC0:
	.long	1082130432
	.align 4
.LC1:
	.long	1077936128
	.align 4
.LC2:
	.long	1073741824
	.align 4
.LC3:
	.long	1084227584
	.align 4
.LC4:
	.long	1066192077
	.section	".text"
	.align 4
	.global main
	.type	main, #function
	.proc	0106
main:
.LFB1:
	.loc 1 25 0
	.cfi_startproc
	save	%sp, -128, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 26 0
	mov	4, %g1
	st	%g1, [%fp-4]
	mov	1, %g1
	st	%g1, [%fp-8]
	.loc 1 27 0
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	ld	[%g1], %f8
	st	%f8, [%fp-28]
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %g1
	ld	[%g1], %f8
	st	%f8, [%fp-24]
	sethi	%hi(.LC2), %g1
	or	%g1, %lo(.LC2), %g1
	ld	[%g1], %f8
	st	%f8, [%fp-20]
	sethi	%hi(.LC3), %g1
	or	%g1, %lo(.LC3), %g1
	ld	[%g1], %f8
	st	%f8, [%fp-16]
	.loc 1 28 0
	sethi	%hi(.LC4), %g1
	or	%g1, %lo(.LC4), %g1
	ld	[%g1], %f8
	st	%f8, [%fp-12]
	.loc 1 29 0
	add	%fp, -28, %g1
	ld	[%fp-4], %o0
	ld	[%fp-12], %o1
	mov	%g1, %o2
	ld	[%fp-8], %o3
	call	sscal, 0
	 nop
	mov	%o0, %g1
	.loc 1 30 0
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
	.uaword	0x154
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF14
	.byte	0x1
	.uaword	.LASF15
	.uaword	.LASF16
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
	.uaword	.LASF17
	.byte	0x1
	.byte	0x2
	.byte	0x1
	.uaword	0xea
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xea
	.uleb128 0x5
	.asciz	"n"
	.byte	0x1
	.byte	0x2
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x2
	.uaword	0xf0
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x5
	.asciz	"arr"
	.byte	0x1
	.byte	0x2
	.uaword	0xea
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x2
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x7
	.asciz	"k"
	.byte	0x1
	.byte	0x4
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x7
	.asciz	"i"
	.byte	0x1
	.byte	0x5
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0xf0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.uaword	.LASF13
	.uleb128 0x9
	.byte	0x1
	.uaword	.LASF18
	.byte	0x1
	.byte	0x18
	.uaword	0xea
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x14b
	.uleb128 0x7
	.asciz	"n"
	.byte	0x1
	.byte	0x1a
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xa
	.uaword	.LASF12
	.byte	0x1
	.byte	0x1a
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x7
	.asciz	"arr"
	.byte	0x1
	.byte	0x1b
	.uaword	0x14b
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.uaword	.LASF11
	.byte	0x1
	.byte	0x1c
	.uaword	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.uaword	0xf0
	.uleb128 0xc
	.uaword	0x6b
	.byte	0x3
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
	.uleb128 0x5
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
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.asciz	"main.c"
.LASF18:
	.asciz	"main"
.LASF14:
	.asciz	"GNU C 4.7.4"
.LASF3:
	.asciz	"long unsigned int"
.LASF7:
	.asciz	"long long unsigned int"
.LASF1:
	.asciz	"unsigned char"
.LASF10:
	.asciz	"char"
.LASF8:
	.asciz	"long int"
.LASF11:
	.asciz	"alpha"
.LASF12:
	.asciz	"incx"
.LASF17:
	.asciz	"sscal"
.LASF2:
	.asciz	"short unsigned int"
.LASF4:
	.asciz	"signed char"
.LASF13:
	.asciz	"float"
.LASF5:
	.asciz	"short int"
.LASF9:
	.asciz	"sizetype"
.LASF16:
	.asciz	"/home/ayush/eys/ajit-toolchain/wkspace/Untitled Folder"
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
