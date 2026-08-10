#line 1 "C:/Users/wjw14/OneDrive/Desktop/ES_Assignment/Question 3/Q3.c"

void T0_init();
void main()
{
TRISB=0;
LATB=0x01;
T0CON=0x07;
while(1)
{
T0_init();
LATB=(LATB<<1)|(LATB>>7);
}
}
void T0_init()
{
TMR0H=0xD2;
crystal ;
TMR0L=0x39;
T0CON.TMR0ON=1;
while(INTCON.TMR0IF==0);
T0CON.TMR0ON=0;
INTCON.TMR0IF=0;
}
