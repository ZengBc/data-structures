#define _CRT_SECURE_NO_WARNINGS
#include <string.h>
#include<stdio.h>
#include<stdlib.h>
#include "DynamicArray.h"

void test01() {
    //��ʼ����̬����
    Dynamic_Array* myArray = Init_Array();
    printf("��������:%d\n", Capacity_Array(myArray));
    printf("�����С:%d\n", Size_Array(myArray));
    //����Ԫ��
    //30
    for (int i = 0; i < 30; i++) {
        PushBack_Array(myArray, i);
    }
    printf("��������:%d\n", Capacity_Array(myArray));
    printf("�����С:%d\n", Size_Array(myArray));
    //��ӡ
    Print_Array(myArray);
    //delete
    RemoveByPos_Array(myArray, 0);
    RemoveByValue_Array(myArray,27);
    //print
    Print_Array(myArray);
    //���ҵ�5��λ��
    int pos = Find_Array(myArray, 5);
    printf("5���ҵ�pos:%d %d\n", pos,At_Array(myArray,pos));

    //����
    FreeSpace_Array(myArray);
}
int main(void)
{
    test01();
    system("pause");
    return 0;
}