	.file	"main.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global main
	.type	main, #function
	.proc	0116
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 17 0
	.cfi_startproc
	save	%sp, -144, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 18 0
	mov	4, %g1
	st	%g1, [%fp-4]
	mov	1, %g1
	st	%g1, [%fp-8]
	mov	1, %g1
	st	%g1, [%fp-12]
	.loc 1 19 0
	mov	4, %g1
	st	%g1, [%fp-32]
	mov	2, %g1
	st	%g1, [%fp-28]
	mov	3, %g1
	st	%g1, [%fp-24]
	mov	4, %g1
	st	%g1, [%fp-20]
	.loc 1 20 0
	mov	2, %g1
	st	%g1, [%fp-48]
	mov	4, %g1
	st	%g1, [%fp-44]
	mov	3, %g1
	st	%g1, [%fp-40]
	mov	4, %g1
	st	%g1, [%fp-36]
	.loc 1 21 0
	mov	3, %g1
	st	%g1, [%fp-16]
	.loc 1 22 0
	add	%fp, -32, %g2
	add	%fp, -48, %g1
	ld	[%fp-4], %o0
	ld	[%fp-16], %o1
	mov	%g2, %o2
	ld	[%fp-8], %o3
	mov	%g1, %o4
	ld	[%fp-12], %o5
	call	u32axpy, 0
	 nop
	mov	%o0, %g1
	.loc 1 23 0
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
	.uaword	0xf4
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
	.byte	0x10
	.uaword	0xe5
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xe5
	.uleb128 0x5
	.asciz	"n"
	.byte	0x1
	.byte	0x12
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x12
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x12
	.uaword	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x5
	.asciz	"x"
	.byte	0x1
	.byte	0x13
	.uaword	0xeb
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.asciz	"y"
	.byte	0x1
	.byte	0x14
	.uaword	0xeb
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x6
	.uaword	.LASF13
	.byte	0x1
	.byte	0x15
	.uaword	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uaword	0x25
	.uleb128 0x8
	.uaword	0x25
	.uleb128 0x9
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
.LASF14:
	.asciz	"GNU C 4.7.4"
.LASF3:
	.asciz	"long unsigned int"
.LASF7:
	.asciz	"long long unsigned int"
.LASF16:
	.asciz	"/home/krithik/Desktop/marshal/ajit-toolchain/workspace/xaxpy/u32axpy"
.LASF10:
	.asciz	"char"
.LASF1:
	.asciz	"unsigned char"
.LASF17:
	.asciz	"main"
.LASF15:
	.asciz	"main.c"
.LASF8:
	.asciz	"long int"
.LASF13:
	.asciz	"alpha"
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
