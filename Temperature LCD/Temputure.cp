#line 1 "C:/Users/wjw14/OneDrive/Desktop/ES_Assignment/Question 4/Temputure.c"



sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;


sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;




unsigned int value;
float temp;
char temp_string[15];

void main(){

 ADCON1 = 0b00001110;
 TRISA.RA0 = 1;
 TRISB = 0b00000000;
 PORTB = 0;

 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 Lcd_Out(1, 1, "Hello World");
 Lcd_Out(2, 1, "LCD Display");
 delay_ms(300);
 Lcd_Cmd(_LCD_CLEAR);

 while(1){

 value = ADC_Read(0);



 temp = (value * 0.48876);




 Lcd_Out(1, 1, "Temperature = ");


 FloatToStr(temp, temp_string);



 Lcd_Out(2, 1, temp_string);


 Lcd_Chr(2, 9, 223);



 Lcd_Out_Cp("C");


 delay_ms(200);


 }
}
