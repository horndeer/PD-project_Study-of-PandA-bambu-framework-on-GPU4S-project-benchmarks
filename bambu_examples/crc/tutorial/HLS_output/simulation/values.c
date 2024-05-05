/*
 * Politecnico di Milano
 * Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-04-18T13:31:36
 * /tmp/.mount_bambu-L7k5uw/usr/bin/bambu executed with: /tmp/.mount_bambu-L7k5uw/usr/bin/bambu --top-fname=icrc --generate-tb=../test_icrc.xml --simulate --simulator=XSIM ../spec.c 
 */
#define _FILE_OFFSET_BITS 64

#define __Inf (1.0/0.0)
#define __Nan (0.0/0.0)

#ifdef __cplusplus
#undef printf

#include <cstdio>

#include <cstdlib>

typedef bool _Bool;

#else
#include <stdio.h>

#include <stdlib.h>

extern void exit(int status);
#endif

#include <sys/types.h>

//global variable used to store the output file
FILE * __bambu_testbench_fp;

#ifdef __AC_NAMESPACE
using namespace __AC_NAMESPACE;
#endif
//variable used to detect a standard end of the main (exit has not been called)
unsigned int __standard_exit;
//definition of __bambu_testbench_exit function
void __bambu_testbench_exit(void) __attribute__ ((destructor));
void __bambu_testbench_exit(void)
{
   if (!__standard_exit)
   {
      fprintf(__bambu_testbench_fp, "//expected value for return value\n");
      fprintf(__bambu_testbench_fp, "o00000000000000000000000000000000\n");
      fprintf(__bambu_testbench_fp, "e\n");
   }
}

void _Dec2Bin_(FILE * __bambu_testbench_fp, long long int num, unsigned int precision)
{
   unsigned int i;
   unsigned long long int ull_value = (unsigned long long int) num;
   for (i = 0; i < precision; ++i)
   fprintf(__bambu_testbench_fp, "%c", (((1LLU << (precision - i -1)) & ull_value) ? '1' : '0'));
}

void _Ptd2Bin_(FILE * __bambu_testbench_fp, unsigned char * num, unsigned int precision)
{
   unsigned int i, j;
   char value;
   if (precision%8)
   {
      value = *(num+precision/8);
      for (j = 8-precision%8; j < 8; ++j)
      fprintf(__bambu_testbench_fp, "%c", (((1LLU << (8 - j - 1)) & value) ? '1' : '0'));
   }
   for (i = 0; i < 8*(precision/8); i = i + 8)
   {
      value = *(num + (precision / 8) - (i / 8) - 1);
      for (j = 0; j < 8; ++j)
      fprintf(__bambu_testbench_fp, "%c", (((1LLU << (8 - j - 1)) & value) ? '1' : '0'));
   }
}

unsigned short icrc(unsigned short, unsigned char*, unsigned int, short, int);

