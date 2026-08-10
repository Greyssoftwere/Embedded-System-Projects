         // ============================================================
// LCD Module Pin Connections (Data & Control Pins)
// ============================================================
sbit LCD_RS at RB4_bit;       // RS (Register Select) connected to RB4
sbit LCD_EN at RB5_bit;       // EN (Enable) connected to RB5
sbit LCD_D4 at RB0_bit;       // Data pin D4 connected to RB0
sbit LCD_D5 at RB1_bit;       // Data pin D5 connected to RB1
sbit LCD_D6 at RB2_bit;       // Data pin D6 connected to RB2
sbit LCD_D7 at RB3_bit;       // Data pin D7 connected to RB3

// Direction registers (1=input, 0=output) for LCD pins
sbit LCD_RS_Direction at TRISB4_bit;  // Set RB4 direction for RS
sbit LCD_EN_Direction at TRISB5_bit;  // Set RB5 direction for EN
sbit LCD_D4_Direction at TRISB0_bit;  // Set RB0 direction for D4
sbit LCD_D5_Direction at TRISB1_bit;  // Set RB1 direction for D5
sbit LCD_D6_Direction at TRISB2_bit;  // Set RB2 direction for D6
sbit LCD_D7_Direction at TRISB3_bit;  // Set RB3 direction for D7
// ============================================================
// End of LCD Module Connections
// ============================================================

unsigned int value;       // Stores the raw ADC reading (0 to 1023)
float temp;               // Stores the converted temperature in Celsius
char temp_string[15];     // String buffer to display temperature on LCD

void main(){

    ADCON1 = 0b00001110;  // Configure RA0 as analog input, rest as digital
    TRISA.RA0 = 1;        // Set RA0 pin as input (to receive sensor signal)
    TRISB = 0b00000000;   // Set all PORTB pins as output (for LCD)
    PORTB = 0;            // Initialize all PORTB pins to LOW (0)

    ADC_Init();           // Initialize the ADC module
    Lcd_Init();           // Initialize the LCD module
    Lcd_Cmd(_LCD_CLEAR);       // Clear the LCD screen
    Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn off the cursor on LCD

    // Display welcome message on LCD at startup
    Lcd_Out(1, 1, "Hello World");  // Print "Hello World" on row 1, column 1
    Lcd_Out(2, 1, "LCD Display");  // Print "LCD Display" on row 2, column 1
    delay_ms(300);                 // Wait 300ms so user can read the message
    Lcd_Cmd(_LCD_CLEAR);           // Clear the screen before main loop

    while(1){  // Infinite loop - keep reading and displaying temperature

        value = ADC_Read(0);
        // Read analog voltage from Channel 0 (RA0 where LM35 is connected)
        // Returns a value between 0 and 1023

        temp = (value * 0.48876);
        // Convert ADC reading to Celsius temperature
        // Formula: temp = (ADC_value / 1023) * 5V * 100
        // Simplified: temp = ADC_value * 0.48876

        Lcd_Out(1, 1, "Temperature = ");
        // Print the label on row 1 of LCD

        FloatToStr(temp, temp_string);
        // Convert the float temperature value to a string
        // so it can be displayed on the LCD

        Lcd_Out(2, 1, temp_string);
        // Print the temperature value on row 2, column 1

        Lcd_Chr(2, 9, 223);
        // Print the degree symbol (°) at row 2, column 9
        // ASCII code 223 = ° symbol

        Lcd_Out_Cp("C");
        // Print the letter "C" right after the degree symbol ? °C

        delay_ms(200);
        // Wait 200ms before taking the next reading
        // This prevents the LCD from updating too fast
    }
}