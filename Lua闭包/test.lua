-- 函数是第一类值
a={p=print} --a.p指向print函数
a.p("Hello World")--Hello World
print=math.sin --'print'现在指向sine函数
a.p(print(1))
math.sin=a.p --sin现在指向print函数
math.sin(10,20)
--如果函数也是值的话，那么是否有创建函数的表达式呢？
--lua语言中常见的函数定义方式如下
function foo(x) return 2*x end
--所谓的语法糖 syntactic sugar的例子 它只是下面这种写法的一种美化形式
foo=function(x) return 2*x end
--赋值语句右边的表达式(function(x) body end)就是函数构造器，与
--表构造器{}相似
--因此 函数定义实际上就是创建类型为function的值并把它赋值给一个变量的语句
--请注意，在lua语言中 ，所有的函数都是匿名的。
--像其他所有的值一样 函数并没有名字
--当讨论函数名时，比如print，实际上指的是保存该函数的变量
--虽然我们通常会把函数赋值给全局变量，从而看似给函数起了一个名字，但在很多场景下仍然会保留函数的匿名性
--表标准库提供了函数table.sort 该函数以一个表为参数并对其中的元素排序
--这种函数必须支持各种各样的排序方式：升序或降序、按数值顺序或按字母顺序、按表中的键等
--函数sort并没有试图穷尽所有的排序方式，而是提供了一个可选的参数
--也就是所谓的排序函数(order function)
--排序函数接受两个参数并根据第一个元素是否应排在第二个元素之前返回不同的值
--例如 假设有一个如下所示的表
network={
{name="grauna",IP="210.26.30.34"},
{name="arraial",IP="210.26.30.23"},
{name="lua",IP="210.26.23.12"},
{name="derain",IP="210,26,23,20"},
}
--如果想针对name字段、按字母顺序逆序对这个表排序，只需使用如下语句
table.sort(network,function(a,b)return(a.name>b.name)end)
--可见，匿名函数在这条语句中显示出了很好的便利性
--像sort这样以另一个函数为参数的函数，我们称之为高阶函数(high-order function)
--高阶函数是一种强大的编程机制，而利用匿名函数作为参数正式其灵活性的主要来源
--不过尽管如此，请记住高阶函数也没有什么特殊的，它们只是lua语言将函数作为第一类值处理所带来结果的直接表现
--为了进一步演示高阶函数的用法，让我们再来实现一个常见的高阶函数，即导数(derivative)
function derivative(f,delta)
	delta=delta or 1e-4
	return function(x)
				return (f(x+delta)-f(x))/delta
			end
end
--对于指定的函数f 调用derivative(f)将返回近似地其导数 也就是另一个函数
c=derivative(math.sin)
print(math.cos(5.2),c(5.2))
