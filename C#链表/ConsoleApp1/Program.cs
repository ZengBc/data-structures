using System;
using System.Collections.Generic;

namespace LinearList
{
    class Program
    {
        static void Main(string[] args)
        {
            //List<string> strList = new List<string>();
            //strList.Add("123");//0
            //strList.Add("456");//1
            //strList.Add("789");//2
            //Console.WriteLine(strList[1]);//通过索引器访问元素
            //strList.Remove("789");
            //Console.WriteLine(strList.Count);
            //strList.Clear();
            //Console.ReadKey();

            //使用自己的顺序表
            LinkList<string> seqList = new LinkList<string>();
            seqList.Add("123");//0
            seqList.Add("456");//1
            seqList.Add("789");//2

            Console.WriteLine(seqList.GetEle(0));
            Console.WriteLine(seqList[0]);
            seqList.Insert("777", 1);
            for (int i = 0; i < seqList.GetLength(); i++)
            {
                Console.Write(seqList[i] + " ");
            }
            Console.WriteLine();
            seqList.Delete(0);
            for (int i = 0; i < seqList.GetLength(); i++)
            {
                Console.Write(seqList[i] + " ");
            }
            Console.WriteLine();
            seqList.Clear();
            Console.WriteLine(seqList.GetLength());
            Console.ReadKey();
        }
    }
}
