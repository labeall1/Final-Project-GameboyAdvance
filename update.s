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
	.file	"update.c"
	.text
	.align	2
	.global	updateSpongebob
	.type	updateSpongebob, %function
updateSpongebob:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L34
	ldr	r2, [r1]
	ldr	r3, .L34+4
	add	r2, r2, #1
	smull	ip, r3, r2, r3
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	lr, r2, asr #31
	rsb	r3, lr, r3, asr #3
	add	r3, r3, r3, lsl #4
	cmp	r2, r3
	ldr	r3, [r0]
	str	r2, [r1]
	mov	r1, r3, asr #8
	bne	.L3
	cmp	r1, #110
	ble	.L3
	ldr	ip, [r0, #52]
	cmp	ip, #0
	bne	.L4
	ldr	ip, [r0, #48]
	cmp	ip, #1
	moveq	ip, #2
	streq	ip, [r0, #48]
	beq	.L6
	cmp	ip, #2
	moveq	ip, #3
	movne	ip, #1
	str	ip, [r0, #48]
.L6:
	ldr	ip, .L34+8
	ldr	r4, [ip]
	tst	r4, #1
	beq	.L9
	ldr	r4, .L34+12
	ldr	r4, [r4]
	ands	r4, r4, #1
	beq	.L11
.L10:
	ldr	r4, [r0, #52]
	cmp	r4, #8
	beq	.L31
.L9:
	mov	r2, #0
	ldr	ip, [ip]
	tst	ip, #64
	str	r2, [r0, #36]
	beq	.L13
	ldr	r2, .L34+12
	ldr	r2, [r2]
	tst	r2, #64
	beq	.L32
.L13:
	ldr	r2, [r0, #28]
	add	r1, r1, r2
	cmp	r1, #159
	bgt	.L17
	ldr	r2, [r0, #16]
.L18:
	ldr	r1, [r0, #40]
	add	r2, r2, r1
	add	r3, r2, r3
	str	r3, [r0]
	str	r2, [r0, #16]
.L17:
	cmp	r3, #30976
	movge	r3, #30720
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	strge	r3, [r0]
	bx	lr
.L3:
	cmp	r1, #109
	bgt	.L4
	ldr	ip, [r0, #52]
	cmp	ip, #0
	beq	.L33
.L4:
	ldr	ip, .L34+8
	ldr	r4, [ip]
	tst	r4, #1
	beq	.L10
	ldr	r4, .L34+12
	ldr	r4, [r4]
	ands	r4, r4, #1
	beq	.L11
	b	.L10
.L32:
	mov	r1, #1
	ldr	r2, .L34+16
	str	r1, [r0, #36]
	b	.L18
.L11:
	mov	r6, #8
	ldr	r5, .L34+20
	smull	r7, r5, r2, r5
	rsb	lr, lr, r5, asr #3
	add	lr, lr, lr, lsl #2
	cmp	r2, lr, asl #2
	str	r4, [r0, #48]
	str	r6, [r0, #52]
	bne	.L9
.L15:
	mov	r2, #1
	str	r2, [r0, #48]
	b	.L9
.L33:
	mov	r4, #2
	ldr	ip, .L34+8
	ldr	r5, [ip]
	tst	r5, #1
	str	r4, [r0, #48]
	beq	.L9
	ldr	r4, .L34+12
	ldr	r4, [r4]
	ands	r4, r4, #1
	beq	.L11
	b	.L10
.L31:
	ldr	r4, .L34+20
	smull	r5, r4, r2, r4
	rsb	lr, lr, r4, asr #3
	add	lr, lr, lr, lsl #2
	subs	r2, r2, lr, asl #2
	bne	.L9
	ldr	lr, [r0, #48]
	cmp	lr, #0
	movne	lr, #1
	strne	r2, [r0, #52]
	strne	lr, [r0, #48]
	bne	.L9
	b	.L15
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.word	2021161081
	.word	oldButtons
	.word	buttons
	.word	-600
	.word	1717986919
	.size	updateSpongebob, .-updateSpongebob
	.align	2
	.global	playerCollide
	.type	playerCollide, %function
playerCollide:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	ip, [r0, #24]
	ldr	r7, [r0, #4]
	ldr	r3, [r1, #4]
	add	ip, r7, ip
	sub	ip, ip, #8
	add	lr, r3, #4
	rsb	r2, ip, lr
	rsbs	r5, r2, #0
	adc	r5, r5, r2
	ldr	r2, [r0]
	ldr	r0, [r1]
	mov	r2, r2, asr #8
	add	r6, r2, #28
	add	r4, r0, #16
	cmp	r4, r6
	movgt	r8, #0
	andle	r8, r5, #1
	add	r2, r2, #8
	cmp	r4, r2
	movle	r8, #0
	andgt	r8, r8, #1
	cmp	r8, #0
	bne	.L39
	cmp	lr, ip
	movge	ip, #0
	movlt	ip, #1
	add	r3, r3, #12
	add	r7, r7, #4
	cmp	r3, r7
	movle	r3, #0
	movgt	r3, #1
	cmp	r4, r2
	movne	r4, #0
	andeq	r4, ip, #1
	tst	r3, r4
	bne	.L39
	add	r0, r0, #10
	cmp	r0, r6
	movgt	r5, #0
	andle	r5, r5, #1
	cmp	r0, r2
	movle	r2, #0
	andgt	r2, r5, #1
	cmp	r2, #0
	bne	.L39
	cmp	r0, r6
	movne	r0, #0
	andeq	r0, ip, #1
	ands	r0, r3, r0
	beq	.L38
.L39:
	mov	r3, #4
	mov	r0, #1
	str	r3, [r1, #44]
.L38:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	playerCollide, .-playerCollide
	.align	2
	.global	catchJellyfish
	.type	catchJellyfish, %function
catchJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldmia	r0, {r2, r3}
	ldmia	r1, {r0, ip}
	mov	r2, r2, asr #8
	stmfd	sp!, {r4, r5, r6, r7, lr}
	add	r1, r0, #14
	add	lr, r2, #12
	add	r2, r2, #24
	cmp	r2, r1
	movge	r7, #1
	movlt	r7, #0
	add	r5, r3, #28
	cmp	lr, r1
	add	r4, ip, #4
	movge	r7, #0
	cmp	r5, r4
	movne	r6, #0
	moveq	r6, #1
	tst	r6, r7
	bne	.L45
	add	r3, r3, #24
	add	ip, ip, #12
	cmp	r3, ip
	movge	r3, #0
	movlt	r3, #1
	cmp	r5, r4
	movle	r3, #0
	cmp	lr, r1
	movne	r1, #0
	andeq	r1, r3, #1
	cmp	r1, #0
	bne	.L45
	cmp	r2, r0
	movge	r1, #1
	movlt	r1, #0
	cmp	lr, r0
	movge	r1, #0
	tst	r6, r1
	bne	.L45
	cmp	r2, r0
	movne	r0, #0
	andeq	r0, r3, #1
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L45:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
	.size	catchJellyfish, .-catchJellyfish
	.align	2
	.global	playerOffScreen
	.type	playerOffScreen, %function
playerOffScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	ldr	r3, [r0, #28]
	add	r0, r3, r2, asr #8
	mov	r0, r0, lsr #31
	bx	lr
	.size	playerOffScreen, .-playerOffScreen
	.align	2
	.global	updatePlusFive
	.type	updatePlusFive, %function
updatePlusFive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	sub	r3, r2, #1
	cmp	r3, #20
	str	r3, [r0]
	movle	r3, #0
	ldr	r1, [r0, #4]
	str	r2, [r0, #8]
	str	r1, [r0, #12]
	strle	r3, [r0, #56]
	bx	lr
	.size	updatePlusFive, .-updatePlusFive
	.align	2
	.global	updateObstacle
	.type	updateObstacle, %function
updateObstacle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L55
	ldr	ip, [r0, #4]
	ldr	r3, [r2, #4]
	sub	r1, ip, #1
	cmp	r1, #0
	add	r3, r3, #1
	str	lr, [sp, #-4]!
	ldr	lr, [r0]
	str	r3, [r2, #4]
	movle	r2, #0
	strle	r2, [r0, #24]
	ldr	r2, .L55+4
	str	r1, [r0, #4]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #4
	add	r1, r2, r2, lsl #1
	rsb	r2, r2, r1, lsl #3
	subs	r3, r3, r2
	str	lr, [r0, #8]
	str	ip, [r0, #12]
	bne	.L50
	ldr	r2, [r0, #44]
	cmp	r2, #0
	moveq	r3, #2
	str	r3, [r0, #44]
.L50:
	ldr	lr, [sp], #4
	bx	lr
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.word	-1307163959
	.size	updateObstacle, .-updateObstacle
	.align	2
	.global	spawnObstacle
	.type	spawnObstacle, %function
spawnObstacle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	stmfd	sp!, {r4, lr}
	ldr	r3, .L59
	str	r2, [r0, #24]
	mov	r4, r0
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+4
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #6
	add	r3, r3, r3, lsl #1
	ldr	r2, [r4, #20]
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, asl #1
	rsb	r2, r2, #240
	rsb	r3, r3, #130
	str	r2, [r4, #4]
	str	r3, [r4]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	rand
	.word	-1240768329
	.size	spawnObstacle, .-spawnObstacle
	.global	obCounter
	.global	aniCounter
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	aniCounter, %object
	.size	aniCounter, 4
aniCounter:
	.space	4
	.type	obCounter, %object
	.size	obCounter, 4
obCounter:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
