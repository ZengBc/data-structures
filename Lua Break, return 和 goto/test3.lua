--break��return������ڴӵ�ǰ��ѭ���ṹ��������goto�����������ת�������еļ����κεط�
--���ǿ���ʹ��break������ѭ�����������жϰ��������ڲ�ѭ��(����for repeat while)
--����䲻����ѭ����ʹ�á�break�жϺ� ���������ű��ն˵�ѭ������ִ��
--return������ڷ��غ�����ִ�н����򵥵ؽ������������С����к����������һ��������return
--������ǲ���Ҫ��ÿһ��û�з���ֵ�ĺ��������дreturn���
--�����﷨��returnֻ���Ǵ��������һ�䣬���仰˵����ֻ���Ǵ��������һ�䣬������end else until֮ǰ�����һ��
--return �� then��������һ��
local i=1
while a[i] do
 if a[i]==v then returni end
 i=i+1
end
--ͨ����Щ�ط���ʽʹ��return�ĵ���λ�ã�return֮�����䲻�ᱻִ��
--��������ʱ�ڴ�����м�ʹ��returnҲ�Ǻ����õ� ���� �ڵ���ʱ���ǿ��ܲ�����ĳ������ִ��
--
function foo()
 return
 do return end
 other statements
end

--goto������ڽ���ǰ������ת����Ӧ�ı�ǩ������ִ�У�goto���һֱ������������
--�������кܶ�����Ϊ���ǲ����ڳ��򿪷�����Ӧ���ڱ�������н�ֹ �����������
--���кܶ����Դ��ںܶ�ԭ������goto��� goto�����ǿ��Ĺ���
--��lua�У�goto�����﷨�ǳ���ͳ ��������goto ���
--�����ű�ǩ������ǩ��������������Ч�ı�ʶ�� ��ǩ���﷨��΢�е㸴�� ��ǩ����ǰ�������������ð�ţ�����::name::
--������ӵ��﷨���������Ϊ�ģ���Ҫ��Ϊ���ڳ�������Ŀ��ͻ����Щ��ǩ
--ʹ�� goto��תʱ��lua������Щ���ƣ����� ��ǩ��ѭ�����Ŀɼ���ԭ��
--��˲���ֱ����ת��һ��������еı�ǩ(��Ϊ������еı�ǩ���ⲻ�ɼ�)
--goto������ת���ֲ�������������
--����goto����������ȷ��ʹ�÷�ʽ����ο�����һЩ��������д��ڵ�lua�в����ڵĴ���ṹ
--continue redo
--continue�������൱��һ����ת��λ��ѭ�������λ�ô���ǩ��goto��� ��redo������൱����ת������鿪ʼλ�õ�goto���

while some_condition do
	::redo::
	if some_other_condition then goto continue
	elseif yet_another_condition then goto redo
	end
	some code
	::continue::
end
--lua���Թ淶��һ�������õ�ϸ���ǣ��ֲ���������������ֹ�����������Ĵ�����е����һ����Ч(non-void)
--��ǩ����Ϊ����Ч���
while some_condition do
 if some_other_condition then goto continue and
  local var =something
  some code
::continue::
end
--���߿�����Ϊ ���goto�����ת���˱���var���������� ��ʵ�������continue��ǩ�����ڸĴ��������һ����Ч����
--���goto��δ��ת�������var����������
--goto����ڱ�д״̬��ʱҲ������ ������һ���Ƿ����ż����0�ĳ���

::s1:: do
local c=io.read(1)
if c=='0' then goto s2
elseif c==nil then print'ok';return
else goto s1
end
end

::s2:: do
local c=io.read(1)
if c=='0'then goto s1
elseif c==nil then print'not ok';return
else goto s2
end
end
goto s1

--��Ȼ����ʹ�ù��ظ��õķ�ʽ����д��δ��� �������еķ��������ڽ�һ�������Զ���(finite automation)
--�Զ���ת��Ϊlua���Դ���(�뿼�Ƕ�̬��������(dynamic code generation))
--�پ�һ���򵥵��Թ���Ϸ�����ӡ��Թ����м������䣬ÿ������Ķ��������������һ���ţ����ÿ�ο��������ƶ��ķ�������������������һ����
--����ҿ��Խ�����Ӧ�ķ��䣬����������һ�����棬��ҵ�����Ŀ���Ǵӵ�һ�������ߵ����һ������
--�����Ϸ��һ�����͵�״̬������ǰ������ڷ������һ��״̬��Ϊʵ������Թ���Ϸ�����ǿ���Ϊÿ�������Ӧ���߼���дһ�δ��룬Ȼ����Goto����ʾ
--��һ�������ƶ�����һ������
--���ĸ�������ɵ�С�Թ�

goto room1 --��ʼ����
::room1:: do
local move =io.read()
if move=='south' then goto room3
elseif move=='east' then goto room2
else
print('invalid move')
goto room1
end
end
::room2::do
local move =io.read()
if move=='south' then goto room4
elseif move=='west' then goto room1
else
print("invalid move")
goto room2
end
end

::room3::do
local move=io.read()
if move=='north' then goto room1
elseif move=='east' then goto room4
else
print("invalid move")
goto room3
end
end

::room4:: do
print("congratulations, you won!")
end


--��������򵥵���Ϸ�����߿��ܻᷢ�֣�ʹ�������������(ʹ�ñ�������������ƶ�)��һ�ָ��õ���Ʒ����������������Ϸ�е�ÿ�䷿�����Բ�ͬ����ô�ͷǳ��ʺ�
--ʹ������״̬����ʵ�ַ���
