.text
.global main
main:
start:	save %sp,-160,%sp
	set 0xaaaaaaaa, %g2
	set 0xaa000000, %g7
	mov %fp, %g3
	sub %g3,128,%g5

        set 0xfffffff8,%g6
        and %g6,%g3,%g3
	and %g6,%g5,%g5
	sub %g3,24,%g3
	sub %g5,24,%g5

	mov 4, %g4
	mov 4, %g6

	st %g7, [%g3]
	st %g7, [%g5]

back1:	sub %g3,0x4,%g3
	st %g2, [%g3]
	deccc %g4
	bnz back1         
	nop 
         
back2:  sub %g5,0x4,%g5
        st %g2, [%g5]
        deccc %g6
        bnz back2
        nop

	mov %g3,%o1
	mov %g5,%o0
	
	call astrcmp	
	nop
	ret
	restore
	ta 0






