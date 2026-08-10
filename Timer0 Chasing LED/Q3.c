// Program to use Timer0 of PIC18F4550 Microcontroller
void T0_init();
void main()
{
TRISB=0; // COnfigure PortB as output Port.
LATB=0x01;
T0CON=0x07; // Prescaler= 1:256, 16-bit mode, Internal Clock
while(1)
{
T0_init(); // Initialize Timer0
LATB=(LATB<<1)|(LATB>>7); // Circular right shift at PortB
}
}
void T0_init()
{
TMR0H=0xD2; // Values calculated for 1 second delay with 12MHz
crystal ;
TMR0L=0x39;
T0CON.TMR0ON=1; // Timer0 On
while(INTCON.TMR0IF==0); // Wait until TMR0IF gets flagged
T0CON.TMR0ON=0; // Timer0 Off
INTCON.TMR0IF=0; // Clear Timer0 interrupt flag
}