#undef main
int main()
{
   unsigned long long __testbench_index;
   __standard_exit = 0;
   __bambu_testbench_fp = fopen("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/values.txt", "w");
   if (!__bambu_testbench_fp) {
      perror("can't open file: /root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/values.txt");
      exit(1);
   }
   
   // parameters declaration
   unsigned short crc;
   unsigned char* lin;
   unsigned int len;
   short jinit;
   int jrev;
   fprintf(__bambu_testbench_fp, "//base address 1073741824\n");
   fprintf(__bambu_testbench_fp, "b01000000000000000000000000000000\n");
   {
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 115\n");
      fprintf(__bambu_testbench_fp, "m01110011\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 100\n");
      fprintf(__bambu_testbench_fp, "m01100100\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 102\n");
      fprintf(__bambu_testbench_fp, "m01100110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 102\n");
      fprintf(__bambu_testbench_fp, "m01100110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 103\n");
      fprintf(__bambu_testbench_fp, "m01100111\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 119\n");
      fprintf(__bambu_testbench_fp, "m01110111\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 72\n");
      fprintf(__bambu_testbench_fp, "m01001000\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 65\n");
      fprintf(__bambu_testbench_fp, "m01000001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 69\n");
      fprintf(__bambu_testbench_fp, "m01000101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 68\n");
      fprintf(__bambu_testbench_fp, "m01000100\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 115\n");
      fprintf(__bambu_testbench_fp, "m01110011\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 69\n");
      fprintf(__bambu_testbench_fp, "m01000101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 119\n");
      fprintf(__bambu_testbench_fp, "m01110111\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 100\n");
      fprintf(__bambu_testbench_fp, "m01100100\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 115\n");
      fprintf(__bambu_testbench_fp, "m01110011\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 102\n");
      fprintf(__bambu_testbench_fp, "m01100110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 114\n");
      fprintf(__bambu_testbench_fp, "m01110010\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 100\n");
      fprintf(__bambu_testbench_fp, "m01100100\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 106\n");
      fprintf(__bambu_testbench_fp, "m01101010\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 103\n");
      fprintf(__bambu_testbench_fp, "m01100111\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 112\n");
      fprintf(__bambu_testbench_fp, "m01110000\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 105\n");
      fprintf(__bambu_testbench_fp, "m01101001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 109\n");
      fprintf(__bambu_testbench_fp, "m01101101\n");
      // next_object_offset > param_mem_size
      for (__testbench_index = 0; __testbench_index < 471; ++__testbench_index)
         fprintf(__bambu_testbench_fp, "m00000000\n");
   }
   {
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 115\n");
      fprintf(__bambu_testbench_fp, "m01110011\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 100\n");
      fprintf(__bambu_testbench_fp, "m01100100\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 102\n");
      fprintf(__bambu_testbench_fp, "m01100110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 102\n");
      fprintf(__bambu_testbench_fp, "m01100110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 103\n");
      fprintf(__bambu_testbench_fp, "m01100111\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 119\n");
      fprintf(__bambu_testbench_fp, "m01110111\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 72\n");
      fprintf(__bambu_testbench_fp, "m01001000\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 65\n");
      fprintf(__bambu_testbench_fp, "m01000001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 69\n");
      fprintf(__bambu_testbench_fp, "m01000101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 68\n");
      fprintf(__bambu_testbench_fp, "m01000100\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 115\n");
      fprintf(__bambu_testbench_fp, "m01110011\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 69\n");
      fprintf(__bambu_testbench_fp, "m01000101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 119\n");
      fprintf(__bambu_testbench_fp, "m01110111\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 100\n");
      fprintf(__bambu_testbench_fp, "m01100100\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 115\n");
      fprintf(__bambu_testbench_fp, "m01110011\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 70\n");
      fprintf(__bambu_testbench_fp, "m01000110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 102\n");
      fprintf(__bambu_testbench_fp, "m01100110\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 97\n");
      fprintf(__bambu_testbench_fp, "m01100001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 101\n");
      fprintf(__bambu_testbench_fp, "m01100101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 114\n");
      fprintf(__bambu_testbench_fp, "m01110010\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 100\n");
      fprintf(__bambu_testbench_fp, "m01100100\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 106\n");
      fprintf(__bambu_testbench_fp, "m01101010\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 103\n");
      fprintf(__bambu_testbench_fp, "m01100111\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 112\n");
      fprintf(__bambu_testbench_fp, "m01110000\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 105\n");
      fprintf(__bambu_testbench_fp, "m01101001\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 109\n");
      fprintf(__bambu_testbench_fp, "m01101101\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 50\n");
      fprintf(__bambu_testbench_fp, "m00110010\n");
      fprintf(__bambu_testbench_fp, "//memory initialization for variable: internal_33801 value: 0\n");
      fprintf(__bambu_testbench_fp, "m00000000\n");
      // next_object_offset > param_mem_size
      for (__testbench_index = 0; __testbench_index < 469; ++__testbench_index)
         fprintf(__bambu_testbench_fp, "m00000000\n");
   }
   // return variable initialization
   unsigned short return_port;
   {
      // parameter initialization
      crc = 0;
      fprintf(__bambu_testbench_fp, "//parameter: crc value: 0\n");
      fprintf(__bambu_testbench_fp, "p0000000000000000\n");
      unsigned char lin_temp[] = {97,115,100,102,102,101,97,103,101,119,97,72,65,70,69,70,97,101,68,115,70,69,97,119,70,100,115,70,97,101,102,97,101,101,114,100,106,103,112,105,109};
      lin = (unsigned char*)lin_temp;
      fprintf(__bambu_testbench_fp, "//parameter: lin value: 1073741824\n");
      fprintf(__bambu_testbench_fp, "p01000000000000000000000000000000\n");
      len = 40;
      fprintf(__bambu_testbench_fp, "//parameter: len value: 40\n");
      fprintf(__bambu_testbench_fp, "p00000000000000000000000000101000\n");
      jinit = 0;
      fprintf(__bambu_testbench_fp, "//parameter: jinit value: 0\n");
      fprintf(__bambu_testbench_fp, "p0000000000000000\n");
      jrev = 1;
      fprintf(__bambu_testbench_fp, "//parameter: jrev value: 1\n");
      fprintf(__bambu_testbench_fp, "p00000000000000000000000000000001\n");
      // function call
      return_port = icrc(crc, lin, len, jinit, jrev);
      // print expected results
      {
         int i0=0;
         for(i0 = 0; i0 < 41; ++i0)
         {
            fprintf(__bambu_testbench_fp, "//expected value for output: lin[i0]\n");
            int i1;
            for(i1 = 0; i1 < 1; i1++)
            {
               fprintf(__bambu_testbench_fp, "o");
               _Ptd2Bin_(__bambu_testbench_fp, ((unsigned char *)&(lin[i0])) + i1, 8);
               fprintf(__bambu_testbench_fp, "\n");
            }
         }
         fprintf(__bambu_testbench_fp, "e\n");
      }
      fprintf(__bambu_testbench_fp, "o");
      _Dec2Bin_(__bambu_testbench_fp, return_port, 16);
      fprintf(__bambu_testbench_fp, "\n");
      fprintf(__bambu_testbench_fp, "e\n");
   }
   {
      // parameter initialization
      crc = 57266;
      fprintf(__bambu_testbench_fp, "//parameter: crc value: 57266\n");
      fprintf(__bambu_testbench_fp, "p1101111110110010\n");
      unsigned char lin_temp[] = {97,115,100,102,102,101,97,103,101,119,97,72,65,70,69,70,97,101,68,115,70,69,97,119,70,100,115,70,97,101,102,97,101,101,114,100,106,103,112,105,109,50,0};
      lin = (unsigned char*)lin_temp;
      fprintf(__bambu_testbench_fp, "//parameter: lin value: 1073742336\n");
      fprintf(__bambu_testbench_fp, "p01000000000000000000001000000000\n");
      len = 42;
      fprintf(__bambu_testbench_fp, "//parameter: len value: 42\n");
      fprintf(__bambu_testbench_fp, "p00000000000000000000000000101010\n");
      jinit = -1;
      fprintf(__bambu_testbench_fp, "//parameter: jinit value: -1\n");
      fprintf(__bambu_testbench_fp, "p1111111111111111\n");
      jrev = 1;
      fprintf(__bambu_testbench_fp, "//parameter: jrev value: 1\n");
      fprintf(__bambu_testbench_fp, "p00000000000000000000000000000001\n");
      // function call
      return_port = icrc(crc, lin, len, jinit, jrev);
      // print expected results
      {
         int i0=0;
         for(i0 = 0; i0 < 43; ++i0)
         {
            fprintf(__bambu_testbench_fp, "//expected value for output: lin[i0]\n");
            int i1;
            for(i1 = 0; i1 < 1; i1++)
            {
               fprintf(__bambu_testbench_fp, "o");
               _Ptd2Bin_(__bambu_testbench_fp, ((unsigned char *)&(lin[i0])) + i1, 8);
               fprintf(__bambu_testbench_fp, "\n");
            }
         }
         fprintf(__bambu_testbench_fp, "e\n");
      }
      fprintf(__bambu_testbench_fp, "o");
      _Dec2Bin_(__bambu_testbench_fp, return_port, 16);
      fprintf(__bambu_testbench_fp, "\n");
      fprintf(__bambu_testbench_fp, "e\n");
   }
   __standard_exit = 1;
   exit(0);
}

