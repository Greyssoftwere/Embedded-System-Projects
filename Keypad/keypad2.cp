#line 1 "C:/Users/wjw14/OneDrive/Desktop/ES_Assignment/Question 5/keypad2.c"






sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

char keypadPort at PORTC;
char lastKey = 0;
char text[2];

void main() {
 TRISC = 0x0F;
 PORTC = 0xFF;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Key Pressed:");
 Keypad_Init();

 while(1) {
 lastKey = Keypad_Key_Click();
 if (lastKey) {
 switch(lastKey) {
 case 1: lastKey = '1'; break;
 case 2: lastKey = '2'; break;
 case 3: lastKey = '3'; break;
 case 4: lastKey = 'A'; break;
 case 5: lastKey = '4'; break;
 case 6: lastKey = '5'; break;
 case 7: lastKey = '6'; break;
 case 8: lastKey = 'B'; break;
 case 9: lastKey = '7'; break;
 case 10: lastKey = '8'; break;
 case 11: lastKey = '9'; break;
 case 12: lastKey = 'C'; break;
 case 13: lastKey = '*'; break;
 case 14: lastKey = '0'; break;
 case 15: lastKey = '#'; break;
 case 16: lastKey = 'D'; break;
 }
 text[0] = lastKey;
 text[1] = '\0';
 Lcd_Out(2, 1, "    ");
 Lcd_Out(2, 1, text);
 }
 }
}
