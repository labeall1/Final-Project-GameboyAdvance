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
	.file	"drawing.c"
	.text
	.align	2
	.global	updatePlayerOAM
	.type	updatePlayerOAM, %function
updatePlayerOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	mov	r3, r3, asl #23
	mvn	r3, r3, lsr #6
	mvn	r3, r3, lsr #17
	str	lr, [sp, #-4]!
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	ldr	lr, [r0, #48]
	ldr	r1, [r0, #52]
	ldr	r2, .L3
	add	r1, r1, lr, lsl #7
	orr	r0, ip, #8192
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L4:
	.align	2
.L3:
	.word	shadowOAM
	.size	updatePlayerOAM, .-updatePlayerOAM
	.align	2
	.global	updateJellyfishOAM
	.type	updateJellyfishOAM, %function
updateJellyfishOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #44]
	str	lr, [sp, #-4]!
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldr	lr, .L7
	add	r1, r1, #11
	mov	r3, r3, asl #23
	mov	r1, r1, asl #3
	mov	r3, r3, lsr #23
	mov	r2, r2, asl #5
	add	ip, lr, r1
	orr	r0, r0, #8192
	orr	r3, r3, #16384
	add	r2, r2, #16
	strh	r0, [lr, r1]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	shadowOAM
	.size	updateJellyfishOAM, .-updateJellyfishOAM
	.align	2
	.global	updateObstacleOAM
	.type	updateObstacleOAM, %function
updateObstacleOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #44]
	str	lr, [sp, #-4]!
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldr	lr, .L11
	add	r1, r1, #1
	mov	r3, r3, asl #23
	mov	r1, r1, asl #3
	mov	r3, r3, lsr #23
	mov	r2, r2, asl #5
	add	ip, lr, r1
	orr	r0, r0, #8192
	orr	r3, r3, #16384
	add	r2, r2, #20
	strh	r0, [lr, r1]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	shadowOAM
	.size	updateObstacleOAM, .-updateObstacleOAM
	.align	2
	.global	updateObstacle2OAM
	.type	updateObstacle2OAM, %function
updateObstacle2OAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #44]
	str	lr, [sp, #-4]!
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldr	lr, .L15
	add	r1, r1, #21
	mov	r3, r3, asl #23
	mov	r1, r1, asl #3
	mov	r3, r3, lsr #23
	mov	r2, r2, asl #5
	add	ip, lr, r1
	orr	r0, r0, #9216
	orr	r3, r3, #16384
	add	r2, r2, #24
	strh	r0, [lr, r1]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	shadowOAM
	.size	updateObstacle2OAM, .-updateObstacle2OAM
	.align	2
	.global	updateHealthOAM
	.type	updateHealthOAM, %function
updateHealthOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	stmfd	sp!, {r4, r5, r6, lr}
	ldrle	r1, .L30
	movle	r6, r0, asl #3
	ble	.L19
	ldr	r1, .L30
	mov	r3, #0
	mov	r2, r1
	mov	r5, #8192
	mov	r4, #512
	mov	r6, r0, asl #3
	add	lr, r1, r6
.L21:
	and	ip, r3, #496
	orr	ip, ip, #16384
	strh	r5, [r2, #248]	@ movhi
	strh	r4, [r2, #252]	@ movhi
	strh	ip, [r2, #250]	@ movhi
	add	r3, r3, #16
	add	r2, r2, #8
	mov	r3, r3, asl #16
	cmp	r2, lr
	mov	r3, r3, lsr #16
	bne	.L21
	cmp	r0, #9
	bgt	.L17
.L19:
	mov	r0, #512
	ldr	r2, .L30+4
	add	r3, r1, r6
.L23:
	strh	r0, [r3, #248]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L23
.L17:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	shadowOAM
	.word	shadowOAM+80
	.size	updateHealthOAM, .-updateHealthOAM
	.align	2
	.global	updatePlusFiveOAM
	.type	updatePlusFiveOAM, %function
updatePlusFiveOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #56]
	cmp	r3, #0
	bne	.L35
	mov	r2, #512
	ldr	r3, .L36
	strh	r2, [r3]	@ movhi
	bx	lr
.L35:
	mov	ip, #896
	ldr	r3, [r0, #4]
	ldrb	r1, [r0]	@ zero_extendqisi2
	mov	r3, r3, asl #23
	ldr	r2, .L36
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	orr	r1, r1, #8192
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	bx	lr
.L37:
	.align	2
.L36:
	.word	shadowOAM+488
	.size	updatePlusFiveOAM, .-updatePlusFiveOAM
	.align	2
	.global	updateScoreOAM
	.type	updateScoreOAM, %function
updateScoreOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	ip, #8192
	mov	r5, #215
	mov	r4, #223
	mov	lr, #231
	ldr	r3, .L40
	ldr	r1, .L40+4
	smull	r2, r3, r0, r3
	smull	r2, r6, r1, r0
	mov	r1, r0, asr #31
	rsb	r3, r1, r3, asr #5
	rsb	r2, r3, r3, lsl #29
	rsb	r1, r1, r6, asr #2
	rsb	r2, r3, r2, lsl #2
	add	r2, r1, r2, lsl #1
	rsb	r6, r2, r2, lsl #29
	rsb	r1, r3, r3, lsl #25
	rsb	r6, r2, r6, lsl #2
	add	r1, r3, r1, lsl #2
	rsb	r1, r3, r1, lsl #3
	add	r0, r0, r6, lsl #1
	add	r0, r0, r1, lsl #2
	ldr	r1, .L40+8
	add	r0, r0, #18
	add	r6, r1, #356
	mov	r0, r0, asl #5
	add	r2, r2, #18
	mov	r2, r2, asl #5
	strh	r0, [r6]	@ movhi
	add	r3, r3, #18
	add	r0, r1, #348
	strh	r2, [r0]	@ movhi
	mov	r3, r3, asl #5
	add	r0, r1, #340
	add	r2, r1, #336
	strh	r3, [r0]	@ movhi
	add	r3, r1, #344
	add	r1, r1, #352
	strh	r5, [r2, #2]	@ movhi
	strh	r4, [r3, #2]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	ip, [r1]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	1374389535
	.word	1717986919
	.word	shadowOAM
	.size	updateScoreOAM, .-updateScoreOAM
	.ident	"GCC: (devkitARM release 45) 5.3.0"
