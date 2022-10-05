--函数不仅可以被存储在全局变量中，还可以被存储在表字段和局部变量中
--我们已经在前面的章节中见到过几个将函数存储在表字段中的示例，大部分lua语言的库就采用了
--这种机制例如io.read math.sin 如果要在lua语言中创建这种函数
--只需将到目前为止我们所学到的只是结合起来
Lib={}
Lib.foo=function(x,y)return x+y end
Lib.goo=function(x,y)return x-y end
print(Lib.foo(2,3),Lib.goo(2,3))

--表构造器
Lib={
foo=function(x,y)return x+y end,
goo=function(x,y)return x-y end
}
--lua还提供了另一种特殊的语法来定义这类函数
Lib={}
function Lib.foo(x,y) return x+y end
function Lib.goo(x,y) return x-y end
--在表字段中存储函数是lua语言中实现面向对象编程的关键要素
--当把一个函数存储到局部变量时，就得到了一个局部函数 local function
--即一个被限定在指定作用域中使用的函数
--局部函数对于包package而言尤其有用 由于lua语言将每个程序段Chunk
--作为一个函数处理，所以在一段程序中生命的函数就是局部函数
--这些局部函数只在该程序段中可见 词法定界保证了程序段中的其他函数可以使用这些局部函数
--对于这种局部函数的使用 lua语言提供了一种语法糖
local function f(params)
	body
end
--在定义局部递归函数(recursive local function)
--由于原来的方法不适用 所以有一点是极易出错的 考虑如下的代码
local fact=function(n)
	if n==0 then return 1
	else return n*fact(n-1) --有问题
	end
end
--当lua语言编译函数体中的
--fact(n-1)调用时，局部的fact尚未定义。
--因此，这个表达式会尝试调用全局的fact而非局部的fact
--我们可以通过先定义局部变量再定义函数的方式来解决这个问题
local fact
fact=function(n)
	if n==0 then return 1
	else return n*fact(n-1)
end
end
--这样 函数内的fact指向的是局部变量。尽管在定义函数时，这个局部变量的值
--尚未确定，但到了执行函数时，fact肯定已经有了正确的赋值
--当lua语言展开局部函数的语法糖时，使用的并不是之前的基本函数定义。相反，形如
local function foo(params) body end
--的定义会被展开成
local foo;foo=function(params) body end
--因此，使用这种语法来定义递归函数不会有问题
--当然 这个技巧对于间接递归函数(indirect recursive function)是无效的。在间接递归的情况下
--必须使用与明确的前向生命(explicit forward declaration)等价的形式:
local f
local function g()
 some code f() some code
end
function f()
 some code g() some code
end
--请注意，不能在最后一个函数定义前加上local 否则，lua语言会创建一个全新的局部变量f
--从而使得先前声明的f(函数g中使用的那个)变为未定义状态

