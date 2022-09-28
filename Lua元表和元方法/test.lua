-- Í¨³££¬lua ÓïÑÔÖÐµÄÃ¿ÖÖÀàÐÍ µÄÖµ¶¼ÓÐÒ»Ì×¿ÉÔ¤¼ûµÄ²Ù×÷¼¯ºÏ¡£ÀýÈç
-- ÎÒÃÇ¿ÉÒÔ½«Êý×ÖÏà¼Ó£¬¿ÉÒÔÁ¬½Ó×Ö·û´®£¬»¹¿ÉÒÔÔÚ±íÖÐ²åÈë¼üÖµ¶ÔµÈ
-- µ«ÊÇÎÒÃÇÎÞ·¨½«Á½¸ö±íÏà¼Ó ÎÞ·¨¶Ôº¯Êý×÷±È½Ï Ò²ÎÞ·¨µ÷ÓÃÒ»¸ö×Ö·û´® ³ý·ÇÊÇÓÃÔª±í
-- Ôª±í¿ÉÒÔÐÞ¸ÄÒ»¸öÖµÔÚÃæ¶ÔÒ»¸öÎ´Öª²Ù×÷Ê±µÄÐÐÎª¡£
-- ÀýÈç£¬¼ÙÉèaºÍb¶¼ÊÇ±í£¬ÄÇÃ´¿ÉÒÔÍ¨¹ýÔª±í¶¨ÒåLUaÓïÑÔÈçºÎ¼ÆËã±í´ïÊ½a+b£¬
-- µ±LUAÓïÑÔÊÔÍ¼½«Á½¸ö±íÏà¼ÓÊ±£¬Ëü»áÏÈ¼ì²éÁ½Ö»Ö®Ò»ÊÇ·ñÓÐÔª±ímetatable
-- ÇÒ¸ÃÔªËØÖÐÊÇ·ñÓÐ __add×Ö¶Î Èç¹ûluaÓïÑÔÕÒµ½ÁË¸Ã×Ö¶Î£¬¾Íµ÷ÓÃ¸Ã×Ö¶Î¶ÔÓ¦µÄÖµ
-- ¼´ËùÎ½µÄÔ­·½·¨(metamethod)£¨ÊÇÒ»¸öº¯Êý£
-- ÔÚ±ÈÀýÖÐ¾ÍÊÇÓÃÓÚ¼ÆËã±íµÄºÍµÄº¯Êý
-- ¿ÉÒÔÈÏÎª£¬ Ôª±íÊÇÃæÏò¶ÔÏóÁìÓòÖÐµÄÊÜÏÞÖÆÀà£¬ÏñÀàÒ»Ñù Ôª±í¶¨ÒåµÄÊÇÊµÀýµÄÐÐÎª¡£
-- ²»¹ý£¬ÓÉÓÚÔª±íÖ»ÄÜ¸ø³öÔ¤ÏÈ¶¨ÒåµÄ²Ù×÷¼¯ºÏµÄÐÐÎª£¬ËùÒÔÔª±í±ÈÀà¸üÊÜÏÞ
-- Í¬Ê± Ôª±íÒ²²»Ö§³Ö¼Ì³Ð
-- »ùÓÚÔª±í¹¹½¨Ò»¸öÏà¶ÔÍêÕûµÄÀàÏµÍ³
-- LuaÓïÑÔÖÐµÄÃ¿Ò»¸öÖµ¶¼¿ÉÒÔÓÐÔª±í£¬Ã¿Ò»¸ö±íºÍÓÃ»§Êý¾ÝÀàÐÍ¶¼¾ßÓÐ¸÷×Ô¶ÀÁ¢µÄÔª±í
-- ¶øÆäËüÀàÐÍµÄÖµÔò¹²Ïí¶ÔÓ¦ÀàÐÍËùÊôµÄÍ¬Ò»¸öÔª±í¡£LuaÓïÑÔÔÚ´´½¨ÐÂ±íÊ±²»´øÔªËØ
t={}
print(getmetatable(t))--nil
-- ¿ÉÒÔÊ¹ÓÃsetmetatable À´ÉèÖÃ»òÐÞ¸ÄÈÎÒâ±íµÄÔª±í
t1={}
setmetatable(t,t1)
print(getmetatable(t)==t1)
--ÔÚluaÓïÑÔÖÐ£¬ÎÒÃÇÖ»ÄÜÎª±íÉèÖÃÔªËØ£¬Èç¹ûÒªÎªÆäËûÀàÐÍµÄÖµÉèÖÃÔªËØ£¬Ôò±ØÐëÍ¨¹ýC´úÂë»òµ÷ÊÔ¿âÍê³É
--¸ÃÏÞÖÆ´æÔÚµÄÖ÷ÒªÔ­ÒòÊÇÎªÁË·ÀÖ¹¹ý¶ÈÊ¹ÓÃ¶ÔÄ³ÖÖÀàÐÍµÄËùÓÐÖµÉúÐ§µÄÔª±í¡£
--LuaÓïÑÔµÄÀÏ°æ±¾ÖÐµÄ¾­Ñé±íÃ÷£¬ÕâÑùµÄÈ«¾ÖÉèÖÃ¾­³£µ¼ÖÂ²»¿ÉÖØÓÃµÄ´úÂë
--×Ö·û´®±ê×¼¿âÎªËùÓÐµÄ×Ö·û´®¶¼ÉèÖÃÁËÍ¬Ò»¸öÔªËØ£¬¶øÆäËüÀàÐÍÔÚÄ¬ÈÏÇé¿öÖÐ¶¼Ã»ÓÐÔª±í
print(getmetatable("hi"))
print(getmetatable("xuxu"))
print(getmetatable(10))
print(getmetatable(print))
--Ò»¸ö±í¿ÉÒÔ³ÆÎªÈÎÒâÖµµÄÔª±í
--Ò»×éÏà¹ØµÄ±íÒ²¿ÉÒÔ¹²ÏíÒ»¸öÃèÊöÁËËüÃÇ¹²Í¬ÐÐÎªµÄÍ¨ÓÃÔª±í
--Ò»¸ö±í»¹¿ÉÒÔ³ÉÎªËü×Ô¼ºµÄÔª±í ÓÃÓÚÃèÊöÆä×ÔÉíÌØÓÐµÄÐÐÎª
--×ÜÖ® ÈÎºÎÅäÖÃ¶¼ÊÇºÏÀíµÄ

