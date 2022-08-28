#define _CRT_SECURE_NO_WARNINGS
#include <string.h>
#include<stdio.h>
#include<stdlib.h>
#include "DynamicArray.h"

void test01() {
    //初始化动态数组
    Dynamic_Array* myArray = Init_Array();
    printf("数组容量:%d\n", Capacity_Array(myArray));
    printf("数组大小:%d\n", Size_Array(myArray));
    //插入元素
    //30
    for (int i = 0; i < 30; i++) {
        PushBack_Array(myArray, i);
    }
    printf("数组容量:%d\n", Capacity_Array(myArray));
    printf("数组大小:%d\n", Size_Array(myArray));
    //打印
    Print_Array(myArray);
    //delete
    RemoveByPos_Array(myArray, 0);
    RemoveByValue_Array(myArray,27);
    //print
    Print_Array(myArray);
    //查找第5个位置
    int pos = Find_Array(myArray, 5);
    printf("5查找到pos:%d %d\n", pos,At_Array(myArray,pos));

    //销毁
    FreeSpace_Array(myArray);
}
int main(void)
{
    test01();
    system("pause");
    return 0;
}