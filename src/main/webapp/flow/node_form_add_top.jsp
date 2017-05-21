<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
</head>
<body>
<input type="hidden" name="nodeCode" value=""/>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="define-box">
          <tr>
          	<td class="define-titlebg"><div class="dialog-title">
          	 <button name="btnSave" onclick="buttonEve('savenode')">±£´æ</button>
          	</div></td>
          </tr>
  		</table>
  		
<script>

  
  function initNodeCode(nodeCode){
  document.all.nodeCode.value = nodeCode;
  }

function buttonEve(partment){
	if (partment =='savenode'){
		if(CheckForm(parent.buttomFrame.Entrys.form1)){
			if(parent.buttomFrame.Entrys.checkJs()){
    			parent.buttomFrame.Entrys.addFlowNode('<%=request.getParameter("flowCode") %>');
    			return;
    		}
    	}
	}
}
</script>
</body>
<SCRIPT language=javascript>


</SCRIPT>
</html>
