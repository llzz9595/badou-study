<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ include file="/web/pub/flow.inc"%>
<%@ include file="/flow/secure.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>已发起流程实例对象</title>
</head>

<script type="text/javascript">
window.name = "flowSingleDeleteWin";
function ev_del(){	
	var ids = getAllChecked("id");
	if(ids==""){
		alert("请选择要删除的流程实例业务对象");
	} else {
		if(confirm("确定删除所选对象吗？")){
			document.form1.action = "${ROOT}/deleteInBatch.do1";
			document.form1.target = "flowSingleDeleteWin";
			document.form1.submit();
		}
	}
}

</script>

<body >
	  <table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">&nbsp;
           <input type="button" class="button4" value="删除" onclick="ev_del();"/>
            <input type="button" class="button4" value="关闭" onclick="if(confirm('确定关闭？')) window.close();"/>
          </div></td>
        </tr>
        <tr>
          <td height="560" valign="top" class="address-text-bg"><div class="address-depict">
 
 <div align="center" class="title">已发起流程实例对象列表</div>
<form method="post" id="form1" name="form1" action="" target="flowSingleDeleteWin">
		<input type="hidden" name="batchId" value="<bean:write name="recBatch" property="id"/>"/>
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0" width="95%" >   
    <tr>
  	 	<td class="title-header" width="10%"  nowrap align="center">
	  	<input id='chkCtl' type="checkbox" onclick="javascript:checkAll(this.id, 'id');">选择</td>
  	 	<td class="title-header" align="center" width="40%">业务对象</td>
  	</tr>
  
  	<c:forEach var="o" items="${boList}" varStatus="idx">
  	<tr>
  	 	<td align="center">
  	 	<input type="checkbox" name="id" value="${o.id}">${idx.count}</td>
  	 	<td align="center" >${o.boName}</td>
  	</tr>
  	</c:forEach>
</table>
</form>                 
          
          </div></td>
        </tr>
      </table>

</body>
</html>
