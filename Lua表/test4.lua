--安全访问
--考虑如下情景：我们想确认在指定的库中是否存在某个函数。如果我们确定这个库确实存在
--那么可以直接使用if lib.foo then ... 否则，就得实用性如 if lib and lib.foo then ...的形式
--当表嵌套深度变得比较深时，这种写法就会很容易出错 比如
zip=company and company.directorand company.director.address and company.director.address.zipcode
--这种写法不仅冗长而且低效 该写法在一次成功的访问中对表进行了6次访问而非3次访问
--对于这种场景，诸如C#的一些编程语言提供了一种安全访问操作符(safe navigation operator)
--在c#中这种安全访问操作符被记为"?."例如 对于表达式a?.b 当a为nil时 其结果是nil而不会产生异常值
--使用这种操作符，可以将上例改写为
zip=company?.director?.address?.zipcode
--如果上述的成员访问过程中出现nil 安全访问操作符会正确地处理nil并最终返回nil
--Lua语言并没有提供安全访问操作符，并且认为也不应该提供这种操作符。一方面，lua语言在设计上力求简单
--另一方面，这种操作符也是非常有争议的，很多人就无理由地认为该操作符容易导致无意地编程错误
--不过，我们还是可以使用其他语句在lua语言中模拟安全访问操作符
--对于表达式a or {} 当a为nil时其结果是一个空表 因此
--对于表达式 a or {}.b 当a为nil时其结果也同样是nil 这样 我们就可以将之前地例子重写为
zip=(((company or {}).director or {}).address or {}).zipcode
--再进一步 我们还可以写得更短和更高效
E={}--可以在其他类似表达中复用
...
zip=(((company or E).director or E).address or E).zipcode
--确实 上述的语法比安全访问操作符更加复杂 不过尽管如此 表中的每一个字段名都只被使用了一次
--从而保证了尽可能少地对表进行访问 同时 还避免了向语言中引入新的操作符
