///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.1.7305/W32 for ARM       01/Mar/2015  12:57:40
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\src\projects\FRDM_KL25ZDemo\I2C\dvMMA9553.c
//    Command line =  
//        "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\src\projects\FRDM_KL25ZDemo\I2C\dvMMA9553.c"
//        -D IAR -D FREEDOM -lCN "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\FLASH_128KB\List\"
//        -lB "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\FLASH_128KB\List\"
//        -o "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\FLASH_128KB\Obj\"
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\projects\FRDM_KL25ZDemo\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\projects\FRDM_KL25ZDemo\usb\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\projects\FRDM_KL25ZDemo\bsp\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\projects\FRDM_KL25ZDemo\freedom_gpio\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\projects\FRDM_KL25ZDemo\pit\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\projects\FRDM_KL25ZDemo\tsi\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\projects\FRDM_KL25ZDemo\task_mgr\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\projects\FRDM_KL25ZDemo\angle_calculation\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\projects\FRDM_KL25ZDemo\i2c\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\common\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\cpu\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\cpu\headers\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\llwu\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\lptmr\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\mcg\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\pmc\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\rcm\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\rtc\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\smc\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\uart\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\wdog\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\lpsci\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\drivers\sci\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\..\..\src\platforms\"
//        -I "C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\..\"
//        -Ol
//    List file    =  
//        C:\Users\B51443\Desktop\KL25
//        MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\build\iar\FRDM_KL25ZDemo\FLASH_128KB\List\dvMMA9553.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN I2c_ReadRegister
        EXTERN I2c_WriteRegister
        EXTERN __aeabi_memcpy4
        EXTERN printf

        PUBLIC dvMMA9553_Read
        PUBLIC dvMMA9553_Write
        PUBLIC pedometer_active
        PUBLIC pedometer_afe_config
        PUBLIC pedometer_afe_config_read
        PUBLIC pedometer_clear
        PUBLIC pedometer_cmd__readlpfxyz
        PUBLIC pedometer_cmd__readrawxyz
        PUBLIC pedometer_cmd_readconfig
        PUBLIC pedometer_cmd_readstatus
        PUBLIC pedometer_cmd_readwakeup
        PUBLIC pedometer_disable
        PUBLIC pedometer_enable
        PUBLIC pedometer_init
        PUBLIC pedometer_int0_enable
        PUBLIC pedometer_main
        PUBLIC pedometer_mainrawxyz
        PUBLIC pedometer_reset
        PUBLIC pedometer_wakeup
        PUBLIC pedometer_write_config

// C:\Users\B51443\Desktop\KL25 MMA9553_test_xyzraw\kl25_sc_rev10\klxx-sc-baremetal\src\projects\FRDM_KL25ZDemo\I2C\dvMMA9553.c
//    1 /******************************************************************** 
//    2 *  �� �� ��: dvMMA9553.c 
//    3 * 
//    4 *  ������: ��������������
//    5 *  �� �� ��: 
//    6 *  ����ʱ��: 2014��01��22��
//    7 *  ˵    ��: 
//    8 *------�޸���ʷ----------------------------------------- 
//    9 *  �� �� ��: wang wenxue
//   10 *  �޸�ʱ��: 2015��2��
//   11 *  �޸�˵��: 
//   12 * 
//   13 ******************************************************************/ 
//   14 #include "common.h"
//   15 #include "dvMMA9553.h"
//   16 #include "hal_i2c.h"  
//   17 
//   18 
//   19 
//   20 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 static void delay_wwx(void)
//   22 {
delay_wwx:
        PUSH     {LR}
//   23     int n;
//   24     for(n=0; n<400; n++)
        MOVS     R0,#+0
        B        ??delay_wwx_0
??delay_wwx_1:
        ADDS     R0,R0,#+1
??delay_wwx_0:
        MOVS     R1,#+200
        LSLS     R1,R1,#+1        ;; #+400
        CMP      R0,R1
        BLT      ??delay_wwx_1
//   25         ;
//   26 }
        POP      {PC}             ;; return
