#include "Threshold_MPU6050.h"

AccDataTypeDef AccData;
GyroDataTypeDef GyroData;

uint8_t MPU6050Init(void)
{
	uint8_t res;
	#if defined(Gpio_I2C)
	
		Threshold_GpioI2C_Init();//��ʼ��IIC����
		
	#elif defined(Hardware_I2C)

		//Threshold_I2C_Init();
	
	#endif
	Threshold_Systick_Ms(100);
	
	MPU_Write_Byte(MPU_PWR_MGMT1_REG,0X88);	//��λMPU6050 �ر��¶��������� 0X80
    
	MPU_Write_Byte(MPU_PWR_MGMT1_REG,0X00);	//����MPU6050 
	MPU_Set_Gyro_Fsr(3);	//�����Ǵ�����,��2000dps
	MPU_Set_Accel_Fsr(0);	//���ٶȴ�����,��2g
	MPU_Set_Rate(200);			//���ò�����200Hz
	MPU_Write_Byte(MPU_INT_EN_REG,0X00);	//�ر������ж�
	MPU_Write_Byte(MPU_USER_CTRL_REG,0X00);	//I2C��ģʽ�ر�
	MPU_Write_Byte(MPU_FIFO_EN_REG,0X00);	//�ر�FIFO
	MPU_Write_Byte(MPU_INTBP_CFG_REG,0X80);	//INT���ŵ͵�ƽ��Ч
	res = MPU_Read_Byte(MPU_DEVICE_ID_REG);
	printf("res is %d \r\n",res);
	if(res == MPU_ADDR)//����ID��ȷ
	{
		MPU_Write_Byte(MPU_PWR_MGMT1_REG,0X01);	//����CLKSEL,PLL X��Ϊ�ο�
		MPU_Write_Byte(MPU_PWR_MGMT2_REG,0X00);	//���ٶ��������Ƕ�����
		MPU_Set_Rate(200);						//���ò�����Ϊ200Hz
		printf("MPU ID right ! \r\n");
 	}
	else 
		return false;

	return true;
}

//����MPU6050�����Ǵ����������̷�Χ
//fsr:0,��250dps;1,��500dps;2,��1000dps;3,��2000dps
//����ֵ:0,���óɹ�
//    ����,����ʧ�� 
uint8_t MPU_Set_Gyro_Fsr(uint8_t fsr)
{
	return MPU_Write_Byte(MPU_GYRO_CFG_REG,fsr<<3);//���������������̷�Χ  
}
//����MPU6050���ٶȴ����������̷�Χ
//fsr:0,��2g;1,��4g;2,��8g;3,��16g
//����ֵ:0,���óɹ�
//    ����,����ʧ�� 
uint8_t MPU_Set_Accel_Fsr(uint8_t fsr)
{
	return MPU_Write_Byte(MPU_ACCEL_CFG_REG,fsr<<3);//���ü��ٶȴ����������̷�Χ  
}
//����MPU6050�����ֵ�ͨ�˲���
//lpf:���ֵ�ͨ�˲�Ƶ��(Hz)
//����ֵ:0,���óɹ�
//    ����,����ʧ�� 
uint8_t MPU_Set_LPF(uint16_t lpf)
{
	uint8_t data=0;
	if(lpf>=188)data=1;
	else if(lpf>=98)data=2;
	else if(lpf>=42)data=3;
	else if(lpf>=20)data=4;
	else if(lpf>=10)data=5;
	else data=6; 
	return MPU_Write_Byte(MPU_CFG_REG,data);//�������ֵ�ͨ�˲���  
}
//����MPU6050�Ĳ�����(�ٶ�Fs=1KHz)
//rate:4~1000(Hz)
//����ֵ:0,���óɹ�
//    ����,����ʧ�� 
uint8_t MPU_Set_Rate(uint16_t rate)
{
	uint8_t data;
	if(rate>1000)rate=1000;
	if(rate<4)rate=4;
	data=1000/rate-1;
	data=MPU_Write_Byte(MPU_SAMPLE_RATE_REG,data);	//�������ֵ�ͨ�˲���
 	return MPU_Set_LPF(rate/2);	//�Զ�����LPFΪ�����ʵ�һ��
}

//�õ��¶�ֵ
//����ֵ:�¶�ֵ(������100��)
short MPU_Get_Temperature(void)
{
    uint8_t buf[2]; 
    short raw;
	float temp;
	MPU_Read_Len(MPU_ADDR,MPU_TEMP_OUTH_REG,2,buf); 
    raw=((uint16_t)buf[0]<<8)|buf[1];  
    temp=36.53+((double)raw)/340;  
    return temp*100;;
}
//�õ�������ֵ(ԭʼֵ)
//gx,gy,gz:������x,y,z���ԭʼ����(������)
//����ֵ:0,�ɹ�
//    ����,�������
void MPU_Get_Gyroscope()
{
	uint8_t buf[6]; 
	MPU_Read_Len(MPU_ADDR,MPU_GYRO_XOUTH_REG,6,buf);
	//HAL_I2C_Mem_Read(&I2CxHandle,(MPU_ADDR<<1),MPU_GYRO_XOUTH_REG,I2C_MEMADD_SIZE_8BIT,buf,6,200);
	GyroData.x=((uint16_t)buf[0]<<8)|buf[1];  
	GyroData.y=((uint16_t)buf[2]<<8)|buf[3];  
  	GyroData.z=((uint16_t)buf[4]<<8)|buf[5];
}
//�õ����ٶ�ֵ(ԭʼֵ)
//gx,gy,gz:������x,y,z���ԭʼ����(������)
//����ֵ:0,�ɹ�
//    ����,�������
void MPU_Get_Accelerometer()
{
    uint8_t buf[6];  
	MPU_Read_Len(MPU_ADDR,MPU_ACCEL_XOUTH_REG,6,buf);
	AccData.x=((uint16_t)buf[0]<<8)|buf[1];  
	AccData.y=((uint16_t)buf[2]<<8)|buf[3];  
	AccData.z=((uint16_t)buf[4]<<8)|buf[5];
}

