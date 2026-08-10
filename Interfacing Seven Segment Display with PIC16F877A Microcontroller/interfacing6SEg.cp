#line 1 "C:/Users/wjw14/OneDrive/Desktop/ES_Assignment/Question 2/interfacing6SEg.c"


unsigned char seg_table[10] = {
 0x3F,
 0x06,
 0x5B,
 0x4F,
 0x66,
 0x6D,
 0x7D,
 0x07,
 0x7F,
 0x6F
};

void main() {

 int i;

 TRISD = 0x00;
 PORTD = 0x00;

 while(1) {
 for(i = 0; i <= 9; i++) {
 PORTD = seg_table[i];
 Delay_ms(1000);
 }
 }
}
