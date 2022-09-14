--遍历表
--我们可以使用pairs迭代器遍历表中的键值对
t={10,print,x=12,k="hi"}
for k,v in pairs(t) do
 print(k,v)
end
--受限于表在lua语言中的底层实现机制，遍历过程中元素的出现顺序可能是随机的
--相同的程序在每次运行时也可能产生不同的顺序 唯一可以确定的是 在遍历的过程中每个元素会且只出现一次
--对于列表而言 可以使用ipairs迭代器
t={10,print,12,"hi"}
for k,v in ipairs(t) do
 print(k,v)
end
--此时 lua会确保遍历是按照顺序进行的
--另一种遍历序列的方法是使用数值型循环for
t={10,print,12,"hi"}
for k=1,#t do
 print(k,t[k])end
