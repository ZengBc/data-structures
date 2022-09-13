--当条件为真时while循环会重复执行其循环体 lua语言先测试while语句的条件 若条件为假则循环结束
--否则，lua会执行循环体并不断地重复这个过程
local i=1
while a[i] do
 print(a[i])
 i=i+1
end
--repeat
--repeat-until 语句会重复执行其循环体直到条件为真时结束 由于条件测试在循环体之后执行
--所以循环体至少会执行一次
local line
repeat
	line=io.read()
until line~=""
print(line)
--与大多数其他编程语言不同，在Lua语言中，循环体内声明的局部变量的作用域包括测试条件
--使用 newton-raphson法计算'x'的平方根
local sqr=x/2
repeat
 sqr=(sqr+x/sqr)/2
 localerror=math.abs(sqr^2-x)
until error<x/10000--局部变量'error'此时仍然可见
