module top_contadores (
    input wire clk,             // Reloj principal (50 MHz)
    input wire rst,             // Reset general (Active-Low)
    input wire btn_bin,         // Botón Play/Pause Binario (Active-Low)
    input wire btn_bcd,         // Botón Play/Pause BCD (Active-Low)
    input wire btn_sexa,        // Botón Play/Pause Sexagesimal (Active-Low)
    output wire [3:0] led_bin,  // Salida LEDs Binario
    output wire [3:0] led_bcd,  // Salida LEDs BCD
    output wire [5:0] led_sexa  // Salida LEDs Sexagesimal
);