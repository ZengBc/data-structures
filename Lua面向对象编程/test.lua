--�Ӻܶ������Ͻ���Lua�����е�һ�ű����һ������
--���ȣ��������һ��������ӵ��״̬
--��� �������һ�� ӵ��һ������ֵ�޹صı�ʶ(self)
--�ر�أ�����������ֵͬ�Ķ������������ͬ�Ķ��󣬶�һ��������Ծ��ж����ͬ��ֵ
--�������һ���������봴���ߺͱ�����λ���޹ص���������
--���������Լ��Ĳ��� ��Ҳ�������Լ��Ĳ��� ����
Account={balance=0}
function Account.withdraw(v)
	Account.balance=Account.balance-v
end
--����Ĵ��봴����һ������ �����ú�������Account�����withdraw�ֶ� Ȼ�����ǾͿ��Ե���
--�������µĵ���
Account.withdraw(100.00)
--���ֺ�����������ν�ķ����� �����ں�����ʹ��ȫ������Account
--��һ���ǳ����ı��ϰ�ߣ����ȣ��������ֻ������ض�������
--��� ��ʹ����ض��Ķ��� �������Ҳֻ���ڶ��󱣴����ض���ȫ�ֱ�����ʱ���ܹ���
--������Ǹı��˶�������ƣ�withdraw�Ͳ��ܹ�����
--a,Account=Account,nil
--a.withdraw(100.00)error
--������ΪΥ������ӵ�ж����������ڵ�ԭ��
--��һ�ָ�����ԭ��ķ����ǶԲ����Ľ����߽��в�������ˣ����ǵķ�����Ҫһ������Ĳ�������ʾ�ý�����
function Account.withdraw(self,v)
	self.balance=self.balance-v
end
--��ʱ�������ǵ����������ʱ������ָ��Ҫ�����Ķ���
a1=Account;Account=nil
a1.withdraw(a1,100.00)
a2={balance=0,withdraw=Account.withdraw}
--ʹ�ò���self����������������Եĺ��ĵ㡣���������������Զ������Ա�������������
--�Ӷ�ʹ�ó���Ա������ʽ�������������(��Ȼ����Ա��Ȼ�����ڷ�����ʹ��self����this)
--Lua����ͬ������ʹ��ð�Ų�����(colon operator)���ظò��� ʹ��ð�Ų�����
--���ǿ��Խ�������дΪa2:withdraw(260.00)
function Account:withdraw(v)
	self.balance=self.balance-v
end
--ð�ŵ���������һ������������һ�������ʵ�Σ����ڷ����Ķ���������һ������������βΡ�ð��ֻ��
--ֻ��һ���﷨���ƣ���Ȼ�ܱ�������û�������κ��µĶ��������ǿ���ʹ�õ���﷨������һ������
--Ȼ����ð���﷨������
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
