<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<%@ page import="com.shengdai.kpi.system.Globals" %>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwRoute"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwFlow"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwNode"/>
<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<html> 
<head>
<%
	request.setAttribute("flowNodeExtList2",request.getAttribute("flowNodeExtList"));
	String flowCode = request.getParameter("flowCode");
	String tab = request.getParameter("tab");
	if(tab==null||tab.equals("")){
		tab = "0";
	}
	int size = ((List)request.getAttribute("nodeMineList")).size();
%>
</head>
<script>
<%if("1".equals(request.getParameter("save"))){%>
	parent.parent.topFrame.enableButtons();//�����ť���¼���
<%}%>

//�������༭ҵ�������������
function add_para(id){
	var returnValue = window.showModalDialog('${ROOT}/flow/flow_busi_param_add.jsp?id='+id,'','dialogHeight:450px;dialogWidth:470px;status=off')
    if(returnValue=="success"){
    	location.href = "${ROOT}/flowEditPage.do1?flowCode=<%=request.getParameter("flowCode")%>&tab=2"+urlPara;   
    }
}

function editNodeExt(id){
	var returnValue = window.showModalDialog('${ROOT}/busiParamEditPage.do1?busiParamId='+id,'','dialogHeight:380px;dialogWidth:470px;status=off')
    if(returnValue=="success"){
   		location.href = "${ROOT}/flowEditPage.do1?flowCode=<%=request.getParameter("flowCode")%>&tab=2"+urlPara; 
    } 
}

function deleteNodeExt(id){
	if (confirm("��ȷ��Ҫɾ����¼��")) { 
		document.form1.action = "${ROOT}/deleteBusiParam.do1?id="+id+"&tab=2&flowCode=<%=request.getParameter("flowCode")%>";
		document.form1.submit();
	}else{
		return;
	}
}

function flowSave(){
	if(CheckForm(form1)){
		var url = "${ROOT}/editFlow.do1?"+urlPara;
		form1.action = url;
		form1.submit();
	}
}

//���·����Ϣ
function routeInfo(id, relate){
    this.id=id;
    this.relate=relate;
}
var routes = new Array();
<c:forEach var="o" items="${flwFlow.nodeSet}" varStatus="idx">
routes[${idx.index}] = new routeInfo('${o.nodeCode}','${o.timelimitRelate}');
</c:forEach>


//����id����·����Ϣ
function findRouteInfo(id){
	for(var j=0; j<routes.length; j++){
		var route = routes[j];
		if(route.id==id){
			return route;
		}
	}
}

//��ѡ��ͬƵ�ȵ�ʱ��ҳ���ϱ仯
function ev_changeFrequency(){
	var frequency = document.all("frequency").value;
	var autoYear = document.getElementById("autoYear");
	var YQMDefind = document.getElementById("YQMDefind");
	var monthDefind = document.getElementById("monthDefind");
	if(frequency=="<%=Globals.FREQUENCY_YEAR%>" || frequency=="<%=Globals.FREQUENCY_QUARTER%>"){
		autoYear.style.display="";
		var yoq = frequency=="<%=com.shengdai.kpi.system.Globals.FREQUENCY_YEAR%>" ? "���" : "����";
		YQMDefind.innerHTML=yoq + "&nbsp;��<input type='text' class='editline' name='autoMonth' size='2' "+
			"maxlength='2' value='<bean:write name="monitor" property="autoMonth"/>'/>��&nbsp;";
			
		var allDivs = document.getElementsByTagName("div");
		for(i=0; i<allDivs.length; i++){
			var div = allDivs[i];
			if(div.className=="routeDTlimeYQ"){
				div.style.display = "";
			}
			if(div.className=="routeDTlimeMonth"){
				div.innerHTML = yoq + "��<input type=text name='time_"+div.id+"_relate' class='editline' "+
					"value='1' size='2' maxlength='2' value='"+ findRouteInfo(div.id).relate + "' >��";
			}
		}
	} else if(frequency=="<%=Globals.FREQUENCY_MONTH%>"){
		autoYear.style.display="none";
		YQMDefind.innerHTML="<select name='autoMonth' ><option value='0' "+
			"<logic:equal name="monitor" property="autoMonth" value="0" >selected</logic:equal>" + 
			" >��</option><option value='1' "+
			"<logic:equal name="monitor" property="autoMonth" value="1" >selected</logic:equal>"+
			" >��</option></select>��&nbsp;";
		var allDivs = document.getElementsByTagName("div");
		for(i=0; i<allDivs.length; i++){
			var div = allDivs[i];
			if(div.className=="routeDTlimeYQ"){
				div.style.display = "none";
			}
			if(div.className=="routeDTlimeMonth"){
				var relateValue = findRouteInfo(div.id).relate;
				div.innerHTML="<select name='time_"+div.id+"_relate' ><option value='0' "+
					(relateValue=="0"?"selected ":"") + " >��</option><option value='1' "+
					(relateValue=="1"?"selected ":"") + " >��</option></select>��&nbsp;";
			}
		}		
	}
}
function isTimeNum(tCon,type){
    if(!isFFInt(tCon))
    	return ;
    var num = parseInt(tCon.value);
	if(type==1){//�ж�ÿ�µ�������1-31
		if(num<1||num>31){
			alert("������1-31");
			tCon.focus();
			return false;
		}
	}else if(type==2){//�ж�Сʱ����0-23
		if(num<0||num>23){
			alert("������0-23");
			tCon.focus();
			return false;
		}
	}else if(type==3){//�жϷ�����0-59
		if(num<0||num>59){
			alert("������0-59");
			tCon.focus();
			return false;
		}
	}else if(type==4){//�ж�������0-59
		if(num<0||num>59){
			alert("������0-59");
			tCon.focus();
			return false;
		}
	}
	return true;
}


