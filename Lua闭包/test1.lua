--�����������Ա��洢��ȫ�ֱ����У������Ա��洢�ڱ��ֶκ;ֲ�������
--�����Ѿ���ǰ����½��м����������������洢�ڱ��ֶ��е�ʾ�����󲿷�lua���ԵĿ�Ͳ�����
--���ֻ�������io.read math.sin ���Ҫ��lua�����д������ֺ���
--ֻ�轫��ĿǰΪֹ������ѧ����ֻ�ǽ������
Lib={}
Lib.foo=function(x,y)return x+y end
Lib.goo=function(x,y)return x-y end
print(Lib.foo(2,3),Lib.goo(2,3))

--������
Lib={
foo=function(x,y)return x+y end,
goo=function(x,y)return x-y end
}
--lua���ṩ����һ��������﷨���������ຯ��
Lib={}
function Lib.foo(x,y) return x+y end
function Lib.goo(x,y) return x-y end
--�ڱ��ֶ��д洢������lua������ʵ����������̵Ĺؼ�Ҫ��
--����һ�������洢���ֲ�����ʱ���͵õ���һ���ֲ����� local function
--��һ�����޶���ָ����������ʹ�õĺ���
--�ֲ��������ڰ�package������������ ����lua���Խ�ÿ�������Chunk
--��Ϊһ����������������һ�γ����������ĺ������Ǿֲ�����
--��Щ�ֲ�����ֻ�ڸó�����пɼ� �ʷ����籣֤�˳�����е�������������ʹ����Щ�ֲ�����
--�������־ֲ�������ʹ�� lua�����ṩ��һ���﷨��
local function f(params)
	body
end
--�ڶ���ֲ��ݹ麯��(recursive local function)
--����ԭ���ķ��������� ������һ���Ǽ��׳���� �������µĴ���
local fact=function(n)
	if n==0 then return 1
	else return n*fact(n-1) --������
	end
end
--��lua���Ա��뺯�����е�
--fact(n-1)����ʱ���ֲ���fact��δ���塣
--��ˣ�������ʽ�᳢�Ե���ȫ�ֵ�fact���Ǿֲ���fact
--���ǿ���ͨ���ȶ���ֲ������ٶ��庯���ķ�ʽ������������
local fact
fact=function(n)
	if n==0 then return 1
	else return n*fact(n-1)
end
end
--���� �����ڵ�factָ����Ǿֲ������������ڶ��庯��ʱ������ֲ�������ֵ
--��δȷ����������ִ�к���ʱ��fact�϶��Ѿ�������ȷ�ĸ�ֵ
--��lua����չ���ֲ��������﷨��ʱ��ʹ�õĲ�����֮ǰ�Ļ����������塣�෴������
local function foo(params) body end
--�Ķ���ᱻչ����
local foo;foo=function(params) body end
--��ˣ�ʹ�������﷨������ݹ麯������������
--��Ȼ ������ɶ��ڼ�ӵݹ麯��(indirect recursive function)����Ч�ġ��ڼ�ӵݹ�������
--����ʹ������ȷ��ǰ������(explicit forward declaration)�ȼ۵���ʽ:
local f
local function g()
 some code f() some code
end
function f()
 some code g() some code
end
--��ע�⣬���������һ����������ǰ����local ����lua���Իᴴ��һ��ȫ�µľֲ�����f
--�Ӷ�ʹ����ǰ������f(����g��ʹ�õ��Ǹ�)��Ϊδ����״̬

