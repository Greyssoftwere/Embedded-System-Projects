#define BUTTON1 PORTA.F0
#define BUTTON2 PORTA.F1
#define BUTTON3 PORTA.F2
#define BUTTON4 PORTA.F3

void main(void) {

    ADCON1 = 0x0F;
    TRISA  = 0xFF;
    TRISC  = 0x00;
    PORTC  = 0x00;

    while(1) {

        if (BUTTON1 == 1) {
            PORTC = 0xFF;

        } else if (BUTTON2 == 1) {
            PORTC = 0x0F;

        } else if (BUTTON3 == 1) {
            PORTC = 0xAA;

        } else if (BUTTON4 == 1) {
            PORTC = 0xF0;

        } else {
            PORTC = 0x00;
        }
    }
}