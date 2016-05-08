

#include "common.h"
#include "hal_i2c.h"



//#define MMA8451_I2C_ADDRESS (0x1d<<1)
#define MMA8451_I2C_ADDRESS (0x4c<<1)  // wenxue
#define I2C0_B  I2C0_BASE_PTR
#define I2C1_B  I2C1_BASE_PTR

void hal_dev_mma8451_init(void)
{
  //hal_i2c_init(I2C0_B);
  hal_i2c_init(I2C1_B);// wenxue
}




// this delay is very important, it may cause w-r operation failure.
static void pause(void)
{
    int n;
    for(n=0; n<40; n++)
        asm("nop");
}
 void delay_wwx(void)
{
    int n;
    for(n=0; n<400; n++)
        ;
}
uint8 hal_dev_mma8451_read_reg(uint8 addr)
{
    uint8 result;

  //  i2c_start(I2C0_B);     // ������ʼ�ź� // wenxue
     //i2c_start(I2C1_B);     // ������ʼ�ź� // wenxue
     // wenxue
    while(1)  //wenxue
   {
     i2c_start(I2C1_B); 
    // i2c_start(I2C1_B);
   // i2c_start(I2C0_B);     // ������ʼ�ź�
    //i2c_write_byte(I2C0_B, MMA8451_I2C_ADDRESS | I2C_WRITE); // 0x4c+1λ0������д��=0x3A
     i2c_write_byte(I2C1_B, MMA8451_I2C_ADDRESS | I2C_WRITE); // 0x4c+1λ0������д��=0x3A
     //i2c_write_byte(I2C1_B, 0xF0); // 0x4c+1λ0������д��=0x3A
     
     i2c_wait(I2C1_B);
     i2c_get_ack(I2C1_B);  //  �ȴ��ӻ�����ACK�ź�  
     
     i2c_stop(I2C1_B);
     delay_wwx();
   //  i2c_write_byte(I2C0_B, 0x6E); // 0x1d+1λ0������д��=0x3A
   }
    
    i2c_wait(I2C0_B);
    i2c_get_ack(I2C0_B);  //  �ȴ��ӻ�����ACK�ź�

    i2c_write_byte(I2C0_B, addr);  // �Ĵ�����ַ
    i2c_wait(I2C0_B);
    i2c_get_ack(I2C0_B);  // �ȴ��ӻ�����ACK�ź�

    i2c_repeated_start(I2C0_B); // ���¿�ʼ�ź�
    i2c_write_byte(I2C0_B, MMA8451_I2C_ADDRESS | I2C_READ); //  // 0x1d+1λ1���������=0x3B
    i2c_wait(I2C0_B);
    i2c_get_ack(I2C0_B);  // �ȴ��ӻ�����ACK�ź�

    i2c_set_rx_mode(I2C0_B); // ��������Ϊ����ģʽ

    i2c_give_nack(I2C0_B);  // �������ͷ�Ӧ���źţ���ʾ���ٽ�������
    result = i2c_read_byte(I2C0_B); // ��������
    i2c_wait(I2C0_B);

    i2c_stop(I2C0_B);  // ��������ֹͣ�ź�
    result = i2c_read_byte(I2C0_B);
    pause();
    return result;
}
void hal_dev_mma8451_write_reg(uint8 addr, uint8 data)
{
    i2c_start(I2C0_B);  // ������ʼ�ź�

    i2c_write_byte(I2C0_B, MMA8451_I2C_ADDRESS|I2C_WRITE); // 0x1d+1λ0������д��=0x3A
    i2c_wait(I2C0_B);
    i2c_get_ack(I2C0_B);// �ȴ��ӻ�����ACK�ź�

    i2c_write_byte(I2C0_B, addr);// �Ĵ�����ַ
    i2c_wait(I2C0_B);
    i2c_get_ack(I2C0_B);// �ȴ��ӻ�����ACK�ź�

    i2c_write_byte(I2C0_B, data); // ����һ���ֽ�����
    i2c_wait(I2C0_B);
    i2c_get_ack(I2C0_B); // �ȴ��ӻ�����ACK�ź�

    i2c_stop(I2C0_B);// ��������ֹͣ�ź�
    pause();
}





