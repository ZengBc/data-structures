-- 我们使用构造器表达式(constructor expression)创建表，其最简单的形式是{}
a={}--创建一个表然后用表的引用赋值
k="x"
a[k]=10--新元素，键是"x",值是10
a[20]="great" --新元素，键是20，值是"great"
print(a["x"])
k=20
print(a[k])-->"great"
a["x"]=a["x"]+1
print(a["x"])
--表永远是匿名的，表本身和保存表的变量之间没有固定的关系
a={}
a["x"]=10
b=a
print(b["x"])
b["x"]=20
print(a["x"])
a=nil
b=nil
