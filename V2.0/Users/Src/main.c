/**
  ******************************************************************************
  * @file    SmartBand_v2.0/Src/main.c 
  * @author  ZhaoXiang
  * @version V1.0.0
  * @date    30-December-2015
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2015 STMicroelectronics && ZhaoXiang</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "cmsis_os.h"

/* Private typedef -----------------------------------------------------------*/
typedef enum
{
  THREAD_1 = 0,
  THREAD_2
} Thread_TypeDef;

/* Private define ------------------------------------------------------------*/
#define semtstSTACK_SIZE   configMINIMAL_STACK_SIZE

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
osThreadId Thread1_Handle,Thread2_Handle;
osSemaphoreId osSemaphore;
xSemaphoreHandle xSemaphore;

/* Private function prototypes -----------------------------------------------*/
static void Key_Action(void * pvParameters);
void Menu_Thread(void * pvParameters);
void RTC_Thread(void * pvParameters);
void MotionSenser_Thread(void * pvParameters);

/**
  * @brief  Main program
  * @param  None
  * @retval None
  */
int main(void)
{
  /* STM32L0xx HAL library initialization:
       - Configure the Flash prefetch, Flash preread and Buffer caches
       - Systick timer is configured by default as source of time base, but user 
             can eventually implement his proper time base source (a general purpose 
             timer for example or other time source), keeping in mind that Time base 
             duration should be kept 1ms since PPP_TIMEOUT_VALUEs are defined and 
             handled in milliseconds basis.
       - Low Level Initialization
     */
#if (USE_FreeRTOS)
	
	//�ٷ���ļ���
	HAL_Init();
	
	//�弶�����ļ���
    BSP_Init();
	
	//����һ���ź��������ж�֮��������л�
	vSemaphoreCreateBinary( xSemaphore );

	//����Ĵ���
	xTaskCreate( Key_Action, "Key_Action", configMINIMAL_STACK_SIZE, NULL, osPriorityNormal+3, NULL );
	
	xTaskCreate( Menu_Thread, "Menu_Thread", configMINIMAL_STACK_SIZE, NULL, osPriorityNormal+2, NULL );
	
	xTaskCreate( MotionSenser_Thread, "MotionSenser_Thread", configMINIMAL_STACK_SIZE, NULL, osPriorityNormal, NULL );
	
  	xTaskCreate( RTC_Thread, "RTC_Thread", configMINIMAL_STACK_SIZE, NULL, osPriorityNormal+1, NULL );
   
	/* Start scheduler */
    vTaskStartScheduler();//osKernelStart();

    /* We should never get here as control is now taken by the scheduler */
    for (;;)
	{
		printf("error! \n");
	}

	
#else

	    HAL_Init();
		HAL_Delay(500);
		Threshold_Drivers_Load(); //Load Threshold Drivers
			
		while (1)
		{	
			if(Time20ms_Flag)
			{
				if(SetTime == false)
					Menu(DisPlayRTC,DisPlayStep,DisPlayHeartBeat,DisPlayTimeFigure,DisPlayAuthor);
				//OLED_Printf(3,(uint8_t*)"By WestZhao");
				Time20ms_Flag = 0;
			}

			if(Time50ms_Flag)
			{
			    Threshold_BlE_Deal();
				User_AD_Deal();
				Time50ms_Flag = 0;
			}
			
			if(Time100ms_Flag)
			{
				pedometer_main();
				Time100ms_Flag = 0;
			}	
			
			if(Time500ms_Flag)
			{
			   Threshold_RTC_TimeShow();
				 Time500ms_Flag = 0;
			}
			
		}
#endif
}

//����1
void Menu_Thread(void * pvParameters)
{
	const char *pcPrint = "This is Menu_Thread \r\n";
	//׼ȷ��ʱ����ʱ��������������
	portTickType xLastWakeTime;
	/*��ʼ��xLastWakeTime,֮�����vTaskDelayUntil()�и���*/
	xLastWakeTime = xTaskGetTickCount();
	
	for(;;)
	{
		BSP_LED_On(LED2);
		printf(pcPrint);
		Menu(DisPlayRTC,DisPlayStep,DisPlayHeartBeat,DisPlayTimeFigure,DisPlayAuthor);
		vTaskDelayUntil( &xLastWakeTime, ( 20 / portTICK_RATE_MS ) );//50ms����һ��
	}
}

