--������Ϊ��ʱwhileѭ�����ظ�ִ����ѭ���� lua�����Ȳ���while�������� ������Ϊ����ѭ������
--����lua��ִ��ѭ���岢���ϵ��ظ��������
local i=1
while a[i] do
 print(a[i])
 i=i+1
end
--repeat
--repeat-until �����ظ�ִ����ѭ����ֱ������Ϊ��ʱ���� ��������������ѭ����֮��ִ��
--����ѭ�������ٻ�ִ��һ��
local line
repeat
	line=io.read()
until line~=""
print(line)
--����������������Բ�ͬ����Lua�����У�ѭ�����������ľֲ������������������������
--ʹ�� newton-raphson������'x'��ƽ����
local sqr=x/2
repeat
 sqr=(sqr+x/sqr)/2
 localerror=math.abs(sqr^2-x)
until error<x/10000--�ֲ�����'error'��ʱ��Ȼ�ɼ�
