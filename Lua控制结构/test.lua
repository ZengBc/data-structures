--lua�ṩ��һ�龫���ҳ��õĿ��ƽṹ(control structure) ������������ִ�е�if�Լ�����ѭ����while repeat��for
--���еĿ��ƽṹ�﷨�϶���һ����ʽ���ս�� end
--�����ս�if for��while�ṹ,until�����ս�repeat�ṹ
--���ƽṹ���������ʽ(condition expression)�Ľ���������κ�ֵ
--lua���Խ����в���false��nil��ֵ������(lua��0�Ϳ��ַ���Ҳ������)
--if����Ȳ����������������������Ƿ�����ִ����Ӧ��then���ֻ�else���� else�����ǿ�ѡ��
if a<0 then a=0 end
if a<b then return a else return b end

if lines>MAXLINES then
	showpage()
	line=0
end

--���Ҫ��дǶ�׵�if��䣬����ʹ��elseif
--����������else�������һ��if ���Ա����ظ�ʹ��end
if op=="+" then
r=a+b
elseif op=="-" then
r=a-b
elseif op=="*" then
r=a*b
elseif op=="/" then
r=a/b
else
error("invalid operation")
end
--����lua���Բ�֧��switch��� ��������һ������else-if���Ƚϳ���
