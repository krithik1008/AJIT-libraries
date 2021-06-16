	.file	"main.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global main
	.type	main, #function
	.proc	0114
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 34 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 35 0
	mov	7, %g1
	st	%g1, [%fp-4]
	mov	1, %g1
	st	%g1, [%fp-8]
	.loc 1 36 0
	mov	2, %g1
	stb	%g1, [%fp-16]
	mov	9, %g1
	stb	%g1, [%fp-15]
	mov	5, %g1
	stb	%g1, [%fp-14]
	mov	7, %g1
	stb	%g1, [%fp-13]
	mov	6, %g1
	stb	%g1, [%fp-12]
	mov	8, %g1
	stb	%g1, [%fp-11]
	mov	1, %g1
	stb	%g1, [%fp-10]
	.loc 1 37 0
	mov	5, %g1
	stb	%g1, [%fp-9]
	.loc 1 38 0
	ldub	[%fp-9], %g1
	and	%g1, 0xff, %g2
	add	%fp, -16, %g1
	ld	[%fp-4], %o0
	mov	%g2, %o1
	mov	%g1, %o2
	ld	[%fp-8], %o3
	call	u8scal, 0
	 nop
	mov	%o0, %g1
	.loc 1 39 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0xdc
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
	.byte	0x21
	.uaword	0xcd
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xcd
	.uleb128 0x5
	.asciz	"n"
	.byte	0x1
	.byte	0x23
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x23
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x5
	.asciz	"arr"
	.byte	0x1
	.byte	0x24
	.uaword	0xd3
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x25
	.uaword	0x2c
	.byte	0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uaword	0x2c
	.uleb128 0x8
	.uaword	0x2c
	.uleb128 0x9
	.uaword	0x6b
	.byte	0x6
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
.LASF1:
	.asciz	"unsigned char"
.LASF14:
	.asciz	"main.c"
.LASF13:
	.asciz	"GNU C 4.7.4"
.LASF3:
	.asciz	"long unsigned int"
.LASF7:
	.asciz	"long long unsigned int"
.LASF10:
	.asciz	"char"
.LASF15:
	.asciz	"/home/ayush/eys/ajit-toolchain/wkspace/AJIT-libraries/xscal/u8scal "
.LASF16:
	.asciz	"main"
.LASF8:
	.asciz	"long int"
.LASF12:
	.asciz	"alpha"
.LASF11:
	.asciz	"incx"
.LASF2:
	.asciz	"short unsigned int"
.LASF4:
	.asciz	"signed char"
.LASF5:
	.asciz	"short int"
.LASF9:
	.asciz	"sizetype"
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
