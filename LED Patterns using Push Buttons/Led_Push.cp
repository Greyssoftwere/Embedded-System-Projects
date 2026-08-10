#line 1 "C:/Users/wjw14/OneDrive/Desktop/Led_Push.c"





void main(void) {

 ADCON1 = 0x0F;
 TRISA = 0xFF;
 TRISC = 0x00;
 PORTC = 0x00;

 while(1) {

 if ( PORTA.F0  == 1) {
 PORTC = 0xFF;

 } else if ( PORTA.F1  == 1) {
 PORTC = 0x0F;

 } else if ( PORTA.F2  == 1) {
 PORTC = 0xAA;

 } else if ( PORTA.F3  == 1) {
 PORTC = 0xF0;

 } else {
 PORTC = 0x00;
 }
 }
}
