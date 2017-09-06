; File Name: asm_turnON.asm
; Assembly code for PIC16F877A MCU

; Turn on an LED connected to B0
; CPU configuration

processor 16f877a
include <p16f877a.inc>
__config _XT_OSC & _WDT_OFF & _PWRTE_ON

; Program
	ORG 0	;Start at address 0x00
	
	; At startup, all ports are inputs
	; Set port B to all outputs
	
	movlw B'00000000'	; w = binary 00000000
	tris PORTB		; copy w to port B control register

	; Put a 1 in the lowest bit of port B

	movlw B'00000001'	; w = binary 00000001
	movwf PORTB		; copy w to port B itself

FIN
	goto FIN

END	