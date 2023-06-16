#include "driver/temp_sensor.h"
void setup() 
{
  Serial.begin(115200);
  temp_sensor_config_t temp_sensor = {
    .dac_offset = TSENS_DAC_L2,
    .clk_div = 6,
  };
  temp_sensor_set_config(temp_sensor);
  temp_sensor_start();
}
void loop() 
{
  float tsens_out;
  temp_sensor_read_celsius(&tsens_out);
  Serial.printf("%f\r\n", tsens_out);
  delay(500);
}