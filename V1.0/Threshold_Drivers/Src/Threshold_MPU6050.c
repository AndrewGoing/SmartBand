#include "Threshold_MPU6050.h"

AccDataTypeDef AccData;
GyroDataTypeDef GyroData;

uint8_t MPU6050Init(void)
{
	uint8_t res;
	Threshold_GpioI2C_Init();//初始化IIC总线
	MPU_Write_Byte(MPU_PWR_MGMT1_REG,0X88);	//复位MPU6050 关闭温度若开启用 0X80
  //Threshold_Systick_Ms(100);
	MPU_Write_Byte(MPU_PWR_MGMT1_REG,0X00);	//唤醒MPU6050 
	MPU_Set_Gyro_Fsr(3);	//陀螺仪传感器,±2000dps
	MPU_Set_Accel_Fsr(0);	//加速度传感器,±2g
	MPU_Set_Rate(200);			//设置采样率200Hz
	MPU_Write_Byte(MPU_INT_EN_REG,0X00);	//关闭所有中断
	MPU_Write_Byte(MPU_USER_CTRL_REG,0X00);	//I2C主模式关闭
	MPU_Write_Byte(MPU_FIFO_EN_REG,0X00);	//关闭FIFO
	MPU_Write_Byte(MPU_INTBP_CFG_REG,0X80);	//INT引脚低电平有效
	res=MPU_Read_Byte(MPU_DEVICE_ID_REG);
	if(res==MPU_ADDR)//器件ID正确
	{
		MPU_Write_Byte(MPU_PWR_MGMT1_REG,0X01);	//设置CLKSEL,PLL X轴为参考
		MPU_Write_Byte(MPU_PWR_MGMT2_REG,0X00);	//加速度与陀螺仪都工作
		MPU_Set_Rate(200);						//设置采样率为200Hz
 	}else return 1;
	return 0;
}

//设置MPU6050陀螺仪传感器满量程范围
//fsr:0,±250dps;1,±500dps;2,±1000dps;3,±2000dps
//返回值:0,设置成功
//    其他,设置失败 
uint8_t MPU_Set_Gyro_Fsr(uint8_t fsr)
{
	return MPU_Write_Byte(MPU_GYRO_CFG_REG,fsr<<3);//设置陀螺仪满量程范围  
}
//设置MPU6050加速度传感器满量程范围
//fsr:0,±2g;1,±4g;2,±8g;3,±16g
//返回值:0,设置成功
//    其他,设置失败 
uint8_t MPU_Set_Accel_Fsr(uint8_t fsr)
{
	return MPU_Write_Byte(MPU_ACCEL_CFG_REG,fsr<<3);//设置加速度传感器满量程范围  
}
//设置MPU6050的数字低通滤波器
//lpf:数字低通滤波频率(Hz)
//返回值:0,设置成功
//    其他,设置失败 
uint8_t MPU_Set_LPF(uint16_t lpf)
{
	uint8_t data=0;
	if(lpf>=188)data=1;
	else if(lpf>=98)data=2;
	else if(lpf>=42)data=3;
	else if(lpf>=20)data=4;
	else if(lpf>=10)data=5;
	else data=6; 
	return MPU_Write_Byte(MPU_CFG_REG,data);//设置数字低通滤波器  
}
//设置MPU6050的采样率(假定Fs=1KHz)
//rate:4~1000(Hz)
//返回值:0,设置成功
//    其他,设置失败 
uint8_t MPU_Set_Rate(uint16_t rate)
{
	uint8_t data;
	if(rate>1000)rate=1000;
	if(rate<4)rate=4;
	data=1000/rate-1;
	data=MPU_Write_Byte(MPU_SAMPLE_RATE_REG,data);	//设置数字低通滤波器
 	return MPU_Set_LPF(rate/2);	//自动设置LPF为采样率的一半
}

//得到温度值
//返回值:温度值(扩大了100倍)
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
//得到陀螺仪值(原始值)
//gx,gy,gz:陀螺仪x,y,z轴的原始读数(带符号)
//返回值:0,成功
//    其他,错误代码
void MPU_Get_Gyroscope()
{
	#if defined(Gpio_I2C)
    uint8_t buf[6]; 
		MPU_Read_Len(MPU_ADDR,MPU_GYRO_XOUTH_REG,6,buf);
		
		GyroData.x=((uint16_t)buf[0]<<8)|buf[1];  
		GyroData.y=((uint16_t)buf[2]<<8)|buf[3];  
	  GyroData.z=((uint16_t)buf[4]<<8)|buf[5];
	
	#elif defined(Hardware_I2C)
		
		GyroData.x = (MPU_Read_Byte(MPU_GYRO_XOUTH_REG)<<8) + MPU_Read_Byte(MPU_GYRO_XOUTL_REG);
		GyroData.y = (MPU_Read_Byte(MPU_GYRO_YOUTH_REG)<<8) + MPU_Read_Byte(MPU_GYRO_YOUTL_REG);
		GyroData.z = (MPU_Read_Byte(MPU_GYRO_ZOUTH_REG)<<8) + MPU_Read_Byte(MPU_GYRO_ZOUTL_REG);
	
	#endif
}
//得到加速度值(原始值)
//gx,gy,gz:陀螺仪x,y,z轴的原始读数(带符号)
//返回值:0,成功
//    其他,错误代码
void MPU_Get_Accelerometer()
{
	#if defined(Gpio_I2C)
	
    uint8_t buf[6];  
		MPU_Read_Len(MPU_ADDR,MPU_ACCEL_XOUTH_REG,6,buf);
		AccData.x=((uint16_t)buf[0]<<8)|buf[1];  
		AccData.y=((uint16_t)buf[2]<<8)|buf[3];  
		AccData.z=((uint16_t)buf[4]<<8)|buf[5];
	
	#elif defined(Hardware_I2C)
	
		AccData.x = (MPU_Read_Byte(MPU_ACCEL_XOUTH_REG)<<8) + MPU_Read_Byte(MPU_ACCEL_XOUTL_REG);
		AccData.y = (MPU_Read_Byte(MPU_ACCEL_YOUTH_REG)<<8) + MPU_Read_Byte(MPU_ACCEL_YOUTL_REG);
		AccData.z = (MPU_Read_Byte(MPU_ACCEL_ZOUTH_REG)<<8) + MPU_Read_Byte(MPU_ACCEL_ZOUTL_REG);
		
	#endif
}

