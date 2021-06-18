	.file	"main.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global u32dot_1
	.type	u32dot_1, #function
	.proc	016
u32dot_1:
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
	st	%i4, [%fp+84]
	.loc 1 4 0
	st	%g0, [%fp-4]
	.loc 1 5 0
	st	%g0, [%fp-8]
	.loc 1 6 0
	ld	[%fp+68], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	be	.L3
	 nop
	.loc 1 8 0
	ld	[%fp+72], %g1
	ld	[%g1], %g2
	ld	[%fp+80], %g1
	ld	[%g1], %g1
	smul	%g2, %g1, %g1
	ld	[%fp-8], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 9 0
	mov	1, %g1
	st	%g1, [%fp-4]
	.loc 1 11 0
	b	.L3
	 nop
.L4:
	.loc 1 13 0 discriminator 2
	ld	[%fp-4], %g1
	sll	%g1, 2, %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %g2
	ld	[%fp-4], %g1
	sll	%g1, 2, %g1
	ld	[%fp+80], %g3
	add	%g3, %g1, %g1
	ld	[%g1], %g1
	smul	%g2, %g1, %g1
	ld	[%fp-8], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 11 0 discriminator 2
	ld	[%fp-4], %g1
	add	%g1, 2, %g1
	st	%g1, [%fp-4]
.L3:
	.loc 1 11 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g2
	ld	[%fp+68], %g1
	cmp	%g2, %g1
	bl	.L4
	 nop
	.loc 1 15 0 is_stmt 1
	ld	[%fp-8], %g1
	.loc 1 16 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	u32dot_1, .-u32dot_1
	.align 4
	.global main
	.type	main, #function
	.proc	016
main:
.LFB1:
	.loc 1 18 0
	.cfi_startproc
	save	%sp, -160, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 19 0
	mov	6, %g1
	st	%g1, [%fp-4]
	mov	1, %g1
	st	%g1, [%fp-8]
	mov	1, %g1
	st	%g1, [%fp-12]
	.loc 1 20 0
	mov	5, %g1
	st	%g1, [%fp-36]
	mov	3, %g1
	st	%g1, [%fp-32]
	mov	2, %g1
	st	%g1, [%fp-28]
	mov	5, %g1
	st	%g1, [%fp-24]
	mov	1, %g1
	st	%g1, [%fp-20]
	mov	10, %g1
	st	%g1, [%fp-16]
	.loc 1 21 0
	mov	2, %g1
	st	%g1, [%fp-60]
	mov	2, %g1
	st	%g1, [%fp-56]
	mov	3, %g1
	st	%g1, [%fp-52]
	mov	4, %g1
	st	%g1, [%fp-48]
	mov	2, %g1
	st	%g1, [%fp-44]
	mov	3, %g1
	st	%g1, [%fp-40]
	.loc 1 22 0
	add	%fp, -36, %g2
	add	%fp, -60, %g1
	ld	[%fp-4], %o0
	mov	%g2, %o1
	ld	[%fp-8], %o2
	mov	%g1, %o3
	ld	[%fp-12], %o4
	call	u32dot_1, 0
	 nop
	mov	%o0, %g1
	.loc 1 23 0
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
	.uaword	0x164
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
	.byte	0x2
	.byte	0x1
	.uaword	0x25
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xf7
	.uleb128 0x5
	.asciz	"n"
	.byte	0x1
	.byte	0x2
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x5
	.asciz	"x"
	.byte	0x1
	.byte	0x2
	.uaword	0xf7
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x2
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x5
	.asciz	"y"
	.byte	0x1
	.byte	0x2
	.uaword	0xf7
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x2
	.uaword	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x7
	.asciz	"i"
	.byte	0x1
	.byte	0x4
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x7
	.asciz	"ans"
	.byte	0x1
	.byte	0x5
	.uaword	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0x25
	.uleb128 0x9
	.byte	0x1
	.uaword	.LASF17
	.byte	0x1
	.byte	0x11
	.uaword	0x25
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x15b
	.uleb128 0x7
	.asciz	"n"
	.byte	0x1
	.byte	0x13
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xa
	.uaword	.LASF11
	.byte	0x1
	.byte	0x13
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xa
	.uaword	.LASF12
	.byte	0x1
	.byte	0x13
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x7
	.asciz	"x"
	.byte	0x1
	.byte	0x14
	.uaword	0x15b
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x7
	.asciz	"y"
	.byte	0x1
	.byte	0x15
	.uaword	0x15b
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0xb
	.uaword	0x25
	.uleb128 0xc
	.uaword	0x6b
	.byte	0x5
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
	.asciz	"/home/krithik/Desktop/marshal/ajit-toolchain/workspace/xdot/u32dot"
.LASF13:
	.asciz	"GNU C 4.7.4"
.LASF3:
	.asciz	"long unsigned int"
.LASF7:
	.asciz	"long long unsigned int"
.LASF10:
	.asciz	"char"
.LASF1:
	.asciz	"unsigned char"
.LASF16:
	.asciz	"u32dot_1"
.LASF17:
	.asciz	"main"
.LASF14:
	.asciz	"main.c"
.LASF8:
	.asciz	"long int"
.LASF11:
	.asciz	"incx"
.LASF12:
	.asciz	"incy"
.LASF2:
	.asciz	"short unsigned int"
.LASF4:
	.asciz	"signed char"
.LASF5:
	.asciz	"short int"
.LASF9:
	.asciz	"sizetype"
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
