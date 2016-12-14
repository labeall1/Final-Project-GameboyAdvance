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
	.file	"main.c"
	.text
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L2
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L6
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L6+4
	ldr	ip, .L6+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r2, .L10+8
	ldr	r2, [r2]
	ldr	r9, .L10+12
	mov	r7, r1
	mov	r8, r0
	mov	r10, r3
	str	r6, [r2, #20]
	mov	r1, r0
	ldr	r2, .L10+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L10+20
	mov	lr, pc
	bx	r4
	strh	r6, [r9, #2]	@ movhi
	mov	r1, r5
	ldr	r3, .L10+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r3, #128
	rsb	r0, r0, #0
	ldr	r4, .L10+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r9]	@ movhi
	ldr	fp, .L10+32
	strh	r3, [r9, #2]	@ movhi
	mov	r0, r7
	str	r8, [r4]
	str	r6, [r4, #28]
	mov	lr, pc
	bx	fp
	ldr	r6, .L10+36
	adr	r3, .L10
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	fp
	ldr	r6, .L10+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L10+44
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r10, [r4, #16]
	str	r5, [r4, #8]
	str	r7, [r4, #4]
	str	r3, [r4, #12]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L11:
	.align	3
.L10:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r2, .L14+8
	ldr	r2, [r2]
	ldr	r9, .L14+12
	mov	r7, r1
	mov	r8, r0
	mov	r10, r3
	str	r6, [r2, #32]
	mov	r1, r0
	ldr	r2, .L14+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L14+20
	mov	lr, pc
	bx	r4
	strh	r6, [r9, #6]	@ movhi
	mov	r1, r5
	ldr	r3, .L14+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r3, #128
	rsb	r0, r0, #0
	ldr	r4, .L14+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r9, #4]	@ movhi
	ldr	fp, .L14+32
	strh	r3, [r9, #6]	@ movhi
	mov	r0, r7
	str	r8, [r4]
	str	r6, [r4, #28]
	mov	lr, pc
	bx	fp
	ldr	r6, .L14+36
	adr	r3, .L14
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	fp
	ldr	r6, .L14+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L14+44
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r10, [r4, #16]
	str	r5, [r4, #8]
	str	r7, [r4, #4]
	str	r3, [r4, #12]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L15:
	.align	3
.L14:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L34
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L30
	ldr	r0, .L34+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	stmfd	sp!, {r4, lr}
	beq	.L19
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L19
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L32
	ldr	r1, .L34+8
	ldr	r2, .L34+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L19:
	ldr	r0, .L34+16
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L23
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L23
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L33
	ldr	r1, .L34+8
	ldr	r2, .L34+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
.L23:
	mov	r2, #1
	ldr	r3, .L34
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L34
	ldmfd	sp!, {r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L30:
	mov	r2, #1
	ldr	r3, .L34
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L32:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundA
	b	.L19
.L33:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundB
	b	.L23
.L35:
	.align	2
.L34:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L37
	ldr	r0, .L37+4
	ldr	r1, .L37+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L38:
	.align	2
.L37:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L40
	ldr	ip, .L40+4
	ldr	r0, .L40+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L41:
	.align	2
.L40:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L43
	ldr	r2, .L43+4
	ldr	r1, [r1]
	ldr	ip, .L43+8
	ldr	r0, .L43+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L48
.L46:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L46
	bx	lr
.L49:
	.align	2
.L48:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L56
.L51:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L51
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L56
	mov	r0, #3
	ldr	r4, .L56+4
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	lr, #1
	mov	r4, #32
	mov	r5, #30
	mov	r8, #30720
	mov	r7, #2048
	mov	r0, #16
	mov	r6, #5
	ldr	r3, .L56+8
	str	r2, [r3]
	ldr	r3, .L56+12
	str	r2, [r3]
	ldr	r3, .L56+16
	str	r2, [r3]
	ldr	r3, .L56+20
	str	r2, [r3]
	ldr	r3, .L56+24
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3, #16]
	ldr	r4, .L56+28
	str	lr, [r3, #20]
	str	lr, [r3, #48]
	str	lr, [r3, #56]
	ldr	lr, .L56+32
	str	r2, [r3, #36]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	str	r5, [r3, #4]
	str	r5, [r3, #40]
	str	r8, [r3]
	ldr	r5, .L56+36
	str	r7, [r3, #44]
	ldr	r3, .L56+40
	mov	r1, r2
	mov	ip, r0
	str	r2, [r4, #56]
	str	r2, [lr, #52]
	str	r0, [r4, #24]
	str	r0, [r4, #28]
	str	r0, [lr, #24]
	str	r0, [lr, #28]
	ldr	r2, .L56+44
	ldr	r0, .L56+48
	str	r6, [r5]
	add	r5, r3, #480
.L52:
	str	r1, [r3, #24]
	str	ip, [r3, #20]
	str	ip, [r3, #16]
	str	r1, [r3, #44]
	add	r3, r3, #48
	cmp	r3, r5
	str	r1, [r2, #24]
	str	ip, [r2, #20]
	str	ip, [r2, #16]
	str	r1, [r2, #40]
	str	r1, [r2, #44]
	str	r1, [r0, #24]
	str	ip, [r0, #20]
	str	ip, [r0, #16]
	str	r1, [r0, #44]
	add	r2, r2, #48
	add	r0, r0, #48
	mov	lr, #0
	mov	r4, #16
	bne	.L52
	mov	r1, #75
	mov	r5, #95
	mov	r0, #100
	mov	r2, #5
	ldr	r3, .L56+52
	ldr	ip, .L56+56
	str	r1, [r3]
	ldr	r1, .L56+60
	ldr	r3, .L56+64
	str	r5, [ip]
	str	r0, [r1]
	str	r2, [r3]
	ldr	r5, .L56+68
	ldr	ip, .L56+72
	ldr	r0, .L56+76
	ldr	r1, .L56+80
	ldr	r2, .L56+84
	ldr	r3, .L56+88
	str	lr, [r5]
	str	lr, [ip]
	str	lr, [r0]
	str	lr, [r1]
	str	r4, [r2]
	str	lr, [r3]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	shadowOAM
	.word	DMANow
	.word	hOff
	.word	vOff
	.word	avoidedObstacles
	.word	cheat
	.word	spongebob
	.word	plusFive
	.word	heart
	.word	health
	.word	obstacles
	.word	jellyfish
	.word	obstacles2
	.word	pinkObstacleTime
	.word	blueObstacleTime
	.word	greenObstacleTime
	.word	changeBlending
	.word	timer
	.word	caughtFish
	.word	tempTimer
	.word	blend
	.word	ghost_blend
	.word	alphaBlendCounter
	.size	initializeGame, .-initializeGame
	.align	2
	.global	clearObstacles
	.type	clearObstacles, %function
clearObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #1
	mov	r4, #512
	ldr	r0, .L65
	ldr	r1, .L65+4
	ldr	r3, .L65+8
	ldr	r2, .L65+12
.L62:
	ldr	lr, [r0, #24]
	cmp	lr, #0
	ldr	lr, [r2, #24]
	streqh	r4, [r3, #8]	@ movhi
	cmp	lr, #0
	ldr	lr, [r1, #24]
	streqh	r4, [r3, #88]	@ movhi
	add	ip, ip, #1
	cmp	lr, #0
	streqh	r4, [r3, #168]	@ movhi
	cmp	ip, #11
	add	r1, r1, #48
	add	r3, r3, #8
	add	r0, r0, #48
	add	r2, r2, #48
	bne	.L62
	ldmfd	sp!, {r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	obstacles
	.word	obstacles2
	.word	shadowOAM
	.word	jellyfish
	.size	clearObstacles, .-clearObstacles
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L89
	ldr	r3, [r0, #56]
	cmp	r3, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bne	.L85
	mov	r2, #512
	ldr	r3, .L89+4
	strh	r2, [r3]	@ movhi
.L69:
	mov	r4, #0
	ldr	r7, .L89+8
	ldr	r6, .L89+12
	ldr	r5, .L89+16
	ldr	r10, .L89+20
	ldr	r9, .L89+24
	ldr	r8, .L89+28
	b	.L73
.L70:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L86
.L71:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	bne	.L87
.L72:
	add	r4, r4, #1
	cmp	r4, #10
	add	r6, r6, #48
	add	r7, r7, #48
	add	r5, r5, #48
	beq	.L88
.L73:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L70
	mov	r1, r4
	mov	r0, r7
	mov	lr, pc
	bx	r10
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L71
.L86:
	mov	r1, r4
	mov	r0, r5
	mov	lr, pc
	bx	r9
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L72
.L87:
	mov	r1, r4
	mov	r0, r6
	mov	lr, pc
	bx	r8
	b	.L72
.L88:
	ldr	r2, .L89+32
	ldr	r3, .L89+36
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r2, .L89+40
	ldr	r3, .L89+44
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r0, .L89+48
	ldr	r3, .L89+52
	mov	lr, pc
	bx	r3
	ldr	r4, .L89+56
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L89+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L85:
	ldr	r3, .L89+60
	mov	lr, pc
	bx	r3
	b	.L69
.L90:
	.align	2
.L89:
	.word	spongebob
	.word	shadowOAM
	.word	obstacles
	.word	obstacles2
	.word	jellyfish
	.word	updateObstacleOAM
	.word	updateJellyfishOAM
	.word	updateObstacle2OAM
	.word	health
	.word	updateHealthOAM
	.word	caughtFish
	.word	updateScoreOAM
	.word	plusFive
	.word	updatePlusFiveOAM
	.word	DMANow
	.word	updatePlayerOAM
	.size	draw, .-draw
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r5, #0
	strh	r5, [r3, #16]	@ movhi
	strh	r5, [r3, #80]	@ movhi
	strh	r5, [r3, #20]	@ movhi
	strh	r5, [r3, #82]	@ movhi
	bl	initializeGame
	mov	r4, r5
	mov	r2, #512
	ldr	r1, .L95
	ldr	r3, .L95+4
	str	r5, [r1]
.L92:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L92
	ldr	r5, .L95+8
	ldr	r1, .L95+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #8064
	mov	r3, #67108864
	ldr	r0, .L95+12
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L95+16
	mov	lr, pc
	bx	r3
	mov	r3, #6144
	mov	r2, #100663296
	ldr	r1, .L95+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L95+24
	ldr	r1, .L95+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	state
	.word	shadowOAM
	.word	DMANow
	.word	splashPal
	.word	loadPalette
	.word	splashTiles
	.word	100726784
	.word	splashMap
	.size	goToSplash, .-goToSplash
	.align	2
	.type	pause.part.2, %function
pause.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L99
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L100:
	.align	2
.L99:
	.word	buttons
	.size	pause.part.2, .-pause.part.2
	.set	lose.part.0,pause.part.2
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L103
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	lose.part.0
.L104:
	.align	2
.L103:
	.word	oldButtons
	.size	lose, .-lose
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r2, #13120
	mov	r4, #67108864
	ldr	r3, .L107
	ldr	r3, [r3]
	cmp	r3, #0
	strh	r2, [r4, #80]	@ movhi
	add	r2, r3, #3
	movge	r2, r3
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asl #15
	mov	r2, r2, asl #14
	mov	r3, r3, lsr #16
	mov	r2, r2, lsr #16
	ldr	r5, .L107+4
	strh	r3, [r4, #16]	@ movhi
	ldr	r1, .L107+8
	strh	r2, [r4, #20]	@ movhi
	mov	r3, #16384
	ldr	r2, .L107+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r1, .L107+16
	mov	r3, #256
	ldr	r2, .L107+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #7936
	ldr	r3, .L107+24
	strh	r2, [r4, #8]	@ movhi
	ldr	r0, .L107+28
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L107+32
	mov	lr, pc
	bx	r3
	mov	r3, #5312
	mov	r2, #100663296
	ldr	r1, .L107+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L107+40
	ldr	r1, .L107+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #2320
	ldr	r2, .L107+48
	ldr	r1, .L107+52
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r4, .L107+56
	mov	r3, #27
	mov	r2, #0
	mov	r1, #2048
	ldr	r0, .L107+60
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L107+64
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L108:
	.align	2
.L107:
	.word	hOff
	.word	DMANow
	.word	spritesTiles
	.word	100728832
	.word	spritesPal
	.word	83886592
	.word	6916
	.word	hooksPal
	.word	loadPalette
	.word	hooksTiles
	.word	100726784
	.word	hooksMap
	.word	100679680
	.word	seaTiles
	.word	loadMap
	.word	seaMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.type	instructions3.part.1, %function
instructions3.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L111
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L112:
	.align	2
.L111:
	.word	buttons
	.size	instructions3.part.1, .-instructions3.part.1
	.align	2
	.global	instructions3
	.type	instructions3, %function
instructions3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L115
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	instructions3.part.1
.L116:
	.align	2
.L115:
	.word	oldButtons
	.size	instructions3, .-instructions3
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L125
	ldr	r3, [r4]
	tst	r3, #4
	beq	.L118
	ldr	r3, .L125+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L124
.L118:
	ldr	r3, [r4]
	tst	r3, #8
	ldmnefd	sp!, {r4, lr}
	bne	pause.part.2
.L117:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L124:
	bl	goToGame
	b	.L118
.L126:
	.align	2
.L125:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #67108864
	mov	r2, #512
	stmfd	sp!, {r4, r5, r6, lr}
	strh	r3, [r1, #16]	@ movhi
	mov	r4, r3
	strh	r3, [r1, #80]	@ movhi
	strh	r3, [r1, #20]	@ movhi
	strh	r3, [r1, #82]	@ movhi
	ldr	r3, .L131
.L128:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L128
	ldr	r5, .L131+4
	ldr	r1, .L131
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #7936
	mov	r3, #67108864
	ldr	r0, .L131+8
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L131+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L131+16
	mov	r2, #100663296
	ldr	r1, .L131+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L131+24
	ldr	r1, .L131+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #1
	ldr	r3, .L131+32
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L132:
	.align	2
.L131:
	.word	shadowOAM
	.word	DMANow
	.word	instructionsPal
	.word	loadPalette
	.word	5360
	.word	instructionsTiles
	.word	100726784
	.word	instructionsMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L145
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L134
	ldr	r3, .L145+4
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L143
.L134:
	ldr	r3, [r4]
	tst	r3, #4
	beq	.L133
	ldr	r3, .L145+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L144
.L133:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L144:
	ldmfd	sp!, {r4, lr}
	b	goToInstructions
.L143:
	bl	goToGame
	b	.L134
.L146:
	.align	2
.L145:
	.word	oldButtons
	.word	buttons
	.size	splash, .-splash
	.align	2
	.global	goToInstructions2
	.type	goToInstructions2, %function
goToInstructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #67108864
	mov	r2, #512
	stmfd	sp!, {r4, r5, r6, lr}
	strh	r3, [r1, #16]	@ movhi
	mov	r4, r3
	strh	r3, [r1, #80]	@ movhi
	strh	r3, [r1, #20]	@ movhi
	strh	r3, [r1, #82]	@ movhi
	ldr	r3, .L151
.L148:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L148
	ldr	r5, .L151+4
	ldr	r1, .L151
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #7936
	mov	r3, #67108864
	ldr	r0, .L151+8
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L151+12
	mov	lr, pc
	bx	r3
	mov	r3, #5760
	mov	r2, #100663296
	ldr	r1, .L151+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L151+20
	ldr	r1, .L151+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #2
	ldr	r3, .L151+28
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L152:
	.align	2
.L151:
	.word	shadowOAM
	.word	DMANow
	.word	instructions2Pal
	.word	loadPalette
	.word	instructions2Tiles
	.word	100726784
	.word	instructions2Map
	.word	state
	.size	goToInstructions2, .-goToInstructions2
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L165
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L154
	ldr	r3, .L165+4
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L163
.L154:
	ldr	r3, [r4]
	tst	r3, #4
	beq	.L153
	ldr	r3, .L165+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L164
.L153:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L164:
	ldmfd	sp!, {r4, lr}
	b	goToInstructions2
.L163:
	bl	goToGame
	b	.L154
.L166:
	.align	2
.L165:
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	goToInstructions3
	.type	goToInstructions3, %function
goToInstructions3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #67108864
	mov	r2, #512
	stmfd	sp!, {r4, r5, r6, lr}
	strh	r3, [r1, #16]	@ movhi
	mov	r4, r3
	strh	r3, [r1, #80]	@ movhi
	strh	r3, [r1, #20]	@ movhi
	strh	r3, [r1, #82]	@ movhi
	ldr	r3, .L171
.L168:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L168
	ldr	r5, .L171+4
	ldr	r1, .L171
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #7936
	mov	r3, #67108864
	ldr	r0, .L171+8
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L171+12
	mov	lr, pc
	bx	r3
	mov	r3, #4000
	mov	r2, #100663296
	ldr	r1, .L171+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L171+20
	ldr	r1, .L171+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #3
	ldr	r3, .L171+28
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L172:
	.align	2
.L171:
	.word	shadowOAM
	.word	DMANow
	.word	instructions3Pal
	.word	loadPalette
	.word	instructions3Tiles
	.word	100726784
	.word	instructions3Map
	.word	state
	.size	goToInstructions3, .-goToInstructions3
	.align	2
	.global	instructions2
	.type	instructions2, %function
instructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L185
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L174
	ldr	r3, .L185+4
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L183
.L174:
	ldr	r3, [r4]
	tst	r3, #4
	beq	.L173
	ldr	r3, .L185+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L184
.L173:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L184:
	ldmfd	sp!, {r4, lr}
	b	goToInstructions3
.L183:
	bl	goToGame
	b	.L174
.L186:
	.align	2
.L185:
	.word	oldButtons
	.word	buttons
	.size	instructions2, .-instructions2
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	r3, #67108864
	mov	r0, #7936
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r2, #512
	mov	r4, r1
	strh	r1, [r3, #16]	@ movhi
	strh	r1, [r3, #80]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	r1, [r3, #82]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldr	r3, .L191
.L188:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L188
	ldr	r5, .L191+4
	mov	r2, #117440512
	ldr	r1, .L191
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r0, .L191+8
	ldr	r3, .L191+12
	mov	lr, pc
	bx	r3
	mov	r3, #3248
	mov	r2, #100663296
	ldr	r1, .L191+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L191+20
	ldr	r1, .L191+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #5
	ldr	r3, .L191+28
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L192:
	.align	2
.L191:
	.word	shadowOAM
	.word	DMANow
	.word	pausePal
	.word	loadPalette
	.word	pauseTiles
	.word	100726784
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	r3, #67108864
	mov	r0, #8064
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r2, #512
	mov	r4, r1
	strh	r1, [r3, #16]	@ movhi
	strh	r1, [r3, #80]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	r1, [r3, #82]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldr	r3, .L197
.L194:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L194
	ldr	r5, .L197+4
	mov	r2, #117440512
	ldr	r1, .L197
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r0, .L197+8
	ldr	r3, .L197+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L197+16
	mov	r2, #100663296
	ldr	r1, .L197+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L197+24
	ldr	r1, .L197+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #6
	ldr	r3, .L197+32
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L198:
	.align	2
.L197:
	.word	shadowOAM
	.word	DMANow
	.word	losePal
	.word	loadPalette
	.word	17824
	.word	loseTiles
	.word	100726784
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L260
	ldr	r7, .L260+4
	ldr	r3, [r2]
	ldr	r4, [r7]
	ldr	r1, .L260+8
	add	r3, r3, #1
	add	r4, r4, #1
	mov	r0, r3
	ldr	r1, [r1]
	ldr	r6, .L260+12
	str	r3, [r2]
	str	r4, [r7]
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	bne	.L200
	ldr	r1, .L260+16
	ldr	r2, [r1]
	subs	r2, r2, #1
	movmi	r2, #16
	rsbpl	r3, r2, #16
	orrpl	r3, r2, r3, asl #8
	strpl	r2, [r1]
	movmi	r3, r2
	strmi	r2, [r1]
	mov	r2, #67108864
	movpl	r3, r3, asl #16
	movpl	r3, r3, lsr #16
	strh	r3, [r2, #82]	@ movhi
.L200:
	ldr	r3, .L260+20
	mov	r0, r4
	ldr	r1, [r3]
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	bne	.L203
	ldr	r0, .L260+24
	mov	r3, r0
.L205:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L253
	add	r1, r1, #1
	cmp	r1, #10
	add	r3, r3, #48
	bne	.L205
.L203:
	ldr	r3, .L260+28
	cmp	r4, r3
	bgt	.L249
	ldr	r5, .L260+32
.L206:
	ldr	r0, .L260+32
	ldr	r3, .L260+36
	mov	lr, pc
	bx	r3
	ldr	r0, .L260+40
	ldr	r3, [r0]
	add	r1, r3, #1
	cmp	r1, #0
	movge	r3, r1
	mov	ip, #67108864
	addlt	r3, r3, #4
	add	r2, r1, r1, lsr #31
	mov	r2, r2, asl #15
	mov	r3, r3, asl #14
	mov	r2, r2, lsr #16
	mov	r3, r3, lsr #16
	str	r1, [r0]
	strh	r2, [ip, #16]	@ movhi
	ldr	r0, .L260+32
	ldr	r2, .L260+44
	strh	r3, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r2
	cmp	r0, #0
	bne	.L254
	ldr	r10, .L260+48
	ldr	r3, [r10]
	cmp	r3, #0
	ble	.L213
.L259:
	ldr	r2, .L260+52
	smull	r0, r1, r2, r3
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #1
	add	r2, r2, r2, lsl #2
	subs	r2, r3, r2
	movne	r2, #1
	sub	r3, r3, #1
	str	r2, [r5, #56]
	str	r3, [r10]
.L216:
	ldr	r4, .L260+24
	ldr	r6, .L260+56
	ldr	r5, .L260+60
	ldr	r8, .L260+64
	ldr	r9, .L260+32
	ldr	fp, .L260+68
	add	r7, r4, #480
	b	.L227
.L218:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L255
.L222:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	bne	.L256
.L225:
	add	r4, r4, #48
	bl	clearObstacles
	cmp	r4, r7
	add	r6, r6, #48
	add	r5, r5, #48
	beq	.L257
.L227:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L218
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	r1, r4
	ldr	r0, .L260+32
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L218
	ldr	r3, [r9, #52]
	cmp	r3, #8
	bne	.L218
	mov	r1, #1
	ldr	r3, [r9]
	ldr	r2, .L260+72
	ldr	r0, .L260+76
	mov	r3, r3, asr #8
	ldr	r2, [r2]
	sub	r3, r3, #12
	str	r3, [r0]
	ldr	r0, .L260+72
	add	r2, r2, #5
	ldr	r3, [r9, #4]
	cmp	r2, #5
	str	r2, [r0]
	ldr	r2, .L260+76
	sub	r3, r3, #4
	str	r3, [r2, #4]
	str	r1, [r2, #56]
	beq	.L258
.L220:
	mov	r3, #0
	str	r3, [r4, #24]
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L222
.L255:
	mov	r0, r5
	mov	lr, pc
	bx	r8
	mov	r1, r5
	ldr	r0, .L260+32
	ldr	r3, .L260+80
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L222
	ldr	r3, [r9, #60]
	cmp	r3, #0
	bne	.L222
	mov	r0, #1
	mov	r1, #180
	ldr	r2, .L260+84
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	str	r0, [r9, #60]
	str	r1, [r10]
	bne	.L222
	bl	goToLose
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L225
.L256:
	mov	r0, r6
	mov	lr, pc
	bx	r8
	mov	r1, r6
	ldr	r0, .L260+32
	ldr	r3, .L260+80
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L225
	ldr	r3, [r9, #60]
	cmp	r3, #0
	bne	.L225
	mov	r0, #1
	mov	r1, #180
	ldr	r2, .L260+84
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	str	r0, [r9, #60]
	str	r1, [r10]
	bne	.L225
	bl	goToLose
	b	.L225
.L257:
	ldr	r3, .L260+88
	ldr	r0, .L260+76
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L249:
	ldr	r3, .L260+92
	mov	r0, r4
	ldr	r1, [r3]
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	beq	.L250
	ldr	r5, .L260+32
.L207:
	ldr	r3, .L260+96
	cmp	r4, r3
	ble	.L206
	ldr	r3, .L260+100
	mov	r0, r4
	ldr	r1, [r3]
	mov	lr, pc
	bx	r6
	cmp	r1, #0
	bne	.L206
	ldr	r0, .L260+56
	ldr	ip, [r5, #60]
	mov	r3, r0
	b	.L211
.L210:
	add	r1, r1, #1
	cmp	r1, #10
	add	r3, r3, #48
	beq	.L206
.L211:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L210
	cmp	ip, #0
	bne	.L210
	add	r1, r1, r1, lsl #1
	add	r0, r0, r1, lsl #4
	ldr	r3, .L260+104
	mov	lr, pc
	bx	r3
	b	.L206
.L250:
	ldr	r0, .L260+60
	ldr	r5, .L260+32
	mov	r3, r0
	ldr	ip, [r5, #60]
	b	.L209
.L208:
	add	r1, r1, #1
	cmp	r1, #10
	add	r3, r3, #48
	beq	.L207
.L209:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L208
	cmp	ip, #0
	bne	.L208
	add	r1, r1, r1, lsl #1
	add	r0, r0, r1, lsl #4
	ldr	r3, .L260+104
	mov	lr, pc
	bx	r3
	ldr	r4, [r7]
	b	.L207
.L254:
	ldr	r10, .L260+48
	bl	goToLose
	ldr	r3, [r10]
	cmp	r3, #0
	bgt	.L259
.L213:
	mov	r3, #0
	ldr	r1, .L260+108
	ldr	r2, .L260+112
	str	r3, [r5, #60]
	str	r3, [r1]
	str	r3, [r2, #52]
	b	.L216
.L253:
	add	r1, r1, r1, lsl #1
	add	r0, r0, r1, lsl #4
	ldr	r3, .L260+104
	mov	lr, pc
	bx	r3
	ldr	r4, [r7]
	b	.L203
.L258:
	mov	r3, #0
	ldr	r2, .L260+116
	ldr	r1, .L260+120
	ldr	r0, .L260+124
	bl	playSoundB
	b	.L220
.L261:
	.align	2
.L260:
	.word	alphaBlendCounter
	.word	timer
	.word	changeBlending
	.word	__aeabi_idivmod
	.word	ghost_blend
	.word	pinkObstacleTime
	.word	jellyfish
	.word	1700
	.word	spongebob
	.word	updateSpongebob
	.word	hOff
	.word	playerOffScreen
	.word	tempTimer
	.word	1717986919
	.word	obstacles2
	.word	obstacles
	.word	updateObstacle
	.word	catchJellyfish
	.word	caughtFish
	.word	plusFive
	.word	playerCollide
	.word	health
	.word	updatePlusFive
	.word	blueObstacleTime
	.word	3400
	.word	greenObstacleTime
	.word	spawnObstacle
	.word	stop
	.word	heart
	.word	11025
	.word	19285
	.word	laugh
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	update
	ldr	r3, .L275
	ldr	r3, [r3]
	cmp	r3, #4
	beq	.L273
.L263:
	ldr	r4, .L275+4
	ldr	r3, [r4]
	tst	r3, #4
	beq	.L264
	ldr	r3, .L275+8
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L274
.L264:
	ldr	r3, [r4]
	tst	r3, #2
	beq	.L262
	ldr	r3, .L275+8
	ldr	r3, [r3]
	tst	r3, #2
	bne	.L262
	ldr	r3, .L275+12
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r1, #5
	moveq	r0, #1
	ldreq	r2, .L275+16
	streq	r0, [r3]
	streq	r1, [r2]
.L262:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L274:
	bl	goToPause
	b	.L264
.L273:
	bl	draw
	b	.L263
.L276:
	.align	2
.L275:
	.word	state
	.word	oldButtons
	.word	buttons
	.word	cheat
	.word	health
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4864
	stmfd	sp!, {r4, r7, fp, lr}
	ldr	r3, .L292
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L292+4
.L278:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L278
	mov	r6, #67108864
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L292+4
	mov	r0, #3
	ldr	r4, .L292+8
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r7, #128
	mov	r5, #0
	ldr	r2, .L292+12
	ldrh	r0, [r6, #4]
	ldrh	r1, [r2]
	ldr	r4, .L292+16
	ldr	ip, .L292+20
	ldr	lr, .L292+24
	orr	r1, r1, r3
	orr	r0, r0, #8
	strh	r7, [r6, #132]	@ movhi
	strh	r5, [r6, #128]	@ movhi
	strh	r4, [r6, #130]	@ movhi
	strh	r0, [r6, #4]	@ movhi
	ldr	r4, .L292+28
	strh	r1, [r2]	@ movhi
	strh	r3, [r2, #8]	@ movhi
	ldr	r1, .L292+32
	str	lr, [ip, #4092]
	ldr	r2, .L292+36
	ldr	r0, .L292+40
	mov	lr, pc
	bx	r4
	ldr	r5, .L292+44
	ldr	r4, .L292+48
	ldr	r8, .L292+52
	ldr	fp, .L292+56
	ldr	r10, .L292+60
	ldr	r9, .L292+64
	ldr	r7, .L292+68
.L288:
	ldr	r3, [r4]
	str	r3, [r5]
	ldr	r3, [r8]
	ldr	r2, [r6, #304]
	str	r2, [r4]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L279
.L281:
	.word	.L280
	.word	.L282
	.word	.L283
	.word	.L284
	.word	.L285
	.word	.L286
	.word	.L287
.L287:
	ldr	r3, [r5]
	tst	r3, #8
	bne	.L291
.L279:
	mov	lr, pc
	bx	r7
	b	.L288
.L286:
	ldr	r3, .L292+72
	mov	lr, pc
	bx	r3
	b	.L279
.L285:
	ldr	r3, .L292+76
	mov	lr, pc
	bx	r3
	b	.L279
.L284:
	ldr	r3, [r5]
	tst	r3, #8
	beq	.L279
	ldr	r3, .L292+80
	mov	lr, pc
	bx	r3
	b	.L279
.L283:
	mov	lr, pc
	bx	r9
	b	.L279
.L280:
	mov	lr, pc
	bx	fp
	b	.L279
.L282:
	mov	lr, pc
	bx	r10
	b	.L279
.L291:
	ldr	r3, .L292+84
	mov	lr, pc
	bx	r3
	b	.L279
.L293:
	.align	2
.L292:
	.word	goToSplash
	.word	shadowOAM
	.word	DMANow
	.word	67109376
	.word	-1266
	.word	50360320
	.word	interruptHandler
	.word	playSoundA
	.word	213249
	.word	11025
	.word	backgroundSong
	.word	oldButtons
	.word	buttons
	.word	state
	.word	splash
	.word	instructions
	.word	instructions2
	.word	waitForVblank
	.word	pause
	.word	game
	.word	instructions3.part.1
	.word	lose.part.0
	.size	main, .-main
	.comm	state,4,4
	.comm	changeBlending,4,4
	.comm	alphaBlendCounter,4,4
	.comm	ghost_blend,4,4
	.comm	blend,4,4
	.comm	type,4,4
	.comm	stop,4,4
	.comm	addFive,4,4
	.comm	cheat,4,4
	.comm	health,4,4
	.comm	caughtFish,4,4
	.comm	loseTimer,4,4
	.comm	tempTimer,4,4
	.comm	greenObstacleTime,4,4
	.comm	blueObstacleTime,4,4
	.comm	pinkObstacleTime,4,4
	.comm	timer,4,4
	.comm	avoidedObstacles,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	obstacles2,480,4
	.comm	jellyfish,480,4
	.comm	obstacles,480,4
	.comm	plusFive,64,4
	.comm	heart,64,4
	.comm	spongebob,64,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
