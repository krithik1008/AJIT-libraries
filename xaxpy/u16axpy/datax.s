.section .text 
 .align 4
 .global genx 
 .type genx, #function
 genx:
 	 save  %sp, -120, %sp
 	 set datax,%i0
 	 restore 
 	 retl 
 	 nop 
 .section .data
 .align 8
 .global datax 
 datax: 
.half	0xd
.half	0x51
.half	0xa
.half	0x14
.half	0x50
.half	0x4c
.half	0x49
.half	0x4d
.half	0x33
.half	0x1e
.half	0x36
.half	0x12
.half	0x59
.half	0x56
.half	0x58
.half	0x57
.half	0x36
.half	0x39
.half	0x5f
.half	0xa
.half	0x58
.half	0x54
.half	0x9
.half	0x8
.half	0x2e
.half	0x4e
.half	0x4f
.half	0x7
.half	0x19
.half	0x53
.half	0xa
.half	0xb
.half	0x19
.half	0x16
.half	0x4f
.half	0x2a
.half	0x4e
.half	0x63
.half	0x26
.half	0x16
.half	0xc
.half	0x5d
.half	0x19
.half	0x3b
.half	0x54
.half	0xa
.half	0x2e
.half	0x4
.half	0x1b
.half	0x2b
.half	0x9
.half	0x58
.half	0x50
.half	0x3e
.half	0xf
.half	0x43
.half	0x32
.half	0x62
.half	0x42
.half	0x24
.half	0x39
.half	0x3c
.half	0x3b
.half	0xb
.half	0x39
.half	0x1
.half	0x28
.half	0x53
.half	0x25
.half	0x5d
.half	0x5d
.half	0x4d
.half	0x4a
.half	0x11
.half	0x6
.half	0x8
.half	0x3d
.half	0x63
.half	0x4a
.half	0x2d
.half	0xd
.half	0x60
.half	0x8
.half	0x7
.half	0x44
.half	0x53
.half	0x13
.half	0x38
.half	0x45
.half	0x19
.half	0xa
.half	0x4e
.half	0x37
.half	0x10
.half	0x54
.half	0x2
.half	0x13
.half	0x4f
.half	0x64
.half	0x17
.half	0x5
.half	0x33
.half	0xa
.half	0xd
.half	0x4b
.half	0x36
.half	0x5a
.half	0x14
.half	0x5e
.half	0x58
.half	0x17
.half	0x3c
.half	0x54
.half	0x61
.half	0x7
.half	0x12
.half	0x13
.half	0x3f
.half	0x1b
.half	0x42
.half	0x32
.half	0x1a
.half	0x64
.half	0x36
.half	0x46
.half	0x50
.half	0x3
.half	0x25
.half	0x21
.half	0x47
.half	0x1b
.half	0x2e
.half	0x61
.half	0x20
.half	0x12
.half	0x44
.half	0x37
.half	0x5d
.half	0x38
.half	0x61
.half	0x21
.half	0x19
.half	0x5e
.half	0x43
.half	0x4b
.half	0x44
.half	0x42
.half	0x42
.half	0x22
.half	0xd
.half	0x4c
.half	0x1b
.half	0x2b
.half	0x2f
.half	0x52
.half	0x5f
.half	0x3
.half	0x60
.half	0x4c
.half	0x3b
.half	0x56
.half	0x2a
.half	0x11
.half	0x2e
.half	0x56
.half	0x61
.half	0x23
.half	0x47
.half	0x31
.half	0x33
.half	0xb
.half	0x14
.half	0x28
.half	0x1f
.half	0x47
.half	0x53
.half	0x2c
.half	0x21
.half	0x38
.half	0x58
.half	0x5b
.half	0x49
.half	0x58
.half	0x5b
.half	0x5e
.half	0x2
.half	0x62
.half	0x3a
.half	0x5
.half	0x24
.half	0x15
.half	0x3c
.half	0x53
.half	0x23
.half	0x5f
.half	0x52
.half	0x58
.half	0x36
.half	0x21
.half	0xd
.half	0x50
.half	0x2b
.half	0x5f
.half	0xf
.half	0x2b
.half	0x52
.half	0xd
.half	0x62
.half	0x13
.half	0x55
.half	0x44
.half	0x54
.half	0x5f
.half	0x41
.half	0x4e
.half	0x2b
.half	0x4b
.half	0xf
.half	0x5a
.half	0x31
.half	0x4
.half	0xd
.half	0x11
.half	0x4
.half	0xf
.half	0x17
.half	0x2b
.half	0x23
.half	0x28
.half	0x2b
.half	0x3
.half	0x34
.half	0x2b
.half	0x3a
.half	0x3c
.half	0x63
.half	0x2b
.half	0x35
.half	0x60
.half	0x1d
.half	0x5f
.half	0x5a
.half	0x2d
.half	0x48
.half	0x13
.half	0x1
.half	0x4c
.half	0x56
.half	0x49
.half	0x18
.half	0x22
.half	0xb
.half	0x18
.half	0x20
.half	0x12
.half	0x61
.half	0x1e
.half	0x1f
.half	0x4a
.half	0x42
.half	0x2f
.half	0x40
.half	0x10
.half	0x2a
.half	0x2c
.half	0x1d
.half	0x8
.half	0x56
.half	0x4d
.half	0x2a
.half	0x24
.half	0x4a
.half	0x5d
.half	0xd
.half	0x40
.half	0x15
.half	0x1f
.half	0x5e
.half	0x9
.half	0x37
.half	0x18
.half	0x2
.half	0x4
.half	0x3f
.half	0x13
.half	0x7
.half	0xd
.half	0x63
.half	0x38
.half	0x44
.half	0x32
.half	0x3e
.half	0x5f
.half	0x1f
.half	0x34
.half	0x4a
.half	0x61
.half	0x5f
.half	0x20
.half	0x5e
.half	0x3d
.half	0x2d
.half	0x13
.half	0x1c
.half	0x32
.half	0x2d
.half	0x10
.half	0x42
.half	0xd
.half	0x56
.half	0x63
.half	0x53
.half	0x42
.half	0x62
.half	0x10
.half	0x1
.half	0x2b
.half	0x1b
.half	0x5
.half	0x19
.half	0x15
.half	0x44
.half	0x37
.half	0x23
.half	0x10
.half	0x32
.half	0x37
.half	0x31
.half	0x2c
.half	0xb
.half	0x4a
.half	0x9
.half	0x50
.half	0x2
.half	0x39
.half	0x43
.half	0x2e
.half	0x3a
.half	0x3c
.half	0x43
.half	0x3b
.half	0x20
.half	0x1b
.half	0x55
.half	0x39
.half	0x19
.half	0x2d
.half	0x20
.half	0x5a
.half	0x28
.half	0xd
.half	0xe
.half	0x1b
.half	0x9
.half	0x51
.half	0xe
.half	0xa
.half	0x1c
.half	0x5
.half	0x5b
.half	0x4
.half	0x1f
.half	0x47
.half	0x51
.half	0x1c
.half	0x58
.half	0x47
.half	0x57
.half	0x48
.half	0xf
.half	0x54
.half	0x11
.half	0x13
.half	0x11
.half	0x55
.half	0x1b
.half	0x53
.half	0x57
.half	0x5a
.half	0x3b
.half	0x59
.half	0x11
.half	0x2d
.half	0x1d
.half	0x57
.half	0x1e
.half	0x3f
.half	0x1a
.half	0x2a
.half	0x45
.half	0x2d
.half	0x1e
.half	0x11
.half	0x46
.half	0x9
.half	0x16
.half	0x33
.half	0x51
.half	0x4e
.half	0x44
.half	0x48
.half	0x18
.half	0x8
.half	0x2d
.half	0x9
.half	0x21
.half	0x33
.half	0x3f
.half	0x27
.half	0x1c
.half	0x62
.half	0x61
.half	0x32
.half	0x28
.half	0x25
.half	0x1f
.half	0x6
.half	0x9
.half	0xa
.half	0x4e
.half	0x13
.half	0x2b
.half	0x1d
.half	0x14
.half	0x58
.half	0x63
.half	0x63
.half	0x61
.half	0x21
.half	0x4b
.half	0x2
.half	0x3c
.half	0x3c
.half	0x5c
.half	0x1c
.half	0x49
.half	0x5
.half	0x55
.half	0x1e
.half	0x5c
.half	0x13
.half	0x63
.half	0x47
.half	0x28
.half	0x62
.half	0x2a
.half	0x37
.half	0x1e
.half	0xd
.half	0x4c
.half	0x4f
.half	0x4b
.half	0x13
.half	0x30
.half	0x25
.half	0x2d
.half	0x60
.half	0x1a
.half	0x43
.half	0x5c
.half	0x2a
.half	0x40
.half	0x3e
.half	0x4c
.half	0x22
.half	0x31
.half	0x3e
.half	0x12
.half	0x2c
.half	0x2c
.half	0x28
.half	0x54
.half	0x58
.half	0x44
.half	0x54
.half	0x15
.half	0x2b
.half	0x34
.half	0x2c
.half	0x60
.half	0x5c
.half	0x8
.half	0x36
.half	0x36
.half	0x2e
.half	0x2e
.half	0x39
.half	0x1
.half	0x4c
.half	0x33
.half	0x12
.half	0x16
.half	0x18
.half	0x45
.half	0xd
.half	0xc
.half	0x31
.half	0x36
.half	0x1f
.half	0x61
.half	0x32
.half	0x59
.half	0x49
.half	0x4a
.half	0x52
.half	0x42
.half	0x1d
.half	0x40
.half	0x3a
.half	0x2a
.half	0x59
.half	0xb
.half	0x1b
.half	0x55
.half	0x4a
.half	0x36
.half	0x39
.half	0x53
.half	0x22
.half	0x26
.half	0x36
.half	0x2
.half	0x2d
.half	0x36
.half	0x22
.half	0x54
.half	0x3a
.half	0x61
.half	0x42
.half	0x3c
.half	0x5a
.half	0xb
.half	0x42
.half	0x41
.half	0x15
.half	0x4d
.half	0x53
.half	0x47
.half	0x30
.half	0x2b
.half	0x6
.half	0x47
.half	0x9
.half	0x21
.half	0x55
.half	0x60
.half	0x13
.half	0x22
.half	0x56
.half	0x5d
.half	0x2f
.half	0x22
.half	0x28
.half	0x10
.half	0x5a
.half	0x28
.half	0x56
.half	0x20
.half	0x62
.half	0x21
.half	0x6
.half	0x10
.half	0x50
.half	0x1f
.half	0x4d
.half	0x46
.half	0x5f
.half	0x22
.half	0x18
.half	0x20
.half	0x2f
.half	0x52
.half	0x3b
.half	0x1c
.half	0x1d
.half	0x3b
.half	0x50
.half	0x5d
.half	0x9
.half	0x3b
.half	0x4f
.half	0x64
.half	0x5a
.half	0x61
.half	0xd
.half	0x48
.half	0x5d
.half	0x27
.half	0x59
.half	0x53
.half	0x25
.half	0x1
.half	0x5f
.half	0x11
.half	0x4f
.half	0x2
.half	0x4e
.half	0x2f
.half	0x3c
.half	0x48
.half	0x24
.half	0x31
.half	0x2
.half	0x5d
.half	0xf
.half	0x60
.half	0x13
.half	0x2
.half	0x48
.half	0x37
.half	0x53
.half	0x14
.half	0x15
.half	0x54
.half	0x51
.half	0x18
.half	0x49
.half	0x64
.half	0x63
.half	0x4
.half	0x35
.half	0x40
.half	0xd
.half	0x55
.half	0x4
.half	0x5
.half	0x1
.half	0x42
.half	0x5f
.half	0x58
.half	0x1f
.half	0x15
.half	0x2f
.half	0x31
.half	0x1d
.half	0x5c
.half	0x48
.half	0x2c
.half	0x36
.half	0x28
.half	0x5c
.half	0x1e
.half	0x64
.half	0x63
.half	0x3e
.half	0x42
.half	0x58
.half	0x1
.half	0x43
.half	0x3d
.half	0x11
.half	0x2b
.half	0x2
.half	0x21
.half	0x5f
.half	0x29
.half	0x3
.half	0x3c
.half	0x26
.half	0xd
.half	0x58
.half	0x59
.half	0x7
.half	0x42
.half	0x16
.half	0x1b
.half	0x64
.half	0x20
.half	0x51
.half	0x30
.half	0x1e
.half	0x16
.half	0x15
.half	0x40
.half	0x15
.half	0xb
.half	0x31
.half	0x36
.half	0x22
.half	0x16
.half	0x26
.half	0x54
.half	0x52
.half	0x27
.half	0xc
.half	0x34
.half	0x2a
.half	0x46
.half	0x34
.half	0x26
.half	0xd
.half	0xf
.half	0x3c
.half	0x4c
.half	0x28
.half	0x3d
.half	0x57
.half	0x57
.half	0xe
.half	0x5a
.half	0x2a
.half	0x18
.half	0x39
.half	0x5b
.half	0x55
.half	0x59
.half	0x2b
.half	0x4
.half	0x11
.half	0x4a
.half	0x2a
.half	0x1f
.half	0x19
.half	0x7
.half	0x4e
.half	0x38
.half	0x11
.half	0x20
.half	0x4c
.half	0x33
.half	0x4a
.half	0x34
.half	0x55
.half	0x4e
.half	0x26
.half	0x28
.half	0x3b
.half	0x1d
.half	0x31
.half	0x44
.half	0x62
.half	0x46
.half	0x46
.half	0x62
.half	0x7
.half	0x4d
.half	0x37
.half	0x30
.half	0x39
.half	0x28
.half	0x30
.half	0x3
.half	0x30
.half	0x46
.half	0x1b
.half	0x42
.half	0x7
.half	0x21
.half	0x16
.half	0x46
.half	0xc
.half	0x2d
.half	0x50
.half	0x7
.half	0xd
.half	0x55
.half	0x4
.half	0x36
.half	0x3b
.half	0x3e
.half	0x36
.half	0x3
.half	0xf
.half	0x58
.half	0xc
.half	0x13
.half	0x18
.half	0x3d
.half	0x63
.half	0x4c
.half	0x41
.half	0xb
.half	0x46
.half	0x20
.half	0x9
.half	0x44
.half	0x2e
.half	0x5f
.half	0x48
.half	0x1a
.half	0x43
.half	0x53
.half	0x17
.half	0x16
.half	0x4e
.half	0x4f
.half	0x27
.half	0x2b
.half	0x18
.half	0x51
.half	0x3a
.half	0x2a
.half	0x49
.half	0x5b
.half	0x2f
.half	0x23
.half	0x7
.half	0x42
.half	0x38
.half	0x54
.half	0x11
.half	0x2b
.half	0x25
.half	0x26
.half	0x42
.half	0x12
.half	0x1b
.half	0x35
.half	0x3e
.half	0x2a
.half	0x12
.half	0x20
.half	0x6
.half	0x4e
.half	0x42
.half	0x8
.half	0x59
.half	0x45
.half	0x5c
.half	0x46
.half	0x21
.half	0x29
.half	0x49
.half	0x42
.half	0x32
.half	0x2c
.half	0x5d
.half	0x27
.half	0x33
.half	0x6
.half	0x39
.half	0x43
.half	0x25
.half	0x15
.half	0x5c
.half	0x2
.half	0x46
.half	0x19
.half	0x49
.half	0x23
.half	0x56
.half	0x21
.half	0x42
.half	0x50
.half	0x20
.half	0x16
.half	0x43
.half	0x63
.half	0x61
.half	0x9
.half	0x10
.half	0x2d
.half	0x25
.half	0x1e
.half	0x3b
.half	0x48
.half	0x53
.half	0x5d
.half	0x3a
.half	0x52
.half	0x5c
.half	0x16
.half	0x7
.half	0x8
.half	0x4
.half	0x2d
.half	0x51
.half	0x22
.half	0x63
.half	0x36
.half	0x25
.half	0x3d
.half	0x1d
.half	0x45
.half	0x27
.half	0x3c
.half	0x1e
.half	0x51
.half	0x4
.half	0x4d
.half	0x34
.half	0x1f
.half	0x39
.half	0x3a
.half	0x44
.half	0xa
.half	0x3a
.half	0x48
.half	0x25
.half	0x30
.half	0x7
.half	0x64
.half	0x60
.half	0x5e
.half	0x5c
.half	0xd
.half	0x28
.half	0x3d
.half	0x16
.half	0x45
.half	0x15
.half	0x4c
.half	0xd
.half	0x51
.half	0x64
.half	0x2b
.half	0xe
.half	0xa
.half	0x3b
.half	0x1d
.half	0x38
.half	0x5c
.half	0x4a
.half	0xa
.half	0x26
.half	0x5a
.half	0x33
.half	0x5c
.half	0x5b
.half	0x32
.half	0x41
.half	0x13
.half	0x58
.half	0x18
.half	0x6
.half	0xb
.half	0x6
.half	0x4
.half	0x24
.half	0x1d
.half	0x4e
.half	0x5e
.half	0x7
.half	0x7
.half	0x12
.half	0x32
.half	0x64
.half	0x35
.half	0x15
.half	0x12
.half	0x30
.half	0x3b
.half	0x15
.half	0x46
.half	0x56
.half	0x7
.half	0x6
.half	0x30
.half	0x7
.half	0x19
.half	0x49
.half	0x63
.half	0x9
.half	0x22
.half	0x56
.half	0x7
.half	0x60
.half	0x58
.half	0x11
.half	0x3c
.half	0x1
.half	0x4d
.half	0x55
.half	0xb
.half	0xf
.half	0xc
.half	0x20
.half	0x39
.half	0xe
.half	0x58
.half	0x1
.half	0x2e
.half	0xc
.half	0x47
.half	0x1b
.half	0x38
.half	0x1e
.half	0x2f
.half	0x2a
.half	0x24
.half	0x41
.half	0x4e
.half	0x2e
.half	0x3e
.half	0x49
.half	0x2c
.half	0x22
.half	0x3f
.half	0x33
.half	0x3
.half	0x63
.half	0x2d
.half	0x43
.half	0x3e
.half	0x2c
.half	0x1d
.half	0x49
.half	0x9
.half	0x2e
.half	0x4b