//IIC����д
//addr:������ַ 
//reg:�Ĵ�����ַ
//len:д�볤��
//buf:������
//����ֵ:0,����
//    ����,�������
uint8_t MPU_Write_Len(uint8_t addr,uint8_t reg,uint8_t len,uint8_t *buf)
{
	#if defined(Gpio_I2C)
	
		uint8_t i; 
    	IIC_Start(); 
		IIC_Send_Byte((addr<<1)|0);//����������ַ+д����	
		if(IIC_Wait_Ack())	//�ȴ�Ӧ��
		{
			IIC_Stop();		 
			return 1;		
		}
	    IIC_Send_Byte(reg);	//д�Ĵ�����ַ
	    IIC_Wait_Ack();		//�ȴ�Ӧ��
		for(i=0;i<len;i++)
		{
			IIC_Send_Byte(buf[i]);	//��������
			if(IIC_Wait_Ack())		//�ȴ�ACK
			{
				IIC_Stop();	 
				return 1;		 
			}		
		}    
    	IIC_Stop();	 
		return 0;	
		
	#elif defined(Hardware_I2C)

		Threshold_I2C_MasterSendBytes((addr),reg,buf,len);
		
		return 0;
		
	#endif
} 
//IIC������
//addr:������ַ
//reg:Ҫ��ȡ�ļĴ�����ַ
//len:Ҫ��ȡ�ĳ���
//buf:��ȡ�������ݴ洢��
//����ֵ:0,����
//    ����,�������
uint8_t MPU_Read_Len(uint8_t addr,uint8_t reg,uint8_t len,uint8_t *buf)
{ 
	#if defined(Gpio_I2C)
	
		IIC_Start(); 
		IIC_Send_Byte((addr<<1)|0);//����������ַ+д����	
		if(IIC_Wait_Ack())	//�ȴ�Ӧ��
		{
			IIC_Stop();		 
			return 1;		
		}
	    IIC_Send_Byte(reg);	//д�Ĵ�����ַ
	    IIC_Wait_Ack();		//�ȴ�Ӧ��
	    IIC_Start();
		IIC_Send_Byte((addr<<1)|1);//����������ַ+������	
    	IIC_Wait_Ack();		//�ȴ�Ӧ�� 
		while(len)
		{
			if(len==1)*buf=IIC_Read_Byte(0);//������,����nACK 
			else *buf=IIC_Read_Byte(1);		//������,����ACK  
			len--;
			buf++; 
		}    
    	IIC_Stop();	//����һ��ֹͣ���� 
		return 0;	
		
	#elif defined(Hardware_I2C)
		
		Threshold_I2C_MasterRecvBytes((addr),reg,buf,len);
		
		return 0;
		
	#endif
}
//IICдһ���ֽ� 
//reg:�Ĵ�����ַ
//data:����
//����ֵ:0,����
//    ����,�������
uint8_t MPU_Write_Byte(uint8_t reg,uint8_t data) 				 
{ 
	#if defined(Gpio_I2C)
	
    	IIC_Start(); 
		IIC_Send_Byte((MPU_ADDR<<1)|0);//����������ַ+д����	
		if(IIC_Wait_Ack())	//�ȴ�Ӧ��
		{
			IIC_Stop();		 
			return 1;		
		}
    	IIC_Send_Byte(reg);	//д�Ĵ�����ַ
    	IIC_Wait_Ack();		//�ȴ�Ӧ�� 
		IIC_Send_Byte(data);//��������
		if(IIC_Wait_Ack())	//�ȴ�ACK
		{
			IIC_Stop();	 
			return 1;		 
		}		 
   	 	IIC_Stop();	 
		return 0;
		
	#elif defined(Hardware_I2C)
	
		Threshold_I2C_MasterSendOneByte((MPU_ADDR),reg,&data);
		
		return 0;
		
	#endif
}
//IIC��һ���ֽ� 
//reg:�Ĵ�����ַ 
//����ֵ:����������
uint8_t MPU_Read_Byte(uint8_t reg)
{
	#if defined(Gpio_I2C)
	
		uint8_t res;
	    IIC_Start(); 
		IIC_Send_Byte((MPU_ADDR<<1)|0);//����������ַ+д����	
		IIC_Wait_Ack();		//�ȴ�Ӧ�� 
	    IIC_Send_Byte(reg);	//д�Ĵ�����ַ
	    IIC_Wait_Ack();		//�ȴ�Ӧ��
	    IIC_Start();
		IIC_Send_Byte((MPU_ADDR<<1)|1);//����������ַ+������	
	    IIC_Wait_Ack();		//�ȴ�Ӧ�� 
		res=IIC_Read_Byte(0);//��ȡ����,����nACK 
	    IIC_Stop();			//����һ��ֹͣ���� 
		return res;		
	
	#elif defined(Hardware_I2C)
		
		uint8_t data;
		Threshold_I2C_MasterRecvOneByte((MPU_ADDR),reg,&data);
		return data;
	
	#endif
}


