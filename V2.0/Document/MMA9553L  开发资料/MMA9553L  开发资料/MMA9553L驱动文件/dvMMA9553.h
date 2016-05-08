#ifndef __DV_MMA9553_H__
#define __DV_MMA9553_H__

/******************************************************************** 
*          �궨��
********************************************************************/ 
#define MMA9553_Slave_Addr  0x4C 
#define MMA9553_Sub_Addr    0x00

#define RESERVED_APPID      20      // APP_IDԤ���Ʋ����ڲ����� 
#define PEDOMETER_APPID     21      // APP_ID�ļƲ�����װ�ӿ�
typedef struct
{
    unsigned char Type;
    unsigned char Cmd;
    unsigned char Addr;
    unsigned char Len;
    unsigned short Data[8];
}MMA9553_CMD;

typedef struct
{
    unsigned short Status;      // 0x0 ״̬�Ĵ���
    unsigned short StepCount;   // 0x2 ��������
    unsigned short Distance;    // 0x4 ����
    unsigned short Speed;       // 0x6 �ٶ�
    unsigned short Calories;    // 0x8 ��·��
    unsigned short SleepCount;  // 0xA ˯�߼�����
    unsigned short Progress;    // ��ɽ��Ȱٷֱ�
}PM_Status;

#define MMA9553_SCK_H()     GpioSetBit(MMA9553_SCK_PORT, MMA9553_SCK_PIN)
#define MMA9553_SCK_L()     GpioClrBit(MMA9553_SCK_PORT, MMA9553_SCK_PIN)

#define MMA9553_SDA_H()     GpioSetBit(MMA9553_SDA_PORT, MMA9553_SDA_PIN)
#define MMA9553_SDA_L()     GpioClrBit(MMA9553_SDA_PORT, MMA9553_SDA_PIN)

#define MMA9553_SDA_OUT()   GpioDDR_Out(MMA9553_SDA_PORT, MMA9553_SDA_PIN)
#define MMA9553_SDA_IN()    GpioDDR_In(MMA9553_SDA_PORT, MMA9553_SDA_PIN)

#define MMA9553_Delay()     delay_us(10)
#define MMA9553_Delay3()     delay_us(9)
#define MMA9553_Delay2()     delay_us(6)
#define MMA9553_Delay5()     delay_us(15)

#define MMA9553_GetInt()    gpio_input(MMA9553_GINT_PORT,MMA9553_GINT_PIN)

/******************************************************************** 
*         ȫ�ֱ��� 
********************************************************************/
extern PM_Status m_status;
extern MMA9553_CMD m_cmddata;

/******************************************************************** 
*         ��������
********************************************************************/ 
void pedometer_main(void);
void pedometer_init(void);
void pedometer_reset(void);
void pedometer_enable(void);
void pedometer_disable(void);
void pedometer_active(void);
void pedometer_write_config(void);
void pedometer_afe_config(void); // wenxue
void pedometer_wakeup(void);
void pedometer_int0_enable(void);
void pedometer_cmd_readstatus(void);
void pedometer_cmd_readconfig(void);
void pedometer_cmd__readlpfxyz(void);// wenxue
void dvMMA9553_Read(unsigned char deviceAddr,unsigned char regAddr, unsigned char *data, unsigned char len);
void dvMMA9553_Write(unsigned char deviceAddr,unsigned char regAddr, unsigned char *data, unsigned char len);
unsigned char dvMMA9553_I2C_RecvByte(void);
void dvMMA9553_I2C_SendByte(unsigned char data);
void dvMMA9553_I2C_Start(void);
void dvMMA9553_I2C_Stop(void);
void dvMMA9553_I2C_Ack(unsigned char ack);
void dvMMA9553_init(void);
#endif