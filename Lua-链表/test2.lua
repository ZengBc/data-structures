-- 由于表是动态对象，所以在Lua语言中可以很容易地实现链表(linked list)
-- 我们可以把每个节点用一个表来表示(也只能用表表示)，链接则为一个包含指向其他表的引用的简单表字段
-- 例如 让我们实现一个单链表(singly-linked list)，其中每个节点具有两个字段value 和next 最简单的变量就是根结点
list = nil
-- 要在表头插入一个值为v的元素 可以使用如下的代码
list={next=list,value=v}
-- 可以通过如下的方式遍历链表
local l=list
while l do
	visit l.value
	l=l.next
end
-- 诸如双向链表(doubly-linked list)或环形表(circular list)等其他类型的链表也很容易实现
-- 不过通常无须链表即可用更简单的方式来表示数据，所以在Lua语言中很少需要用到这些数据结构
-- 例如 我们可以通过一个无界数数组(unbounded array)来表示栈