//   27 
//   28 
//   29 /******************************************************************** 
//   30 * ��������: pedometer_main
//   31 * ��������: �ǲ���������
//   32 * �������:  
//   33 * �� �� ֵ:  
//   34 * ȫ�ֱ���:  
//   35 * ����ģ��:  
//   36 * ˵    ��: ѡ�����¼�ÿ�η�����ִ�е���Ҫ���ܡ��ڼƲ���������£�
//   37 *           �ù���ִ�л�ȡÿ���µļ��ٶȼ���Ʒ�󲢵������Ʋ�������
//   38 *           ��������Ʒ��
//   39 * ע    ��:  
//   40 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   41 void pedometer_main(void)
//   42 {
pedometer_main:
        PUSH     {LR}
        SUB      SP,SP,#+20
//   43    unsigned char Buf[20];
//   44    int StepCount; //wenxue
//   45    pedometer_cmd_readstatus(); // read  // д��{0x15,0x30,0x00,0x0C}
        BL       pedometer_cmd_readstatus
//   46         
//   47    while(1)
//   48    {
//   49      dvMMA9553_Read(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 2);
??pedometer_main_0:
        MOVS     R3,#+2
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Read
//   50      //printf("Buf[1]==%02x\r\n",Buf[1]);// wenxue
//   51      delay_wwx();
        BL       delay_wwx
//   52      if(Buf[1]==0x80)
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        CMP      R0,#+128
        BNE      ??pedometer_main_0