function isTimeNum1(tCon,type){
    if(!isFFInt(tCon))
    	return ;
    var num = parseInt(tCon.value);
	if(type==1){//�ж�ÿ�µ�������1-31
		if(num<0||num>31){
			alert("������1-31");
			tCon.focus();
			return false;
		}
	}else if(type==2){//�ж�Сʱ����0-23
		if(num<0||num>23){
			alert("������0-23");
			tCon.focus();
			return false;
		}
	}else if(type==3){//�жϷ�����0-59
		if(num<0||num>59){
			alert("������0-59");
			tCon.focus();
			return false;
		}
	}else if(type==4){//�ж�������0-59
		if(num<0||num>59){
			alert("������0-59");
			tCon.focus();
			return false;
		}
	}
	return true;
}
function setCheckValue(id){
	if(document.getElementById(id).checked){
		document.getElementById(id).value=1;
	}else{
		document.getElementById(id).value=0;
	}
}
</script>
<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">
	  <br>
	  <form id="form1" name="form1" method="post" action="">     
	  <table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
	    <tr>
    	  <td>
    	    <br/>
	        <DIV class=tab-pane id=tabPane1>
              <SCRIPT type=text/javascript>
		        tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
		        tp1.selectedIndex =<%=tab%>;
			  </SCRIPT>
		      <DIV class=tab-page id=tabPage1>
    			<H2 class=tab>��������</H2>
			    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
				<!-- ����Ƕ�����̻������� -->
				<input name="flowCode" type="hidden" value="<bean:write name="flwFlow" property="flowCode"/>""/>
		    	<table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
			  	  <TBODY>
			        <TR>
			          <TD align=right width="28%" height=35><font color="red">*</font>�������ƣ�</TD>
			          <TD width="72%" height=25><INPUT class=editline size=60 value="<bean:write name="flwFlow" property="flowName"/>" name="flowName"  check="notBlank;isString('#',50)" showName="��������" required="true" maxlength="50" > </TD>
			        </TR>
			  	    <TR>
			          <TD align=right width="28%" height=35>����˵����</TD>
        			  <TD width="72%" height=25>
        			  <textarea cols="50" rows="6" name="memo">${flwFlow.memo}</textarea>
        			  </TD>
        			</TR>
	  				<TR>
        			  <TD align=right width="28%" height=35><font color="red">*</font>�������</TD>
        			  <TD width="72%" height=25>
        				<INPUT type="hidden" name="busiType" value="<bean:write name="flwFlow" property="commBusi.id"/>">
        				<bean:write name="flwFlow" property="commBusi.busiName"/>
        			  </TD>
        			</TR>		
	  				<tr>
	  				  <td colspan="2" align="left">
	  				    <font color="#0099FF">˵�������ǣ�</font><font color="red">*</font><font color="#0099FF">������Ϊ��</font>
	  				  </td>
	  				</tr>
				  </table>
				</DIV>	
			<%--<DIV class=tab-page id=tabPage2>
				<H2 class=tab>
					��������
				</H2>
				<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage2" ) );</SCRIPT>
				<!-- ����Ƕ�����̸��� --></DIV>							
			--%>						
			

				  <DIV class=tab-page id=tabPage5>
				    <H2 class=tab>ҵ���������</H2>
				    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage5" ) );</SCRIPT>
				    <!-- ����Ƕ��ҵ��������� -->
				    <table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
				      <tr><td width="100%">
				  		<jsp:include flush="true" page="flow_ext_config.jsp" >
				  			<jsp:param name="mainId" value="<%=flowCode%>" />	  	
				  		</jsp:include>
				  	  </td></tr>
				    </table>
				  </DIV>
				
				<DIV class=tab-page id=tabPage7 style="display:none">
				    <H2 class=tab>��չ����</H2>
				    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage7" ) );</SCRIPT>
				    <!-- ����Ƕ��ҵ��������� -->
				   <table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
				    <tr>
				    	<td colspan=1>&nbsp;
				    	<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center" bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0" width="90%">
				    		<TR>
						          <TD align="left" colspan="4" height=30><b>���ڴ����Զ��ύ</b>&nbsp;[ָ�����ڵĴ��쵽ָ��ʱ����Զ��ύ]</TD>        
						    </TR>
					  	  <tr>
					  	  	<td class=title-header align="center" width="10%" height="22">���</td>
							<td class=title-header align="center" width="28%" height="22">����</td>  
							<td class=title-header align="center" >ʱ��</td>
							<td class=title-header align="center" width="20%">�Ƿ��Զ��ύ</td>
					  	  </tr>
					  	  <c:forEach var="o" items="${flwFlow.nodeSet}" varStatus="idx">
					  	  <c:if test="${o.flgRoot == 0}">
					  	  	 <tr>
					  	  	<td align="center" height="22" >${idx.index}</td>
					  	  	<td align="center" height="22" >${o.nodeName}</td>
							<td align="left" >
							  <select name="submitType_${o.id}">
							      <option value="-1" ${o.submitType==-1 ? 'selected' : ''}>�����</option>
								  <option value=0 ${o.submitType==0 ? 'selected' : ''}>����</option>
								  <option value=1 ${o.submitType==1 ? 'selected' : ''}>����</option>
							  </select>
							    
							  <input type=text class=editline size=2 name="submitDate_${o.id}"
									value="${o.submitDate}" onblur="isTimeNum1(this,1)"/>�յ�
							  <input type=text class=editline size=2 name="submitHour_${o.id}" 
									maxlength="2" value="${o.submitHour}" onblur="isTimeNum1(this,2)"/>ʱ
							  <input type=text class=editline size=2 name="submitMinute_${o.id}" 
									maxlength="2"  value="${o.submitMinute}" onblur="isTimeNum1(this,3)" />��
							</td>
							<td align="center" >
								<input type=checkbox name="flwNodeApply_${o.id}" value="${o.timelimitFlgApply }" ${o.timelimitFlgApply==1 ? 'checked' : '' }   
								onclick="setCheckValue('flwNodeApply_${o.id}');"
								/>
							</td>
					  	  </tr>
					  	  </c:if>
					  	  </c:forEach>
		  	 			</table><br/>
				    	</td>
				    </tr>
				    <tr>
							  <td >
							  	<b>˵�� :</b>��������Ҫ��ָ���Ļ��������Զ��ύ���ܣ��ù��ܵ��ύʱ�������ַ�ʽ<br>
							  <font color="blue">1�������ָ�Բ�������ʱ��Ϊ��ʼʱ�䣬��ָ��ʱ��(x��xʱx��)����ϵͳ�Զ��ύ��<br>
