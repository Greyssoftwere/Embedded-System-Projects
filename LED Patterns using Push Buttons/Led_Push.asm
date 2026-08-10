
_main:

;Led_Push.c,6 :: 		void main(void) {
;Led_Push.c,8 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;Led_Push.c,9 :: 		TRISA  = 0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;Led_Push.c,10 :: 		TRISC  = 0x00;
	CLRF        TRISC+0 
;Led_Push.c,11 :: 		PORTC  = 0x00;
	CLRF        PORTC+0 
;Led_Push.c,13 :: 		while(1) {
L_main0:
;Led_Push.c,15 :: 		if (BUTTON1 == 1) {
	BTFSS       PORTA+0, 0 
	GOTO        L_main2
;Led_Push.c,16 :: 		PORTC = 0xFF;
	MOVLW       255
	MOVWF       PORTC+0 
;Led_Push.c,18 :: 		} else if (BUTTON2 == 1) {
	GOTO        L_main3
L_main2:
	BTFSS       PORTA+0, 1 
	GOTO        L_main4
;Led_Push.c,19 :: 		PORTC = 0x0F;
	MOVLW       15
	MOVWF       PORTC+0 
;Led_Push.c,21 :: 		} else if (BUTTON3 == 1) {
	GOTO        L_main5
L_main4:
	BTFSS       PORTA+0, 2 
	GOTO        L_main6
;Led_Push.c,22 :: 		PORTC = 0xAA;
	MOVLW       170
	MOVWF       PORTC+0 
;Led_Push.c,24 :: 		} else if (BUTTON4 == 1) {
	GOTO        L_main7
L_main6:
	BTFSS       PORTA+0, 3 
	GOTO        L_main8
;Led_Push.c,25 :: 		PORTC = 0xF0;
	MOVLW       240
	MOVWF       PORTC+0 
;Led_Push.c,27 :: 		} else {
	GOTO        L_main9
L_main8:
;Led_Push.c,28 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;Led_Push.c,29 :: 		}
L_main9:
L_main7:
L_main5:
L_main3:
;Led_Push.c,30 :: 		}
	GOTO        L_main0
;Led_Push.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
