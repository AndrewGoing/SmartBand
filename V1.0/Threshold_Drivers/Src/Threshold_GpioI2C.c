#include "Threshold_GpioI2C.h"

void Threshold_GpioI2C_Init(void)
{
	//SCL
	Threshold_HardWare_GPIO_Init(I2C_SCL_GPIOx,I2C_SCL_Pin,GPIO_MODE_OUTPUT_OD,GPIO_PULLUP,GPIO_SPEED_FREQ_HIGH);
	//SDA
	Threshold_HardWare_GPIO_Init(I2C_SDA_GPIOx,I2C_SDA_Pin,GPIO_MODE_OUTPUT_OD,GPIO_PULLUP,GPIO_SPEED_FREQ_HIGH);
}

void GpioSDA_In(void)
{
	Threshold_HardWare_GPIO_Init(I2C_SDA_GPIOx,I2C_SDA_Pin,GPIO_MODE_INPUT,GPIO_MODE_OUTPUT_OD,GPIO_SPEED_FREQ_HIGH);
}

void GpioSDA_Out(void)
{
	Threshold_HardWare_GPIO_Init(I2C_SDA_GPIOx,I2C_SDA_Pin,GPIO_MODE_OUTPUT_OD,GPIO_PULLUP,GPIO_SPEED_FREQ_HIGH);
}


void DelayUs(int Us)
{
	int i = 0;
	for(i = 0;i < Us*5; i++)
	{
	}
}

//����IIC��ʼ�ź�
void IIC_Start(void)
{
	GpioSDA_Out();     //sda�����
	IIC_SDA_high();
	DelayUs(3);
	IIC_SCL_high();
	DelayUs(3);
 	IIC_SDA_low();//START:when CLK is high,DATA change form high to low 
	DelayUs(3);
	IIC_SCL_low();//ǯסI2C���ߣ�׼�����ͻ�������� 
}	  


//����IICֹͣ�ź�
void IIC_Stop(void)
{
	GpioSDA_Out();//sda�����
	IIC_SCL_low();
	DelayUs(3);
	IIC_SDA_low();//STOP:when CLK is high DATA change form low to high
 	DelayUs(3);
	IIC_SCL_high();
	DelayUs(3);
	IIC_SDA_high();//����I2C���߽����ź�
	DelayUs(3);							   	
}

//�ȴ�Ӧ���źŵ���
//����ֵ��1������Ӧ��ʧ��
//        0������Ӧ��ɹ�
uint8_t IIC_Wait_Ack(void)
{
	uint8_t ucErrTime=0;
	GpioSDA_In();      //SDA����Ϊ����  
	IIC_SDA_high();
	DelayUs(3);	   
	IIC_SCL_high();
	DelayUs(3);	 
	while(II2_SDA_in)
	{
		ucErrTime++;
		if(ucErrTime>200)
		{
			IIC_Stop();
			return 1;
		}
	}
	IIC_SCL_low();//ʱ�����0 	   
	return 0;  
} 


//����ACKӦ��
void IIC_Ack(void)
{
	IIC_SCL_low();
	GpioSDA_Out();
	IIC_SDA_low();
	DelayUs(3);
	IIC_SCL_high();
	DelayUs(3);
	IIC_SCL_low();
}


//������ACKӦ��		    
void IIC_NAck(void)
{
	IIC_SCL_low();
	GpioSDA_Out();
	IIC_SDA_high();
	DelayUs(3);
	IIC_SCL_high();
	DelayUs(3);
	IIC_SCL_low();
}		


//IIC����һ���ֽ�
//���شӻ�����Ӧ��
//1����Ӧ��
//0����Ӧ��			  
void IIC_Send_Byte(uint8_t txd)
{                        
    uint8_t t;   
		GpioSDA_Out(); 	    
    IIC_SCL_low();//����ʱ�ӿ�ʼ���ݴ���
    for(t=0;t<8;t++)
    {              
        //IIC_SDA=(txd&0x80)>>7;
			if((txd&0x80)>>7)
				IIC_SDA_high();
			else
				IIC_SDA_low();
			txd<<=1; 	  
			DelayUs(3);   //��TEA5767��������ʱ���Ǳ����
			IIC_SCL_high();
			DelayUs(3); 
			IIC_SCL_low();	
			DelayUs(3);
    }	 
} 	

//��1���ֽڣ�ack=1ʱ������ACK��ack=0������nACK   
uint8_t IIC_Read_Byte(unsigned char ack)
{
	unsigned char i,receive=0;
	GpioSDA_In();//SDA����Ϊ����
    for(i=0;i<8;i++ )
		{
        IIC_SCL_low(); 
        DelayUs(3);
				IIC_SCL_high();
        receive<<=1;
        if(II2_SDA_in)
				{
					receive++;   
				}
				DelayUs(3); 
    }					 
    if(!ack)
        IIC_NAck();//����nACK
    else
        IIC_Ack(); //����ACK   
    return receive;
}

uint8_t I2C_Write_Len(uint8_t addr,uint8_t reg,uint8_t len,uint8_t *buf)
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
    IIC_Send_Byte(reg);
    IIC_Wait_Ack();	
		for(i=0;i<len;i++)
		{
			IIC_Send_Byte(buf[i]);
			if(IIC_Wait_Ack())	
			{
				IIC_Stop();	 
				return 1;		 
			}		
		}    
    IIC_Stop();	 
		return 0;	
		
	#elif defined(Hardware_I2C)
		
		return 0;
		
	#endif
} 

uint8_t I2C_Read_Len(uint8_t addr,uint8_t reg,uint8_t len,uint8_t *buf)
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
		
		return 0;
		
	#endif
}