ʾ��1�����ã�(�����)(2)�յ�(0)ʱ(0)�֣�������쵽��ʱ��Ϊ2011-8-10����ô�����ύ��ʱ��Ϊ2011-8-12��0ʱ0�֡�<br>
2�����£�ϵͳ�Զ��ύʱ��ָ��Ϊ(����x��xʱx��)���������ڲ�������ʱ��ı��µ�x��xʱx�ֽ����Զ��ύ��������������ʱ�䳬���˱��µ�x��xʱx�֣���ô����������Զ��ύ��<br>
ʾ��2�����ã�(����)(15)�յ�(0)ʱ(0)�֣�������쵽��ʱ��Ϊ2011-8-8����ô�����ύ��ʱ��Ϊ2011-8-15��0ʱ0�֣�<br>
ʾ��3�����ã�(����)(15)�յ�(0)ʱ(0)�֣�������쵽��ʱ��Ϊ2011-8-16 12ʱ0�֣���ô�����ύ��ʱ��Ϊ2011-8-16 12ʱ0�֣�<br>
3�����£�ϵͳ�Զ��ύʱ��ָ��Ϊ(����x��xʱx��)���������ڲ�������ʱ�����һ���µ�x��xʱx�ֽ����Զ��ύ��<br>
ʾ��4�����ã�(����)(10)�յ�(0)ʱ(0)�֣�������쵽��ʱ��Ϊ2011-8-8����ô�����ύ��ʱ��Ϊ2011-9-10��0ʱ0�֣� <br>
								</font>
							  </td>
					</tr>
				    </table>
				  </DIV>
			</DIV><!-- 	����TAB���� -->
		      </td>
			</tr>
		  </table>
		</form>
	  </div>
    </td>
  </tr>
</table>
</body>
<script>
	ev_changeFrequency();
</script>
</html>