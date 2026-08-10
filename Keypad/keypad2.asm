
_main:

;keypad2.c,25 :: 		void main() {
;keypad2.c,26 :: 		TRISC = 0x0F;
	MOVLW      15
	MOVWF      TRISC+0
;keypad2.c,27 :: 		PORTC = 0xFF;
	MOVLW      255
	MOVWF      PORTC+0
;keypad2.c,29 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;keypad2.c,30 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;keypad2.c,31 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;keypad2.c,32 :: 		Lcd_Out(1, 1, "Key Pressed:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_keypad2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;keypad2.c,33 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;keypad2.c,35 :: 		while(1) {
L_main0:
;keypad2.c,36 :: 		lastKey = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _lastKey+0
;keypad2.c,37 :: 		if (lastKey) {
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;keypad2.c,38 :: 		switch(lastKey) {
	GOTO       L_main3
;keypad2.c,39 :: 		case  1: lastKey = '1'; break;
L_main5:
	MOVLW      49
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,40 :: 		case  2: lastKey = '2'; break;
L_main6:
	MOVLW      50
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,41 :: 		case  3: lastKey = '3'; break;
L_main7:
	MOVLW      51
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,42 :: 		case  4: lastKey = 'A'; break;
L_main8:
	MOVLW      65
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,43 :: 		case  5: lastKey = '4'; break;
L_main9:
	MOVLW      52
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,44 :: 		case  6: lastKey = '5'; break;
L_main10:
	MOVLW      53
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,45 :: 		case  7: lastKey = '6'; break;
L_main11:
	MOVLW      54
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,46 :: 		case  8: lastKey = 'B'; break;
L_main12:
	MOVLW      66
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,47 :: 		case  9: lastKey = '7'; break;
L_main13:
	MOVLW      55
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,48 :: 		case 10: lastKey = '8'; break;
L_main14:
	MOVLW      56
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,49 :: 		case 11: lastKey = '9'; break;
L_main15:
	MOVLW      57
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,50 :: 		case 12: lastKey = 'C'; break;
L_main16:
	MOVLW      67
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,51 :: 		case 13: lastKey = '*'; break;
L_main17:
	MOVLW      42
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,52 :: 		case 14: lastKey = '0'; break;
L_main18:
	MOVLW      48
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,53 :: 		case 15: lastKey = '#'; break;
L_main19:
	MOVLW      35
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,54 :: 		case 16: lastKey = 'D'; break;
L_main20:
	MOVLW      68
	MOVWF      _lastKey+0
	GOTO       L_main4
;keypad2.c,55 :: 		}
L_main3:
	MOVF       _lastKey+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVF       _lastKey+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _lastKey+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _lastKey+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _lastKey+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _lastKey+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _lastKey+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _lastKey+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _lastKey+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _lastKey+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _lastKey+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _lastKey+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _lastKey+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _lastKey+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       _lastKey+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _lastKey+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main20
L_main4:
;keypad2.c,56 :: 		text[0] = lastKey;
	MOVF       _lastKey+0, 0
	MOVWF      _text+0
;keypad2.c,57 :: 		text[1] = '\0';
	CLRF       _text+1
;keypad2.c,58 :: 		Lcd_Out(2, 1, "    ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_keypad2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;keypad2.c,59 :: 		Lcd_Out(2, 1, text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;keypad2.c,60 :: 		}
L_main2:
;keypad2.c,61 :: 		}
	GOTO       L_main0
;keypad2.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
