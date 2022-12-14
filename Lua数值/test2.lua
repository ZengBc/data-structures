--随机数发生器
--函数math.random用于生成伪随机数，共有三种调用方式
--当不带参数时 该函数将返回一个[0,1)范围内均匀分布的伪随机实数。
--当使用带有一个整型值n的参数调用时 该函数将返回一个在[1,n]范围内的伪随机整数
--例如我们可以通过调用random(6)来模拟掷骰子的结果
--当使用带有两个整型值l和u的参数调用时 该函数返回在[l,u]范围内的伪随机整数
--函数randomseed用于设置伪随机数发生器的种子，该函数的唯一参数就是数值类型的种子
--在一个程序启动时，系统固定使用1为种子初始化伪随机数发生器。如果不设置其他的种子，、
--那么每次程序运行时都会生成相同的伪随机数序列
--从调试的角度看 这是一个不错的特性
--然而 对于一个游戏来说却会导致相同的场景重复不断地出现 为了解决这个问题
--通常调用 math.randomseed(os.time())来使用当前系统时间作为种子初始化随机数发生器
--取整函数
--数学库提供了三个取整函数floor ceil modf 其中 floor向负无穷取整 ceil向正无穷取整
--modf向零取整 当取证结果能够用整型表示时 返回结果为整数值 否则返回浮点型值 当然 表示的是整数值
--除了返回取整后的值以外 函数modf还会返回小数部分作为第二个结果
math.floor(3.3)
math.floor(-3.3)
math.ceil(3.3)
math.ceil(-3.3)
math.modf(3.3)
math.modf(-3.3)
math.floor(2^70)
