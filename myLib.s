	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"myLib.c"
	.text
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #83886080
	ldr	r3, .L2
	ldr	r2, .L2+4
	ldr	r3, [r3]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.word	-2147483392
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L6
	str	lr, [sp, #-4]!
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip]
	mov	r0, r0, asl #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	ldr	lr, [sp], #4
	str	r3, [ip, #8]
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L9:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L9
	mov	r2, #67108864
.L11:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L11
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	loadMap
	.type	loadMap, %function
loadMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	mov	r4, r1, asl #1
	add	ip, r4, #8
	cmp	r1, #0
	bic	ip, ip, #7
	add	fp, sp, #12
	movne	r2, r2, asl #28
	sub	sp, sp, ip
	mov	r5, sp
	addne	r4, r0, r4
	movne	r2, r2, lsr #16
	subne	lr, sp, #2
	beq	.L18
.L17:
	ldrh	ip, [r0], #2
	mov	ip, ip, asl #20
	orr	ip, r2, ip, lsr #20
	cmp	r0, r4
	strh	ip, [lr, #2]!	@ movhi
	bne	.L17
.L18:
	ldr	r2, .L22
	mov	r3, r3, asl #11
	ldr	r2, [r2]
	add	r3, r3, #100663296
	orr	r1, r1, #-2147483648
	str	r5, [r2, #36]
	str	r3, [r2, #40]
	str	r1, [r2, #44]
	sub	sp, fp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.size	loadMap, .-loadMap
	.global	dma
	.global	backBuffer
	.global	frontBuffer
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 45) 5.3.0"
