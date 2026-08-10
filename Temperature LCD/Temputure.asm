
_main:

;Temputure.c,26 :: 		void main(){
;Temputure.c,28 :: 		ADCON1 = 0b00001110;  // Configure RA0 as analog input, rest as digital
	MOVLW       14
	MOVWF       ADCON1+0 
;Temputure.c,29 :: 		TRISA.RA0 = 1;        // Set RA0 pin as input (to receive sensor signal)
	BSF         TRISA+0, 0 
;Temputure.c,30 :: 		TRISB = 0b00000000;   // Set all PORTB pins as output (for LCD)
	CLRF        TRISB+0 
;Temputure.c,31 :: 		PORTB = 0;            // Initialize all PORTB pins to LOW (0)
	CLRF        PORTB+0 
;Temputure.c,33 :: 		ADC_Init();           // Initialize the ADC module
	CALL        _ADC_Init+0, 0
;Temputure.c,34 :: 		Lcd_Init();           // Initialize the LCD module
	CALL        _Lcd_Init+0, 0
;Temputure.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear the LCD screen
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Temputure.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn off the cursor on LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Temputure.c,39 :: 		Lcd_Out(1, 1, "Hello World");  // Print "Hello World" on row 1, column 1
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Temputure+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Temputure+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temputure.c,40 :: 		Lcd_Out(2, 1, "LCD Display");  // Print "LCD Display" on row 2, column 1
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Temputure+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Temputure+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temputure.c,41 :: 		delay_ms(300);                 // Wait 300ms so user can read the message
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;Temputure.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);           // Clear the screen before main loop
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Temputure.c,44 :: 		while(1){  // Infinite loop - keep reading and displaying temperature
L_main1:
;Temputure.c,46 :: 		value = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _value+0 
	MOVF        R1, 0 
	MOVWF       _value+1 
;Temputure.c,50 :: 		temp = (value * 0.48876);
	CALL        _word2double+0, 0
	MOVLW       192
	MOVWF       R4 
	MOVLW       62
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
	MOVF        R2, 0 
	MOVWF       _temp+2 
	MOVF        R3, 0 
	MOVWF       _temp+3 
;Temputure.c,55 :: 		Lcd_Out(1, 1, "Temperature = ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Temputure+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Temputure+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temputure.c,58 :: 		FloatToStr(temp, temp_string);
	MOVF        _temp+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _temp+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _temp+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _temp+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _temp_string+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_temp_string+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Temputure.c,62 :: 		Lcd_Out(2, 1, temp_string);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _temp_string+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_temp_string+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temputure.c,65 :: 		Lcd_Chr(2, 9, 223);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       223
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Temputure.c,69 :: 		Lcd_Out_Cp("C");
	MOVLW       ?lstr4_Temputure+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_Temputure+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Temputure.c,72 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
;Temputure.c,75 :: 		}
	GOTO        L_main1
;Temputure.c,76 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