//   53       {
//   54         dvMMA9553_Read(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 16);  
        MOVS     R3,#+16
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Read
//   55         break;
//   56        }
//   57     }
//   58     
//   59     // wenxue      
//   60       //  for(int i=0;i<16;i++)
//   61          // printf("Buf[%d]=%02x\r\n",i,Buf[i]);       
//   62            
//   63        StepCount = Buf[6] * 256 + Buf[7];
        MOV      R0,SP
        LDRB     R0,[R0, #+6]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        MOV      R1,SP
        LDRB     R1,[R1, #+7]
        ADDS     R1,R0,R1
//   64        printf("StepCount=%d\r\n",StepCount);
        LDR      R0,??DataTable18
        BL       printf
//   65        //m_status.Distance  = Buf[8] * 256 + Buf[9];
//   66        //m_status.Calories  = Buf[12] * 256 + Buf[13];
//   67 }
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//   68 
//   69 /******************************************************************** 
//   70 * ��������: pedometer_clear
//   71 * ��������: �ǲ������
//   72 * �������:  
//   73 * �� �� ֵ:  
//   74 * ȫ�ֱ���:  
//   75 * ����ģ��:  
//   76 * ˵    ��: ���Ӧ�ó�����ⲿ״̬�������ڲ����±������䡣�Ʋ�������
//   77 *           Ҫ������ܣ���˷���һ����ָ������Ӧ��Ӧ�ó�����
//   78 * ע    ��:  
//   79 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   80 void pedometer_clear(void)
//   81 {
//   82 //    m_status.StepCount = 0;
//   83 //    m_status.Progress = 0;
//   84 //    m_status.Calories = 13;
//   85 }
pedometer_clear:
        BX       LR               ;; return
//   86 
//   87 /******************************************************************** 
//   88 * ��������: pedometer_init
//   89 * ��������: ��ʼ������
//   90 * �������:  
//   91 * �� �� ֵ:  
//   92 * ȫ�ֱ���:  
//   93 * ����ģ��:  
//   94 * ˵    ��: ��λ��ִ��һ�Ρ�������������Ӧ�ó��������������Ժ�Ҫ��
//   95 *           ��̬�ڴ���䡣
//   96 * ע    ��:  
//   97 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   98 void pedometer_init(void)
//   99 {
pedometer_init:
        PUSH     {R4,LR}
        SUB      SP,SP,#+24
//  100   unsigned char Buf[20];  
//  101   
//  102   int StepCount; //wenxue
//  103   
//  104     //pedometer_reset();          // reset pedometer
//  105     pedometer_write_config();       // config
        BL       pedometer_write_config
//  106     pedometer_enable();         // enable pedometer
        BL       pedometer_enable
//  107     pedometer_int0_enable();    // enable INT_O pin
        BL       pedometer_int0_enable
//  108     pedometer_active();         // active MMA9553
        BL       pedometer_active
//  109     pedometer_wakeup();
        BL       pedometer_wakeup
//  110     
//  111     delay_wwx();
        BL       delay_wwx
//  112     pedometer_afe_config(); // afe config    wenxue
        BL       pedometer_afe_config
//  113    // delay_wwx();
//  114         
//  115     pedometer_cmd_readstatus();
        BL       pedometer_cmd_readstatus
//  116         
//  117     while(1)  
//  118     {
//  119        dvMMA9553_Read(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 2);
??pedometer_init_0:
        MOVS     R3,#+2
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Read
//  120        printf("Buf[1]==%02x\r\n",Buf[1]);// wenxue
        MOV      R0,SP
        LDRB     R1,[R0, #+1]
        LDR      R0,??DataTable18_1
        BL       printf
//  121        if(Buf[1]==0x80)
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        CMP      R0,#+128
        BNE      ??pedometer_init_0
//  122        {
//  123          dvMMA9553_Read(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 16); // 12 bytes status data + 4 bytes frame start 
        MOVS     R3,#+16
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Read
//  124          break; // wenxue
//  125     
//  126         }
//  127      }        
//  128       // wenxue      
//  129       for(int i=0;i<16;i++)
        MOVS     R4,#+0
        B        ??pedometer_init_1
//  130          printf("Buf[%d]=%02x\r\n",i,Buf[i]);
??pedometer_init_2:
        MOV      R0,SP
        LDRB     R2,[R0, R4]
        MOVS     R1,R4
        LDR      R0,??DataTable18_2
        BL       printf
        ADDS     R4,R4,#+1
??pedometer_init_1:
        CMP      R4,#+16
        BLT      ??pedometer_init_2
//  131         
//  132       StepCount = Buf[6] * 256 + Buf[7];
        MOV      R0,SP
        LDRB     R0,[R0, #+6]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        MOV      R1,SP
        LDRB     R1,[R1, #+7]
        ADDS     R1,R0,R1
//  133       printf("StepCount=%d\r\n",StepCount);
        LDR      R0,??DataTable18
        BL       printf
//  134     
//  135 }
        ADD      SP,SP,#+24
        POP      {R4,PC}          ;; return
//  136 
//  137 /******************************************************************** 
//  138 * ��������: pedometer_cmd_readstatus
//  139 * ��������: �ǲ�����״̬����
//  140 * �������:  
//  141 * �� �� ֵ:  
//  142 * ȫ�ֱ���:  
//  143 * ����ģ��:  
//  144 * ˵    ��: 
//  145 * ע    ��:  
//  146 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  147 void pedometer_cmd_readstatus(void)
//  148 {
pedometer_cmd_readstatus:
        PUSH     {R7,LR}
//  149     unsigned char Buf[]={0x15,0x30,0x00,0x0C};
        MOV      R0,SP
        LDR      R1,??DataTable18_3
        LDR      R2,[R1, #0]
        STR      R2,[R0, #0]
//  150     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 4 );
        MOVS     R3,#+4
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  151 }
        POP      {R0,PC}          ;; return
//  152 
//  153 /******************************************************************** 
//  154 * ��������: pedometer_cmd_readconfig
//  155 * ��������: �ǲ���������
//  156 * �������:  
//  157 * �� �� ֵ:  
//  158 * ȫ�ֱ���:  
//  159 * ����ģ��:  
//  160 * ˵    ��: 
//  161 * ע    ��:  
//  162 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  163 void pedometer_cmd_readconfig(void)
//  164 {
pedometer_cmd_readconfig:
        PUSH     {R7,LR}
//  165     unsigned char Buf[]={0x15,0x10,0x00,0x10};
        MOV      R0,SP
        LDR      R1,??DataTable18_4
        LDR      R2,[R1, #0]
        STR      R2,[R0, #0]
//  166 
//  167     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 4 );
        MOVS     R3,#+4
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  168 }
        POP      {R0,PC}          ;; return
//  169 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  170 void pedometer_cmd_readwakeup(void)
//  171 {
pedometer_cmd_readwakeup:
        PUSH     {R7,LR}
//  172     unsigned char Buf[]={0x12,0x10,0x06,0x01};
        MOV      R0,SP
        LDR      R1,??DataTable18_5
        LDR      R2,[R1, #0]
        STR      R2,[R0, #0]
//  173     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 4 );
        MOVS     R3,#+4
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  174 }
        POP      {R0,PC}          ;; return
//  175 /******************************************************************** 
//  176 * ��������: pedometer_write_config
//  177 * ��������: ���ò���
//  178 * �������:  
//  179 * �� �� ֵ:  
//  180 * ȫ�ֱ���:  
//  181 * ����ģ��:  
//  182 * ˵    ��: 
//  183 * ע    ��:  
//  184 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  185 void pedometer_write_config(void)
//  186 {
pedometer_write_config:
        PUSH     {LR}
        SUB      SP,SP,#+20
//  187     unsigned char Buf[]={0x15,0x20,0x00,0x10,
//  188                            0x0C,0xE0,
//  189                            0x13,0x20,
//  190                            0x00,0x96,
//  191                            0x60,0x50,
//  192                            0xAF,0x50,
//  193                            0x04,0x03,
//  194                            0x05,0x01,
//  195                            0x00,0x00};
        MOV      R0,SP
        LDR      R1,??DataTable18_6
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
//  196 
//  197     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 20);
        MOVS     R3,#+20
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  198 }
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//  199 
//  200 
//  201 /******************************************************************** 
//  202 * ��������: pedometer_reset
//  203 * ��������: ���ú���
//  204 * �������:  
//  205 * �� �� ֵ:  
//  206 * ȫ�ֱ���:  
//  207 * ����ģ��:  
//  208 * ˵    ��: 
//  209 * ע    ��:  
//  210 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  211 void pedometer_reset(void)
//  212 {
pedometer_reset:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  213    unsigned char Buf[]={0x17,0x20,0x01,0x01,0x20};
        MOV      R0,SP
        LDR      R1,??DataTable18_7
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  214     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 5);
        MOVS     R3,#+5
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  215 }
        POP      {R0-R2,PC}       ;; return
//  216 
//  217 /******************************************************************** 
//  218 * ��������: pedometer_enable
//  219 * ��������: �ǲ����ܿ���
//  220 * �������:  
//  221 * �� �� ֵ:  
//  222 * ȫ�ֱ���:  
//  223 * ����ģ��:  
//  224 * ˵    ��: 
//  225 * ע    ��:  
//  226 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  227 void pedometer_enable(void)
//  228 {
pedometer_enable:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  229     unsigned char Buf[]={0x17,0x20,0x05,0x01,0x00};
        MOV      R0,SP
        LDR      R1,??DataTable18_8
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  230 
//  231     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 5);
        MOVS     R3,#+5
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  232 }
        POP      {R0-R2,PC}       ;; return
//  233 
//  234 /******************************************************************** 
//  235 * ��������: pedometer_disable
//  236 * ��������: �ǲ����ܹر�
//  237 * �������:  
//  238 * �� �� ֵ:  
//  239 * ȫ�ֱ���:  
//  240 * ����ģ��:  
//  241 * ˵    ��: 
//  242 * ע    ��:  
//  243 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  244 void pedometer_disable(void)
//  245 {
pedometer_disable:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  246    unsigned char Buf[]={0x17,0x20,0x05,0x01,0x20};
        MOV      R0,SP
        LDR      R1,??DataTable18_9
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  247    dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 5);
        MOVS     R3,#+5
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  248 }
        POP      {R0-R2,PC}       ;; return
//  249 
//  250 /******************************************************************** 
//  251 * ��������: pedometer_active
//  252 * ��������: ����
//  253 * �������:  
//  254 * �� �� ֵ:  
//  255 * ȫ�ֱ���:  
//  256 * ����ģ��:  
//  257 * ˵    ��: 
//  258 * ע    ��:  
//  259 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  260 void pedometer_active(void)
//  261 {
pedometer_active:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  262     unsigned char Buf[]={0x15,0x20,0x06,0x01,0x80};
        MOV      R0,SP
        LDR      R1,??DataTable18_10
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  263     
//  264     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 5);
        MOVS     R3,#+5
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  265 }
        POP      {R0-R2,PC}       ;; return
//  266 
//  267 /******************************************************************** 
//  268 * ��������: pedometer_wakeup
//  269 * ��������: ����
//  270 * �������:  
//  271 * �� �� ֵ:  
//  272 * ȫ�ֱ���:  
//  273 * ����ģ��:  
//  274 * ˵    ��: 
//  275 * ע    ��:  
//  276 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  277 void pedometer_wakeup(void)
//  278 {
pedometer_wakeup:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  279     unsigned char Buf[]={0x12,0x20,0x06,0x01,0x00};
        MOV      R0,SP
        LDR      R1,??DataTable18_11
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  280     
//  281     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 5);
        MOVS     R3,#+5
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  282 }
        POP      {R0-R2,PC}       ;; return
