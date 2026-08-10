               // Digit pattern table from 0 to 9
// Each value determines which segments will turn ON
unsigned char seg_table[10] = {
    0x3F,   // Digit 0
    0x06,   // Digit 1
    0x5B,   // Digit 2
    0x4F,   // Digit 3
    0x66,   // Digit 4
    0x6D,   // Digit 5
    0x7D,   // Digit 6
    0x07,   // Digit 7
    0x7F,   // Digit 8
    0x6F    // Digit 9
};

void main() {

    int i;

    TRISD = 0x00;    // Set all PORTD pins as output
    PORTD = 0x00;    // Turn off all segments at the beginning

    while(1) {
        for(i = 0; i <= 9; i++) {
            PORTD = seg_table[i];  // Send the digit pattern to the display
            Delay_ms(1000);        // Wait for one second
        }
    }
}