<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/web/pub/flow.inc"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
window.name = "busiParamWin";
//�������༭ҵ�������������
function editBusiPara(){
if(CheckForm(form1)){
	document.all.form1.target = "busiParamWin";
	document.all.form1.submit();
	window.returnValue = "success";
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
<title>ҵ���������</title>
</head>
<html:base target="_self"/>
<body>
<FORM action="${ROOT}/editBusiParam.do1?id=${param.busiParamId}" name="form1"  method="post">
<INPUT type="hidden" name="flowNode" value="${busiParam.flowNode}"/>
	<table border="0" cellpadding="0" cellspacing="0" class="dialog-box">
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">ҵ���������</div></td>
        </tr>
        <tr>
          <td valign="top" class="dialog-text-bg"><table class="dialog-text-box" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="34%" height="14" class="dialog-text"><font color="red">*</font>ҵ���������</td>
                <td width="66%"><input type="text" name="paraName" class="input-text" value="<bean:write name="busiParam" property="paraName"/>" showName="ҵ�������" check="notBlank" required="true"/></td>
              </tr>
              <tr>
                <td height="14" class="dialog-text"><font color="red">*</font>ҵ�������ʾ����</td>
                <td><input type="text" name="paraDisName" class="input-text" value="<bean:write name="busiParam" property="paraDisName"/>" showName="ҵ�������ʾ��" check="notBlank" required="true"/></td>
              </tr>
              <tr>
                <td height="14" class="dialog-text"><font color="red">*</font>ҵ�����ֵ��</td>
                <td><input type="text" name="paraValue" class="input-text" value="<bean:write name="busiParam" property="paraValue"/>" showName="ҵ�����ֵ" check="notBlank" required="true"/></td>
              </tr>
              <!-- <tr>
                <td height="14" class="dialog-text"> �������ͣ�</td>
                <td>
					<html:select name="busiParam" property="paraType">
						<html:option value="hidden">����</html:option>
						<html:option value="text">�ı�</html:option>
						<html:option value="select">�����б�</html:option>
						<html:option value="check">��ѡ</html:option>
						<html:option value="radion">��ѡ</html:option>
					</html:select>
                </td>
              </tr>
              <tr>
                <td height="14" class="dialog-text">��ѡ������</td>
                <td><input type="text" name="listValues" class="input-text" value="<bean:write name="busiParam" property="listValues"/>"/></td>
              </tr>
              <tr>
                <td colspan="2" valign="top" class="dialog-red">��ѡ������ʽΪ����1�����֣�����1��ֵ���Ƿ�Ĭ��ֵ������2..,������ʽ���������б���ѡ����ѡ��Ч</td>
              </tr> -->
              <tr><td class="dialog-text">��ע��</td>
              <td><textarea rows="3" cols="20" name="remark"><bean:write name="busiParam" property="remark"/></textarea></td>
              </tr>
            </table>
              <div class="dialog-line"></div>
			  <div><input type="button" class="dialog-button2" value="ȷ ��" onClick="javascript:editBusiPara();" />
			       <input type="button" class="dialog-button2" value="ȡ ��" onclick="javascript:window.close();return;" />
			  </div>
			  </td>
        </tr>
      </table>
</FORM>	  
</body>
</html>
