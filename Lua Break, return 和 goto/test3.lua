--break和return语句用于从当前的循环结构中跳出，goto语句则允许跳转到函数中的几乎任何地方
--我们可以使用break语句结束循环，该语句会中断包含它的内层循环(例如for repeat while)
--该语句不能在循环外使用。break中断后 程序会紧接着被终端的循环继续执行
--return语句用于返回函数的执行结果或简单地结束函数的运行。所有函数的最后都有一个隐含的return
--因此我们不需要在每一个没有返回值的函数最后书写return语句
--按照语法，return只能是代码块的最后一句，换句话说，它只能是代码块的最后一句，或者是end else until之前的最后一句
--return 是 then代码的最后一句
local i=1
while a[i] do
 if a[i]==v then returni end
 i=i+1
end
--通常这些地方正式使用return的典型位置，return之后的语句不会被执行
--不过，有时在代码块中间使用return也是很有用的 例如 在调试时我们可能不想让某个函数执行
--
function foo()
 return
 do return end
 other statements
end

--goto语句用于将当前程序跳转到相应的标签出继续执行，goto语句一直以来备受争议
--至今仍有很多人认为它们不利于程序开发并且应该在编程语言中禁止 不过尽管如此
--仍有很多语言处于很多原因保留了goto语句 goto语句有强大的功能
--在lua中，goto语句的语法非常传统 即保留字goto 后?
--紧跟着标签名，标签名可以是任意有效的标识符 标签的语法稍微有点复杂 标签名称前后各紧跟着两个冒号，形如::name::
--这个复杂的语法就是有意而为的，主要是为了在程序中醒目的突出这些标签
--使用 goto跳转时，lua设置了些限制，首先 标签遵循常见的可见性原则
--因此不能直接跳转到一个代码块中的标签(因为代码块中的标签对外不可见)
--goto不能跳转到局部变量的作用域
--关于goto语句典型且正确的使用方式，请参考其他一些编程语言中存在但lua中不存在的代码结构
--continue redo
--continue语句仅仅相当于一个跳转到位于循环体最后位置处标签的goto语句 而redo语句则相当于跳转到代码块开始位置的goto语句

while some_condition do
	::redo::
	if some_other_condition then goto continue
	elseif yet_another_condition then goto redo
	end
	some code
	::continue::
end
--lua语言规范中一个很有用的细节是，局部变量的作用域终止于声明变量的代码块中的最后一个有效(non-void)
--标签被认为是无效语句
while some_condition do
 if some_other_condition then goto continue and
  local var =something
  some code
::continue::
end
--读者可能认为 这个goto语句跳转到了变量var的作用域内 但实际上这个continue标签出现在改代码块的最后一个有效语句后
--因此goto并未跳转进入变量var的作用域内
--goto语句在编写状态机时也很有用 给出了一个是否包含偶数个0的程序

::s1:: do
local c=io.read(1)
if c=='0' then goto s2
elseif c==nil then print'ok';return
else goto s1
end
end

::s2:: do
local c=io.read(1)
if c=='0'then goto s1
elseif c==nil then print'not ok';return
else goto s2
end
end
goto s1

--虽然可以使用过呢更好的方式来编写这段代码 但上例中的方法有助于将一个有限自动机(finite automation)
--自动地转化为lua语言代码(请考虑动态代码生成(dynamic code generation))
--再举一个简单的迷宫游戏的例子。迷宫中有几个房间，每个房间的东南西北方向各有一扇门，玩家每次可以输入移动的方向，如果在这个方向上有一扇门
--则玩家可以进入相应的房间，否则程序输出一个警告，玩家的最终目的是从第一个房间走到最后一个房间
--这个游戏是一个典型的状态机，当前玩家锁在房间就是一个状态，为实现这个迷宫游戏，我们可以为每个房间对应的逻辑编写一段代码，然后用Goto语句表示
--从一个房间移动到另一个房间
--由四个房间组成的小迷宫

goto room1 --起始房间
::room1:: do
local move =io.read()
if move=='south' then goto room3
elseif move=='east' then goto room2
else
print('invalid move')
goto room1
end
end
::room2::do
local move =io.read()
if move=='south' then goto room4
elseif move=='west' then goto room1
else
print("invalid move")
goto room2
end
end

::room3::do
local move=io.read()
if move=='north' then goto room1
elseif move=='east' then goto room4
else
print("invalid move")
goto room3
end
end

::room4:: do
print("congratulations, you won!")
end


--对于这个简单的游戏，读者可能会发现，使用数据驱动编程(使用表来描述房间和移动)是一种更好的设计方法。不过，如果游戏中的每间房都各自不同，那么就非常适合
--使用这种状态机的实现方法
