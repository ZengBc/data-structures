--从很多意义上讲，Lua语言中的一张表就是一个对象
--首先，表与对象一样，可以拥有状态
--其次 表与对象一样 拥有一个与其值无关的标识(self)
--特别地，两个具有相同值的对象表是两个不同的对象，而一个对象可以具有多个不同的值
--表与对象一样，具有与创建者和被创建位置无关的生命周期
--对象有其自己的操作 表也可以有自己的操作 例如
Account={balance=0}
function Account.withdraw(v)
	Account.balance=Account.balance-v
end
--上面的代码创建了一个函数 并将该函数存入Account对象的withdraw字段 然后我们就可以调用
--进行如下的调用
Account.withdraw(100.00)
--这种函数差不多就是所谓的方法了 不过在函数中使用全局名称Account
--是一个非常糟糕的编程习惯，首先，这个函数只能针对特定对象工作
--其次 即使针对特定的对象 这个函数也只有在对象保存在特定的全局变量中时才能工作
--如果我们改变了对象的名称，withdraw就不能工作了
--a,Account=Account,nil
--a.withdraw(100.00)error
--这种行为违反对象拥有独立生命周期的原则
--另一种更加有原则的方法是对操作的接受者进行操作。因此，我们的方法需要一个额外的参数来表示该接收者
function Account.withdraw(self,v)
	self.balance=self.balance-v
end
--此时，当我们调用这个方法时，必须指定要操作的对象
a1=Account;Account=nil
a1.withdraw(a1,100.00)
a2={balance=0,withdraw=Account.withdraw}
--使用参数self是所有面向对象语言的核心点。大多数面向对象语言都向程序员隐藏了这个机制
--从而使得程序员不必显式地声明这个参数(虽然程序员仍然可以在方法内使用self或者this)
--Lua语言同样可以使用冒号操作符(colon operator)隐藏该参数 使用冒号操作符
--我们可以将上例重写为a2:withdraw(260.00)
function Account:withdraw(v)
	self.balance=self.balance-v
end
--冒号的作用是在一个方法中增加一个额外的实参，或在方法的定义中增加一个额外的隐藏形参。冒号只是
--只是一种语法机制，虽然很便利，但没有引入任何新的东西，我们可以使用点分语法来定义一个函数
--然后用冒号语法调用它
Account={balance=0,
		withdraw=function(self,v)
		self.balance=self.balance-v
		end
		}
function Account:deposit(v)
	self.balance=self.balance+v
end
Account.deposit(Account,200.00)
Account.withdraw(100.00)