//  283 
//  284 /******************************************************************** 
//  285 * ��������: pedometer_int0_enable
//  286 * ��������: �ж�0����
//  287 * �������:  
//  288 * �� �� ֵ:  
//  289 * ȫ�ֱ���:  
//  290 * ����ģ��:  
//  291 * ˵    ��: 
//  292 * ע    ��:  
//  293 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  294 void pedometer_int0_enable(void)
//  295 {
pedometer_int0_enable:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  296     unsigned char Buf[]={0x18,0x20,0x00,0x01,0xC0};
        MOV      R0,SP
        LDR      R1,??DataTable18_12
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  297 
//  298     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 5);
        MOVS     R3,#+5
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  299 }
        POP      {R0-R2,PC}       ;; return
//  300 
//  301 
//  302 /********************************************************************
//  303 * ��������  :   dvMMA9553_Read                 
//  304 * ��������  :   ��gsensor
//  305 * �������  :   deviceAddr��I2C������ַ
//  306 *               regAddr���Ĵ�����ַ
//  307 * �������  :   pdata����ȡֵ
//  308 * ����ֵ    :   ��
//  309 * ����ģ��  :   I2C����������
//  310 * ����˵��  :
//  311 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  312 void dvMMA9553_Read(unsigned char deviceAddr,unsigned char regAddr, unsigned char *data, unsigned char len)
//  313 {
dvMMA9553_Read:
        PUSH     {R7,LR}
//  314     
//  315  // I2c_ReadRegister(I2C0_BASE_PTR,deviceAddr,regAddr,data,len);
//  316   I2c_ReadRegister(I2C1_BASE_PTR,deviceAddr,regAddr,data,len); // wenxue
        UXTB     R3,R3
        STR      R3,[SP, #+0]
        MOVS     R3,R2
        MOVS     R2,R1
        UXTB     R2,R2
        MOVS     R1,R0
        UXTB     R1,R1
        LDR      R0,??DataTable18_13  ;; 0x40067000
        BL       I2c_ReadRegister
//  317 }
        POP      {R0,PC}          ;; return
//  318 
//  319 /********************************************************************
//  320 * ��������  :   dvMMA9553_Write                 
//  321 * ��������  :   ���ֽ�д�����ַI2C����
//  322 * �������  :   deviceAddr��I2C������ַ
//  323 *               regAddr���Ĵ�����ַ
//  324 *               data������ָ��
//  325 *               len,д�볤��
//  326 * �������  :   ��
//  327 * ����ֵ    :   ��
//  328 * ����ģ��  :   
//  329 * ����˵��  :
//  330 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  331 void dvMMA9553_Write(unsigned char deviceAddr,unsigned char regAddr, unsigned char *data, unsigned char len)
//  332 {
dvMMA9553_Write:
        PUSH     {R7,LR}
//  333    //I2c_WriteRegister(I2C0_BASE_PTR,deviceAddr,regAddr,data,len);
//  334   I2c_WriteRegister(I2C1_BASE_PTR,deviceAddr,regAddr,data,len);  // wenxue
        UXTB     R3,R3
        STR      R3,[SP, #+0]
        MOVS     R3,R2
        MOVS     R2,R1
        UXTB     R2,R2
        MOVS     R1,R0
        UXTB     R1,R1
        LDR      R0,??DataTable18_13  ;; 0x40067000
        BL       I2c_WriteRegister
//  335   
//  336 }
        POP      {R0,PC}          ;; return
//  337 
//  338 
//  339 
//  340 
//  341 
//  342 // wenxue 
//  343 /********************************************************************
//  344 * ��������  :   pedometer_cmd__readlpfxyz                 
//  345 * ��������  :   ��xyz �����һ����Ϣ
//  346 * �������  :   deviceAddr��I2C������ַ
//  347 *               regAddr���Ĵ�����ַ
//  348 *               data������ָ��
//  349 *               len,д�볤��
//  350 * �������  :   ��
//  351 * ����ֵ    :   ��
//  352 * ����ģ��  :   
//  353 * ����˵��  :
//  354 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  355 void pedometer_cmd__readlpfxyz(void)
//  356 {
pedometer_cmd__readlpfxyz:
        PUSH     {R7,LR}
//  357     unsigned char Buf[]={0x06,0x30,0x18,0x06};
        MOV      R0,SP
        LDR      R1,??DataTable18_14
        LDR      R2,[R1, #0]
        STR      R2,[R0, #0]
//  358 
//  359     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 4 );
        MOVS     R3,#+4
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  360   
//  361 }
        POP      {R0,PC}          ;; return
//  362   
//  363 
//  364 
//  365 /********************************************************************
//  366 * ��������  :   pedometer_cmd__readrawxyz                 
//  367 * ��������  :   ��xyz raw ��Ϣ
//  368 * �������  :   deviceAddr��I2C������ַ
//  369 *               regAddr���Ĵ�����ַ
//  370 *               data������ָ��
//  371 *               len,д�볤��
//  372 * �������  :   ��
//  373 * ����ֵ    :   ��
//  374 * ����ģ��  :   
//  375 * ����˵��  :
//  376 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  377 void pedometer_cmd__readrawxyz(void)
//  378 {
pedometer_cmd__readrawxyz:
        PUSH     {R7,LR}
//  379     unsigned char Buf[]={0x06,0x30,0x12,0x06};
        MOV      R0,SP
        LDR      R1,??DataTable18_15
        LDR      R2,[R1, #0]
        STR      R2,[R0, #0]
//  380 
//  381     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 4 );
        MOVS     R3,#+4
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  382   
//  383 }
        POP      {R0,PC}          ;; return
//  384 
//  385 
//  386 
//  387 /******************************************************************** 
//  388 * ��������: pedometer_mainrawxyz
//  389 * ��������: �ǲ���������
//  390 * �������:  
//  391 * �� �� ֵ:  
//  392 * ȫ�ֱ���:  
//  393 * ����ģ��:  
//  394 * ˵    ��: ѡ�����¼�ÿ�η�����ִ�е���Ҫ���ܡ��ڼƲ���������£�
//  395 *           �ù���ִ�л�ȡÿ���µļ��ٶȼ���Ʒ�󲢵������Ʋ�������
//  396 *           ��������Ʒ��
//  397 * ע    ��:  
//  398 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  399 void pedometer_mainrawxyz(void)
//  400 {
pedometer_mainrawxyz:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+20
//  401    unsigned char Buf[20];
//  402    int16 x, y, z; 
//  403    
//  404    pedometer_cmd__readrawxyz(); //
        BL       pedometer_cmd__readrawxyz
//  405         
//  406         while(1)
//  407         {
//  408            dvMMA9553_Read(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 2);
??pedometer_mainrawxyz_0:
        MOVS     R3,#+2
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Read
//  409            //printf("Buf[1]==%02x\r\n",Buf[1]);// wenxue
//  410            delay_wwx();
        BL       delay_wwx
//  411            if(Buf[1]==0x80)
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        CMP      R0,#+128
        BNE      ??pedometer_mainrawxyz_0
//  412            {
//  413               dvMMA9553_Read(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 10);  
        MOVS     R3,#+10
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Read
//  414               break;
//  415             }
//  416        }
//  417     
//  418         // wenxue      
//  419        for(int i=0;i<10;i++)
        MOVS     R4,#+0
        B        ??pedometer_mainrawxyz_1
//  420          printf("Buf[%d]=%02x\r\n",i,Buf[i]);       
??pedometer_mainrawxyz_2:
        MOV      R0,SP
        LDRB     R2,[R0, R4]
        MOVS     R1,R4
        LDR      R0,??DataTable18_2
        BL       printf
        ADDS     R4,R4,#+1
??pedometer_mainrawxyz_1:
        CMP      R4,#+10
        BLT      ??pedometer_mainrawxyz_2
//  421            
//  422        x = Buf[4] * 256 + Buf[5];
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        MOV      R1,SP
        LDRB     R1,[R1, #+5]
        ADDS     R1,R0,R1
//  423        y = Buf[6] * 256 + Buf[7];
        MOV      R0,SP
        LDRB     R0,[R0, #+6]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R0,R2,R0
        MOV      R2,SP
        LDRB     R2,[R2, #+7]
        ADDS     R4,R0,R2
//  424        z = Buf[8] * 256 + Buf[9];
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R0,R2,R0
        MOV      R2,SP
        LDRB     R2,[R2, #+9]
        ADDS     R5,R0,R2
//  425        
//  426        printf("x=%d\r\n",x);
        SXTH     R1,R1
        LDR      R0,??DataTable18_16
        BL       printf
//  427        printf("y=%d\r\n",y);
        SXTH     R4,R4
        MOVS     R1,R4
        LDR      R0,??DataTable18_17
        BL       printf
//  428        printf("z=%d\r\n",z);
        SXTH     R5,R5
        MOVS     R1,R5
        LDR      R0,??DataTable18_18
        BL       printf
//  429 }
        ADD      SP,SP,#+20
        POP      {R4,R5,PC}       ;; return
//  430 
//  431 
//  432 
//  433 
//  434 /******************************************************************** 
//  435 * ��������: pedometer_afe_config
//  436 * ��������: Configure the AFE range
//  437 * �������:  
//  438 * �� �� ֵ:  
//  439 * ȫ�ֱ���:  
//  440 * ����ģ��:  
//  441 * ˵    ��: 
//  442 * ע    ��:  
//  443 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  444 void pedometer_afe_config(void)
//  445 {
pedometer_afe_config:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  446   // unsigned char Buf[]={0x06,0x20,0x00,0x01,0x40}; // 2g mode FS=01    1g--16393
//  447    //unsigned char Buf[]={0x06,0x20,0x00,0x01,0x80}; // 4g mode FS=10    4g--8196
//  448    unsigned char Buf[]={0x06,0x20,0x00,0x01,0x00}; // 8g mode FS=00    8g--4098
        MOV      R0,SP
        LDR      R1,??DataTable18_19
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  449    
//  450     dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf, 5);
        MOVS     R3,#+5
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  451 }
        POP      {R0-R2,PC}       ;; return
//  452 
//  453 
//  454 
//  455 
//  456 
//  457 /******************************************************************** 
//  458 * ��������: pedometer_afe_config_read
//  459 * ��������: Read Config data
//  460 * �������:  
//  461 * �� �� ֵ:  
//  462 * ȫ�ֱ���:  
//  463 * ����ģ��:  
//  464 * ˵    ��: 
//  465 * ע    ��:  
//  466 ********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  467 void pedometer_afe_config_read(void)
//  468 {
pedometer_afe_config_read:
        PUSH     {R7,LR}
//  469   
//  470    unsigned char Buf[]={0x06,0x10,0x00,0x01}; 
        MOV      R0,SP
        LDR      R1,??DataTable18_20
        LDR      R2,[R1, #0]
        STR      R2,[R0, #0]
//  471 
//  472    dvMMA9553_Write(MMA9553_Slave_Addr, MMA9553_Sub_Addr, Buf,4);
        MOVS     R3,#+4
        MOV      R2,SP
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       dvMMA9553_Write
//  473 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_1:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_2:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_3:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_4:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_5:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_6:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_7:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_8:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_9:
        DC32     ?_9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_10:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_11:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_12:
        DC32     ?_12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_13:
        DC32     0x40067000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_14:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_15:
        DC32     ?_14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_16:
        DC32     ?_15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_17:
        DC32     ?_16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_18:
        DC32     ?_17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_19:
        DC32     ?_18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_20:
        DC32     ?_19

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "StepCount=%d\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "Buf[1]==%02x\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "Buf[%d]=%02x\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 21, 48, 0, 12

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 21, 16, 0, 16

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 18, 16, 6, 1

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 21, 32, 0, 16, 12, 224, 19, 32, 0, 150, 96, 80, 175, 80, 4, 3, 5, 1
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 23, 32, 1, 1, 32, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_8:
        DATA
        DC8 23, 32, 5, 1, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 23, 32, 5, 1, 32, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_10:
        DATA
        DC8 21, 32, 6, 1, 128, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 18, 32, 6, 1, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_12:
        DATA
        DC8 24, 32, 0, 1, 192, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_13:
        DATA
        DC8 6, 48, 24, 6

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_14:
        DATA
        DC8 6, 48, 18, 6

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_15:
        DATA
        DC8 "x=%d\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_16:
        DATA
        DC8 "y=%d\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_17:
        DATA
        DC8 "z=%d\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_18:
        DATA
        DC8 6, 32, 0, 1, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_19:
        DATA
        DC8 6, 16, 0, 1

        END
//  474 
//  475 
//  476 
//  477 /******************************************************************** 
//  478 *          �ļ����� 
//  479 ********************************************************************/
// 
// 172 bytes in section .rodata
// 878 bytes in section .text
// 
// 878 bytes of CODE  memory
// 172 bytes of CONST memory
//
//Errors: none
//Warnings: none
