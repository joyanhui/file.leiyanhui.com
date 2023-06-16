// import time
// import tempSensor
// tempSensor.init()
// for _ in range(10):
//     print(tempSensor.getT())
//     time.sleep(1)
// tempSensor.stop()
#include "py/obj.h"
#include "py/runtime.h" // Include MicroPython API.

#if CONFIG_IDF_TARGET_ESP32S2 || CONFIG_IDF_TARGET_ESP32C3 || CONFIG_IDF_TARGET_ESP32S3
#include "driver/temp_sensor.h"
#endif

// ���� ��ʼ�� ������
STATIC mp_obj_t tempSensor_init(void) {
     #if CONFIG_IDF_TARGET_ESP32S2 || CONFIG_IDF_TARGET_ESP32C3 || CONFIG_IDF_TARGET_ESP32S3
	temp_sensor_config_t temp_sensor = TSENS_CONFIG_DEFAULT();
	temp_sensor.dac_offset = TSENS_DAC_DEFAULT; // DEFAULT: range:-10�� ~  80��, error < 1��.
	temp_sensor_set_config(temp_sensor);
	temp_sensor_start();
     #endif
   return mp_const_none;
}
// �������
STATIC MP_DEFINE_CONST_FUN_OBJ_0(tempSensor_init_obj, tempSensor_init);

// ���� ��ȡ
STATIC mp_obj_t tempSensor_getT(void) {
     #if CONFIG_IDF_TARGET_ESP32S2 || CONFIG_IDF_TARGET_ESP32C3 || CONFIG_IDF_TARGET_ESP32S3
	float tsens_out;
  	temp_sensor_read_celsius(&tsens_out);
	//temp_sensor_stop();
	return mp_obj_new_float(tsens_out);
     #endif
   return mp_const_none;
}
// �������
STATIC MP_DEFINE_CONST_FUN_OBJ_0(tempSensor_getT_obj, tempSensor_getT);

// ���� ֹͣ
STATIC mp_obj_t tempSensor_stop(void) {
     #if CONFIG_IDF_TARGET_ESP32S2 || CONFIG_IDF_TARGET_ESP32C3 || CONFIG_IDF_TARGET_ESP32S3
	temp_sensor_stop();
     #endif
   return mp_const_none;
}
// �������
STATIC MP_DEFINE_CONST_FUN_OBJ_0(tempSensor_stop_obj, tempSensor_stop);


// ����ģ����������ԡ�
// ����Ŀ���������ƣ��ַ������ļ�/ֵ��
// �� MicroPython �������á�
// ���еı�ʶ�����ַ�����д�� MP_QSTR_xxx ���һᱻ
// �ɹ���ϵͳ�Ż�Ϊ�ִ�С��������פ���ַ�����.
STATIC const mp_rom_map_elem_t tempSensor_module_globals_table[] = {
    { MP_ROM_QSTR(MP_QSTR___name__), MP_ROM_QSTR(MP_QSTR_tempSensor) },
    { MP_ROM_QSTR(MP_QSTR_getT), MP_ROM_PTR(&tempSensor_getT_obj) },
    { MP_ROM_QSTR(MP_QSTR_init), MP_ROM_PTR(&tempSensor_init_obj) },
    { MP_ROM_QSTR(MP_QSTR_stop), MP_ROM_PTR(&tempSensor_stop_obj) },
};
STATIC MP_DEFINE_CONST_DICT(tempSensor_module_globals, tempSensor_module_globals_table);

// ����ģ�����
const mp_obj_module_t tempSensor_user_cmodule = {
    .base = { &mp_type_module },
    .globals = (mp_obj_dict_t *)&tempSensor_module_globals,
};

// ע��ģ����ʹ���� Python �п���  ���� �����������
MP_REGISTER_MODULE(MP_QSTR_tempSensor, tempSensor_user_cmodule);
