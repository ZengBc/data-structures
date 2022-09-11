--eight-queen puzzle
--其目标是把8个皇后合理地摆放在棋盘上，让每个皇后之间都不能相互攻击
--要解决八皇后问题，首先必须认识到每一行中只能有一个皇后
--因此，可以用一个由8个数字组成的简单数组
--(一个数字对应一行，代表皇后在这一行的哪一列)来表示可能的解决方案
--此外 我们还必须认识到正确的解必须是整数1到8组成的排列(Permutation)
--这样才能保证每一列中也只有一个皇后
N=8--棋盘大小
--检查(n,c)是否不会被攻击
function isplaceok(a,n,c)
	for i=1,n-1 do--对于每一个已经被放置的皇后
		if(a[i]==c)or --同一列？
		  (a[i]-i==c-n)or --同一对角线?
		  (a[i]+i==c+n)then --同一对角线?
		  return false
		end
	end
	return true--不会被攻击 位置有效
end
--打印棋盘
function printsolution(a)
	for i=1,N do--对于每一行
		for j=1,N do--和每一列
			--输出"X"或"-" 外加一个空格
			io.write(a[i]==j and "X" or "-"," ")
		end
		io.write("\n")
	end
	io.write("\n")
end
--把从'n'到'N'的所有皇后放在棋盘'a'上
function addqueen(a,n)
	if n>N then--是否所有的皇后都被放置好了?
		printsolution(a)
	else--尝试着放置第n个皇后
		for c=1,N do
			if isplaceok(a,n,c) then
				a[n]=c--把第n个皇后放在列'c'
				addqueen(a,n+1)
			end
		end
	end
end

addqueen({},1)
--第一个函数是isplaceok,该函数用来检查如果在棋盘上指定位置放置皇后
--是否会受到之前被放置的皇后的攻击
--更确切地说 该函数用来检查将第n个皇后放在第c列上时
--是否会与之前已经被放置在数组a中地n-1个皇后发生冲突
--请注意，由于我们使用的表示方法保证了两个皇后不会位于同一行，
--所以函数isplaceok只需要检查新的位置上是否有皇后在同一列或对角线上即可
--接下来我们使用printsolution打印出棋盘，该函数知识简单地遍历整个棋盘，
--在有皇后的位置输出X，而在其他位置输出-，没有使用花哨的图形(注意and-or)的用法
--最后一个函数是这段程序的核心，该函数尝试着将所有大于等于n的皇后摆在棋盘上
--使用回溯法来搜索正确的解
--首先该函数检查当前解是否已经完成了所有皇后的摆放，如果已经完成则打印出当前解对应的摆放结果
--如果还没有完成，则为第n个皇后遍历所有的列，将皇后放置在不会收到攻击的每一列上
--并递归地寻找下一个皇后的可能摆放位置
