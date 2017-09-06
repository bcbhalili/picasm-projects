; File: picasm_forwardCounter7Segment.asm
; Authors: Bien Carlo B. Halili; Jochelle Nicolle P. Enriquez
; Description: Assembly source code for 0 to 9 forward counter

; CPU configuration
PROCESSOR 16f877a
INCLUDE <P16F877A.INC>
__config _XT_OSC & _WDT_OFF & _PWRTE_ON

; Constant Setup
STATUS EQU 03H
TRISB EQU 86H
PORTB EQU 06H
COUNT1 EQU 30H
COUNT2 EQU 31H
N EQU D'130'

; Program
	ORG 0	;Start at address 0x00
	
	; At startup, all ports are inputs
	; Set port B to all outputs
	
	movlw B'00000000'	; w = binary 00000000
	tris PORTB		; copy w to port B control register
	
; Turn on
MAIN

	movlw B'11111110'	; Do 0
	movwf PORTB

	call DELAY_LOOP

	movlw B'01110000'	; Do 1
	movwf PORTB

	call DELAY_LOOP

	movlw B'11101101'	; Do 2
	movwf PORTB

	call DELAY_LOOP

	movlw B'11111001'	; Do 3
	movwf PORTB

	call DELAY_LOOP

	movlw B'01110011'	; Do 4
	movwf PORTB

	call DELAY_LOOP

	movlw B'10111011'	; Do 5
	movwf PORTB

	call DELAY_LOOP

	movlw B'10111111'	; Do 6
	movwf PORTB

	call DELAY_LOOP

	movlw B'11110000' 	; Do 7
	movwf PORTB

	call DELAY_LOOP
	
	movlw B'11111111'	; Do 8
	movwf PORTB

	call DELAY_LOOP

	movlw B'11110011'	; Do 9
	movwf PORTB

	call DELAY_LOOP

	GOTO MAIN
	
DELAY_100MS
	MOVLW N
	MOVWF COUNT1
	CLRF COUNT2

DELAY_LOOP
	DECFSZ	COUNT1,F
	GOTO DELAY_LOOP
	DECFSZ	COUNT2,F
	GOTO DELAY_LOOP
	RETURN

END	