//IIC连续写
//addr:器件地址 
//reg:寄存器地址
//len:写入长度
//buf:数据区
//返回值:0,正常
//    其他,错误代码
uint8_t MPU_Write_Len(uint8_t addr,uint8_t reg,uint8_t len,uint8_t *buf)
{
	#if defined(Gpio_I2C)
	
		uint8_t i; 
    IIC_Start(); 
		IIC_Send_Byte((addr<<1)|0);//发送器件地址+写命令	
		if(IIC_Wait_Ack())	//等待应答
		{
			IIC_Stop();		 
			return 1;		
		}
    IIC_Send_Byte(reg);	//写寄存器地址
    IIC_Wait_Ack();		//等待应答
		for(i=0;i<len;i++)
		{
			IIC_Send_Byte(buf[i]);	//发送数据
			if(IIC_Wait_Ack())		//等待ACK
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
//IIC连续读
//addr:器件地址
//reg:要读取的寄存器地址
//len:要读取的长度
//buf:读取到的数据存储区
//返回值:0,正常
//    其他,错误代码
uint8_t MPU_Read_Len(uint8_t addr,uint8_t reg,uint8_t len,uint8_t *buf)
{ 
	#if defined(Gpio_I2C)
	
		IIC_Start(); 
		IIC_Send_Byte((addr<<1)|0);//发送器件地址+写命令	
		if(IIC_Wait_Ack())	//等待应答
		{
			IIC_Stop();		 
			return 1;		
		}
    IIC_Send_Byte(reg);	//写寄存器地址
    IIC_Wait_Ack();		//等待应答
    IIC_Start();
		IIC_Send_Byte((addr<<1)|1);//发送器件地址+读命令	
    IIC_Wait_Ack();		//等待应答 
		while(len)
		{
			if(len==1)*buf=IIC_Read_Byte(0);//读数据,发送nACK 
			else *buf=IIC_Read_Byte(1);		//读数据,发送ACK  
			len--;
			buf++; 
		}    
    IIC_Stop();	//产生一个停止条件 
		return 0;	
		
	#elif defined(Hardware_I2C)
		
		return 0;
		
	#endif
}
//IIC写一个字节 
//reg:寄存器地址
//data:数据
//返回值:0,正常
//    其他,错误代码
uint8_t MPU_Write_Byte(uint8_t reg,uint8_t data) 				 
{ 
	#if defined(Gpio_I2C)
	
    IIC_Start(); 
		IIC_Send_Byte((MPU_ADDR<<1)|0);//发送器件地址+写命令	
		if(IIC_Wait_Ack())	//等待应答
		{
			IIC_Stop();		 
			return 1;		
		}
    IIC_Send_Byte(reg);	//写寄存器地址
    IIC_Wait_Ack();		//等待应答 
		IIC_Send_Byte(data);//发送数据
		if(IIC_Wait_Ack())	//等待ACK
		{
			IIC_Stop();	 
			return 1;		 
		}		 
    IIC_Stop();	 
		return 0;
		
	#elif defined(Hardware_I2C)
		
		Threshold_I2C_MasterSendByte(reg,&data);
		return 0;
		
	#endif
}
//IIC读一个字节 
//reg:寄存器地址 
//返回值:读到的数据
uint8_t MPU_Read_Byte(uint8_t reg)
{
	#if defined(Gpio_I2C)
	
		uint8_t res;
    IIC_Start(); 
		IIC_Send_Byte((MPU_ADDR<<1)|0);//发送器件地址+写命令	
		IIC_Wait_Ack();		//等待应答 
    IIC_Send_Byte(reg);	//写寄存器地址
    IIC_Wait_Ack();		//等待应答
    IIC_Start();
		IIC_Send_Byte((MPU_ADDR<<1)|1);//发送器件地址+读命令	
    IIC_Wait_Ack();		//等待应答 
		res=IIC_Read_Byte(0);//读取数据,发送nACK 
    IIC_Stop();			//产生一个停止条件 
		return res;		
	
	#elif defined(Hardware_I2C)
		
		uint8_t* data;
		Threshold_I2C_MasterRecvByte(reg,data);
		return *data;
	
	#endif
}
