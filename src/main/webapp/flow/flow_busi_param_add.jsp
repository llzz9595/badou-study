<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
window.name = "flowBusiParamWin";
//�������༭ҵ�������������
function addBusiPara(){
	var fm = $_E("form1");
	if(CheckForm(fm)){
		fm.target = "flowBusiParamWin";
		fm.submit();
		window.returnValue = "success";
		window.close();
	}
}
/**
function checkJs(){
	var obj = document.all.paraType.value;
	var paramObj = document.all.listValues;
	if(obj=="select"||obj=="check"||obj=="radion"){
		if(paramObj.value==""){
		alert("�������ѡ��������");
		document.all.listValues.focus();
		return false;
		}
		try{
			var strs = paramObj.value.split(";");
				for(var i=0;i<strs.length;i++){
					var chstr = strs[i].split(",");
					if(chstr.length!=3){
					alert("��������ȷ��ʽ�Ĵ�ѡ��������");
					document.all.listValues.focus();
					return false;
					}
			}
		}catch(e){
			alert("��������ȷ��ʽ�Ĵ�ѡ��������");
			document.all.listValues.focus();
			return false;
		}
	}
	return true;
}**/
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ҵ���������</title>
</head>
<html:base target="_self"/>
<body>
<FORM action="${ROOT}/addBusiParam.do1?id=<%=request.getParameter("id")%>" name="form1"  method="post">
	<table border="0" cellpadding="0" cellspacing="0" class="dialog-box">
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">ҵ���������</div></td>
        </tr>
        <tr>
          <td valign="top" class="dialog-text-bg"><table class="dialog-text-box" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="34%" height="14" class="dialog-text"><font color="red">*</font>ҵ���������</td>
                <td width="66%"><input type="text" name="paraName" class="input-text" showName="ҵ�������" check="notBlank" required="true"/></td>
              </tr>
              <tr>
                <td height="14" class="dialog-text"><font color="red">*</font>ҵ�������ʾ����</td>
                <td><input type="text" name="paraDisName" class="input-text" showName="ҵ�������ʾ��" check="notBlank" required="true"/></td>
              </tr>
              <tr>
                <td height="14" class="dialog-text"><font color="red">*</font>ҵ�����ֵ��</td>
                <td><input type="text" name="paraValue" class="input-text" showName="ҵ�����ֵ" check="notBlank" required="true"/></td>
              </tr>
            <!-- <tr>
                <td height="14" class="dialog-text"> �������ͣ�</td>
                <td><select name="paraType"><option value="hidden">����</option>
							 <option value="text">�ı�</option>
							 <option value="select">�����б�</option>
							 <option value="check">��ѡ</option>
							 <option value="radion">��ѡ</option></select>
                </td>
              </tr>
              <tr>
                <td height="14" class="dialog-text">��ѡ������</td>
                <td><input type="text" name="listValues"   class="input-text"/></td>
              </tr>
              <tr>
                <td colspan="2" valign="top" class="dialog-red">��ѡ������ʽΪ����1�����֣�����1��ֵ���Ƿ�Ĭ��ֵ������2..,������ʽ���������б���ѡ����ѡ��Ч</td>
              </tr>-->
               <tr><td class="dialog-text">��ע��</td>
              <td><textarea rows="3" cols="20" name="remark"></textarea></td>
              </tr>
            </table>
              <div class="dialog-line"></div>
			  <div><input type="button" class="dialog-button2" value="ȷ ��" onClick="javascript:addBusiPara();" />
			       <input type="button" class="dialog-button2" value="ȡ ��" onclick="javascript:window.close();return;" />
			  </div>
			  </td>
        </tr>
      </table>
</form>
</body>
</html>

