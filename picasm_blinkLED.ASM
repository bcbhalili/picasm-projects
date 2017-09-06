; File name: picasm_digitalWrite.asm

processor 16f877a
include <p16f877a.inc>
__config _XT_OSC & _WDT_OFF & _PWRTE_ON

;*****Set up the Constants****
STATUS equ 03h ;Address of the STATUS register
TRISB equ 86h ;Address of the tristate register for port A
PORTB equ 06h ;Address of Port A
COUNT1 equ 08h ;First counter for our delay loops
COUNT2 equ 09h ;Second counter for our delay loops

ORG 0H
movlw B'00000000'	; w = binary 00000000
tris PORTB		; copy w to port B control register

;****Turn the LED on****
Start movlw 02h ;Turn the LED on by first putting
movwf PORTB ;it into the w register and then
;on the port

;****Start of the delay loop 1****
Loop1 decfsz COUNT1,1 ;Subtract 1 from 255
goto Loop1 ;If COUNT is zero, carry on.
decfsz COUNT2,1 ;Subtract 1 from 255
goto Loop1 ;Go back to the start of our loop.
;This delay counts down from
;255 to zero, 255 times

;****Delay finished, now turn the LED off****
movlw 00h ;Turn the LED off by first putting
movwf PORTB ;it into the w register and then on
;the port

;****Add another delay****
Loop2 decfsz COUNT1,1 ;This second loop keeps the
goto Loop2 ;LED turned off long enough for
decfsz COUNT2,1 ;us to see it turned off
goto Loop2 ;

;****Now go back to the start of the program
goto Start ;go back to Start and turn LED
;on again

;****End of the program****
end ;Needed by some compilers,
;and also just in case we miss
;the goto instruction.