//����2
void RTC_Thread(void * pvParameters)
{
	const char *pcPrint = "This is RTC_Thread \r\n";
	//׼ȷ��ʱ����ʱ��������������
	portTickType xLastWakeTime;
	/*��ʼ��xLastWakeTime,֮�����vTaskDelayUntil()�и���*/
	xLastWakeTime = xTaskGetTickCount();
	
	for(;;)
	{
		BSP_LED_Off(LED2);
		printf(pcPrint);
		Threshold_RTC_TimeShow();
		vTaskDelayUntil( &xLastWakeTime, ( 500 / portTICK_RATE_MS ) );//10ms����һ��
	}
}

//����3
void MotionSenser_Thread(void * pvParameters)
{
	const char *pcPrint = "This is MotionSenser_Thread \r\n";
	//׼ȷ��ʱ����ʱ��������������
	portTickType xLastWakeTime;
	/*��ʼ��xLastWakeTime,֮�����vTaskDelayUntil()�и���*/
	xLastWakeTime = xTaskGetTickCount();
	
	for(;;)
	{
		BSP_LED_Toggle(LED2);
		printf(pcPrint);
		pedometer_main();
		vTaskDelayUntil( &xLastWakeTime, ( 100 / portTICK_RATE_MS ) );//10ms����һ��
	}
}

/**
  * @brief  vHandleTask
  * @param  argument: ��ʱ���������(����������)�����յ��ź����Ժ󣬽�����������ҽ��������ĵ��л���ʹ����������ȼ��ﵽ��߲�����֮��
  * @retval None
  */
static void Key_Action(void * pvParameters)
{
  for (;;)
  {

	  xSemaphoreTake( xSemaphore, portMAX_DELAY );
	  key = Press;
	  printf("Key_Action Task \r\n");
		
		//ֱ�ӵ������º������ɡ�
		/*
		if (osSemaphore != NULL)
    {
      // Try to obtain the semaphore 
      if (osSemaphoreWait(osSemaphore , 0) == osOK)
      {
        BSP_LED_Toggle(LED2);
				//������ӵ����ж���Ҫִ�е�����
      }
    }
		*/
  }
}

/**
  * @brief  EXTI line detection callbacks
  * @param  GPIO_Pin: Specifies the pins connected EXTI line
  * @retval None
  */
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
	//static uint16_t cnt = 0;
	if(HAL_GPIO_ReadPin(GPIOC,GPIO_13) == GPIO_PIN_RESET)
	{
		static portBASE_TYPE xHigherPriorityTaskWoken;
		xHigherPriorityTaskWoken = pdFALSE;
		
		xSemaphoreGiveFromISR( xSemaphore, &xHigherPriorityTaskWoken );
		
		if( xHigherPriorityTaskWoken == pdTRUE )
		{
			//�����ź�����ʹ�õȴ����ź�������������������������������������ȼ����ڵ�ǰ��������ȼ�
			//ǿ�ƽ���һ�������л�����ȷ���ж�ֱ�ӷ��ص��������������(���ȼ�����)
			portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
		}
		
		//ֱ�ӵ������º���������� �����ź��� ���� �������л� �Ĺ���
		//osSemaphoreRelease(xSemaphore);
	}

	//pulse
	#if 0
	if(HAL_GPIO_ReadPin(GPIOA,GPIO_0) == GPIO_PIN_RESET)
	{
		cnt++;
		if( true == Time1s_Flag)
		{
			HeartBeat = cnt;
			cnt = 0;
			Time1s_Flag = false;
		}
		printf(" Pulse Interrupt ! \r\n");
	}
	#endif
}


#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

