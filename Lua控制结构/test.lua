--lua提供了一组精简且常用的控制结构(control structure) 包括用于条件执行的if以及用于循环的while repeat和for
--所有的控制结构语法上都有一个显式的终结符 end
--用于终结if for及while结构,until用于终结repeat结构
--控制结构的条件表达式(condition expression)的结果可以是任何值
--lua语言将所有不是false和nil的值当作真(lua将0和空字符串也当作真)
--if语句先测试其条件，并根据条件是否满足执行相应的then部分或else部分 else部分是可选的
if a<0 then a=0 end
if a<b then return a else return b end

if lines>MAXLINES then
	showpage()
	line=0
end

--如果要编写嵌套的if语句，可以使用elseif
--它类似于在else后面紧跟一个if 可以避免重复使用end
if op=="+" then
r=a+b
elseif op=="-" then
r=a-b
elseif op=="*" then
r=a*b
elseif op=="/" then
r=a/b
else
error("invalid operation")
end
--由于lua语言不支持switch语句 所以这种一连串的else-if语句比较常见
