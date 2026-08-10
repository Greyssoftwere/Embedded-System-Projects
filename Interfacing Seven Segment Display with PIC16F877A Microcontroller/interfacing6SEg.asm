
_main:

;interfacing6SEg.c,16 :: 		void main() {
;interfacing6SEg.c,20 :: 		TRISD = 0x00;    // Set all PORTD pins as output
	CLRF       TRISD+0
;interfacing6SEg.c,21 :: 		PORTD = 0x00;    // Turn off all segments at the beginning
	CLRF       PORTD+0
;interfacing6SEg.c,23 :: 		while(1) {
L_main0:
;interfacing6SEg.c,24 :: 		for(i = 0; i <= 9; i++) {
	CLRF       R1+0
	CLRF       R1+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       R1+0, 0
	SUBLW      9
L__main7:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;interfacing6SEg.c,25 :: 		PORTD = seg_table[i];  // Send the digit pattern to the display
	MOVF       R1+0, 0
	ADDLW      _seg_table+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;interfacing6SEg.c,26 :: 		Delay_ms(1000);        // Wait for one second
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;interfacing6SEg.c,24 :: 		for(i = 0; i <= 9; i++) {
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;interfacing6SEg.c,27 :: 		}
	GOTO       L_main2
L_main3:
;interfacing6SEg.c,28 :: 		}
	GOTO       L_main0
;interfacing6SEg.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
