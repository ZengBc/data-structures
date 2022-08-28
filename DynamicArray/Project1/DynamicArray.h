#ifndef DYNAMIC_ARRAY_H
#define DYNAMIC_ARRAY_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//��̬�����ڴ� ���ԣ���������ݵ��ڴ�Ŷ���
//��̬���� ���5��Ԫ�� �����ڴ� �������� �ͷ��ڴ�6 ������߸� capacity
// capacity��ʾ�ҵ�����ڴ�ռ�һ�����Դ�Ŷ���Ԫ��
// size �����¼��ǰ�����о����Ԫ�ظ���

//��̬����Ľṹ�嶨��
typedef struct DYNAMICARRAY
{
    int* pAddr;   //������ݵĵ�ַ
    int size;     //��ǰ�ж���Ԫ��
    int capacity; //���� ��������������ɶ���Ԫ��
} Dynamic_Array;

//дһϵ�е���ض�DYNAMICARRAY�ṹ������ĺ���
//��ʼ��
Dynamic_Array* Init_Array();
//����
void FreeSpace_Array(Dynamic_Array* arr);
void PushBack_Array(Dynamic_Array* arr, int value);
//����λ��ɾ��
void RemoveByPos_Array(Dynamic_Array* arr, int pos);
//����ֵɾ��
void RemoveByValue_Array(Dynamic_Array* arr, int pos);
//����
int Find_Array(Dynamic_Array* arr, int value);
//��ӡ
void Print_Array(Dynamic_Array* arr);
//�ͷŶ�̬������ڴ�

//�������
void Clear_Array(Dynamic_Array* arr);
//��ö�̬��������
int Capacity_Array(Dynamic_Array* arr);
//��ö�̬���鵱ǰԪ�ظ���
int Size_Array(Dynamic_Array* arr);
//����λ�û��ĳ��λ��Ԫ��
int At_Array(Dynamic_Array* arr, int pos);
#endif