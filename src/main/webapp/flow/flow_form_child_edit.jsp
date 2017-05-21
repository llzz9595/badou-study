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
	parent.parent.topFrame.enableButtons();//将命令按钮重新激活
<%}%>

//新增，编辑业务参数弹出窗口
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
	if (confirm("您确认要删除记录？")) { 
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

//存放路由信息
function routeInfo(id, relate){
    this.id=id;
    this.relate=relate;
}
var routes = new Array();
<c:forEach var="o" items="${flwFlow.nodeSet}" varStatus="idx">
routes[${idx.index}] = new routeInfo('${o.nodeCode}','${o.timelimitRelate}');
</c:forEach>


//根据id查找路由信息
function findRouteInfo(id){
	for(var j=0; j<routes.length; j++){
		var route = routes[j];
		if(route.id==id){
			return route;
		}
	}
}

//当选择不同频度的时候页面上变化
function ev_changeFrequency(){
	var frequency = document.all("frequency").value;
	var autoYear = document.getElementById("autoYear");
	var YQMDefind = document.getElementById("YQMDefind");
	var monthDefind = document.getElementById("monthDefind");
	if(frequency=="<%=Globals.FREQUENCY_YEAR%>" || frequency=="<%=Globals.FREQUENCY_QUARTER%>"){
		autoYear.style.display="";
		var yoq = frequency=="<%=com.shengdai.kpi.system.Globals.FREQUENCY_YEAR%>" ? "年度" : "季度";
		YQMDefind.innerHTML=yoq + "&nbsp;第<input type='text' class='editline' name='autoMonth' size='2' "+
			"maxlength='2' value='<bean:write name="monitor" property="autoMonth"/>'/>月&nbsp;";
			
		var allDivs = document.getElementsByTagName("div");
		for(i=0; i<allDivs.length; i++){
			var div = allDivs[i];
			if(div.className=="routeDTlimeYQ"){
				div.style.display = "";
			}
			if(div.className=="routeDTlimeMonth"){
				div.innerHTML = yoq + "第<input type=text name='time_"+div.id+"_relate' class='editline' "+
					"value='1' size='2' maxlength='2' value='"+ findRouteInfo(div.id).relate + "' >月";
			}
		}
	} else if(frequency=="<%=Globals.FREQUENCY_MONTH%>"){
		autoYear.style.display="none";
		YQMDefind.innerHTML="<select name='autoMonth' ><option value='0' "+
			"<logic:equal name="monitor" property="autoMonth" value="0" >selected</logic:equal>" + 
			" >本</option><option value='1' "+
			"<logic:equal name="monitor" property="autoMonth" value="1" >selected</logic:equal>"+
			" >下</option></select>月&nbsp;";
		var allDivs = document.getElementsByTagName("div");
		for(i=0; i<allDivs.length; i++){
			var div = allDivs[i];
			if(div.className=="routeDTlimeYQ"){
				div.style.display = "none";
			}
			if(div.className=="routeDTlimeMonth"){
				var relateValue = findRouteInfo(div.id).relate;
				div.innerHTML="<select name='time_"+div.id+"_relate' ><option value='0' "+
					(relateValue=="0"?"selected ":"") + " >本</option><option value='1' "+
					(relateValue=="1"?"selected ":"") + " >下</option></select>月&nbsp;";
			}
		}		
	}
}
function isTimeNum(tCon,type){
    if(!isFFInt(tCon))
    	return ;
    var num = parseInt(tCon.value);
	if(type==1){//判断每月的天数在1-31
		if(num<1||num>31){
			alert("请输入1-31");
			tCon.focus();
			return false;
		}
	}else if(type==2){//判断小时数在0-23
		if(num<0||num>23){
			alert("请输入0-23");
			tCon.focus();
			return false;
		}
	}else if(type==3){//判断分钟在0-59
		if(num<0||num>59){
			alert("请输入0-59");
			tCon.focus();
			return false;
		}
	}else if(type==4){//判断秒钟在0-59
		if(num<0||num>59){
			alert("请输入0-59");
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
	if(type==1){//判断每月的天数在1-31
		if(num<0||num>31){
			alert("请输入1-31");
			tCon.focus();
			return false;
		}
	}else if(type==2){//判断小时数在0-23
		if(num<0||num>23){
			alert("请输入0-23");
			tCon.focus();
			return false;
		}
	}else if(type==3){//判断分钟在0-59
		if(num<0||num>59){
			alert("请输入0-59");
			tCon.focus();
			return false;
		}
	}else if(type==4){//判断秒钟在0-59
		if(num<0||num>59){
			alert("请输入0-59");
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
    			<H2 class=tab>基本配置</H2>
			    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
				<!-- 这里嵌套流程基本配置 -->
				<input name="flowCode" type="hidden" value="<bean:write name="flwFlow" property="flowCode"/>""/>
		    	<table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
			  	  <TBODY>
			        <TR>
			          <TD align=right width="28%" height=35><font color="red">*</font>流程名称：</TD>
			          <TD width="72%" height=25><INPUT class=editline size=60 value="<bean:write name="flwFlow" property="flowName"/>" name="flowName"  check="notBlank;isString('#',50)" showName="流程名称" required="true" maxlength="50" > </TD>
			        </TR>
			  	    <TR>
			          <TD align=right width="28%" height=35>流程说明：</TD>
        			  <TD width="72%" height=25>
        			  <textarea cols="50" rows="6" name="memo">${flwFlow.memo}</textarea>
        			  </TD>
        			</TR>
	  				<TR>
        			  <TD align=right width="28%" height=35><font color="red">*</font>流程类别：</TD>
        			  <TD width="72%" height=25>
        				<INPUT type="hidden" name="busiType" value="<bean:write name="flwFlow" property="commBusi.id"/>">
        				<bean:write name="flwFlow" property="commBusi.busiName"/>
        			  </TD>
        			</TR>		
	  				<tr>
	  				  <td colspan="2" align="left">
	  				    <font color="#0099FF">说明：红星（</font><font color="red">*</font><font color="#0099FF">）不能为空</font>
	  				  </td>
	  				</tr>
				  </table>
				</DIV>	
			<%--<DIV class=tab-page id=tabPage2>
				<H2 class=tab>
					提醒设置
				</H2>
				<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage2" ) );</SCRIPT>
				<!-- 这里嵌套流程附件 --></DIV>							
			--%>						
			

				  <DIV class=tab-page id=tabPage5>
				    <H2 class=tab>业务参数管理</H2>
				    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage5" ) );</SCRIPT>
				    <!-- 这里嵌套业务参数配置 -->
				    <table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
				      <tr><td width="100%">
				  		<jsp:include flush="true" page="flow_ext_config.jsp" >
				  			<jsp:param name="mainId" value="<%=flowCode%>" />	  	
				  		</jsp:include>
				  	  </td></tr>
				    </table>
				  </DIV>
				
				<DIV class=tab-page id=tabPage7 style="display:none">
				    <H2 class=tab>扩展配置</H2>
				    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage7" ) );</SCRIPT>
				    <!-- 这里嵌套业务参数配置 -->
				   <table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
				    <tr>
				    	<td colspan=1>&nbsp;
				    	<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center" bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0" width="90%">
				    		<TR>
						          <TD align="left" colspan="4" height=30><b>环节待办自动提交</b>&nbsp;[指定环节的待办到指定时间后自动提交]</TD>        
						    </TR>
					  	  <tr>
					  	  	<td class=title-header align="center" width="10%" height="22">序号</td>
							<td class=title-header align="center" width="28%" height="22">环节</td>  
							<td class=title-header align="center" >时限</td>
							<td class=title-header align="center" width="20%">是否自动提交</td>
					  	  </tr>
					  	  <c:forEach var="o" items="${flwFlow.nodeSet}" varStatus="idx">
					  	  <c:if test="${o.flgRoot == 0}">
					  	  	 <tr>
					  	  	<td align="center" height="22" >${idx.index}</td>
					  	  	<td align="center" height="22" >${o.nodeName}</td>
							<td align="left" >
							  <select name="submitType_${o.id}">
							      <option value="-1" ${o.submitType==-1 ? 'selected' : ''}>到达后</option>
								  <option value=0 ${o.submitType==0 ? 'selected' : ''}>本月</option>
								  <option value=1 ${o.submitType==1 ? 'selected' : ''}>下月</option>
							  </select>
							    
							  <input type=text class=editline size=2 name="submitDate_${o.id}"
									value="${o.submitDate}" onblur="isTimeNum1(this,1)"/>日的
							  <input type=text class=editline size=2 name="submitHour_${o.id}" 
									maxlength="2" value="${o.submitHour}" onblur="isTimeNum1(this,2)"/>时
							  <input type=text class=editline size=2 name="submitMinute_${o.id}" 
									maxlength="2"  value="${o.submitMinute}" onblur="isTimeNum1(this,3)" />分
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
							  	<b>说明 :</b>流程中需要对指定的环节配置自动提交功能，该功能的提交时间有三种方式<br>
							  <font color="blue">1、到达后：指以产生待办时间为起始时间，在指定时限(x日x时x分)后由系统自动提交；<br>
示例1：设置：(到达后)(2)日的(0)时(0)分；如果待办到达时间为2011-8-10，那么待办提交的时间为2011-8-12的0时0分。<br>
2、本月：系统自动提交时限指定为(本月x日x时x分)，则待办会在产生待办时间的本月的x日x时x分进行自动提交，如果产生待办的时间超过了本月的x日x时x分，那么待办会立即自动提交；<br>
示例2：设置：(本月)(15)日的(0)时(0)分；如果待办到达时间为2011-8-8，那么待办提交的时间为2011-8-15的0时0分；<br>
示例3：设置：(本月)(15)日的(0)时(0)分；如果待办到达时间为2011-8-16 12时0分，那么待办提交的时间为2011-8-16 12时0分；<br>
3、下月：系统自动提交时限指定为(下月x日x时x分)，则待办会在产生待办时间的下一个月的x日x时x分进行自动提交；<br>
示例4：设置：(下月)(10)日的(0)时(0)分；如果待办到达时间为2011-8-8，那么待办提交的时间为2011-9-10的0时0分； <br>
								</font>
							  </td>
					</tr>
				    </table>
				  </DIV>
			</DIV><!-- 	整个TAB结束 -->
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