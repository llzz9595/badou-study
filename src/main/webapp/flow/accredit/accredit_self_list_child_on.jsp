<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.shengdai.kpi.flow.valueobject.Accredit,
				com.shengdai.kpi.common.valueobject.Busi,
				com.shengdai.kpi.system.common.DateHelper,
				com.shengdai.kpi.system.valueobject.User,
				java.util.Date,
                java.util.List" %>
<jsp:directive.page import="com.shengdai.kpi.system.service.IUserService"/>
<jsp:directive.page import="com.shengdai.kpi.common.service.IBusiService"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<%@ include file="/web/pub/flow.inc" %>
<%List accreditList=(List)request.getAttribute("accreditList"); 
IUserService ius=(IUserService)SpringHelper.getBean("userService");
User user=ius.findUserById(loginedUser.getId());
String grantorStr=(String)request.getAttribute("grantorStr");
%>
<html>
  <head>  
    <title>考核授权</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.selectedMenuStytle {
	border-top-style: groove;
	border-right-style: groove;
	border-bottom-style: groove;
	border-left-style: groove;
	color: #0099FF;
}
</style>

<script language="javascript">
 function self_off(){
 	location.href="${ROOT}/listSelfOffAccredit.do1";
 }
 function self_on(){
 	location.href="${ROOT}/listSelfOnAccredit.do1";
 }
 function self_receive(){
 	location.href="${ROOT}/listSelfReceiveAccredit.do1";
 }
</script>
 <script language="javaScript">
    var n = 0;
 	function ev_select()
 	{
 		var checkboxes=document.getElementsByName("selectedRow");
 		for(i=0;i<checkboxes.length;i++)
 		{
 			if(n%2==0)
 			{
 			    checkboxes[i].checked=true;
 			}else
 			{
 			    checkboxes[i].checked=false;
 			}
 		}
 		n++;
 	}
 	
 	function ev_add()
{
   view_form("${ROOT}/viewSelfAccredit.do1?method=add");
}

function ev_update()
{
    var rowid = null;
    var count =0;
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
        count = count +1;
        rowid = selectedRow[i].value;
      }
    }
   if (count >1)  {
        alert("请只选择一条记录进行编辑！");
        return ;
   }
  if (count ==1) {
	 view_form("${ROOT}/viewSelfAccredit.do1?method=update&accreditID="+rowid);
  }
  else{
  	alert("请选择一条需要编辑的记录！");
    return ;
  }
}

function ev_del()
{
   var count=0;
   var selected=new Array();
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要删除记录？")) {
      	 accreditForm.target="_self";
	     accreditForm.action = "${ROOT}/deleteSelfAccredit.do1?action=listSelfOnAccredit.do1";
         accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_on()
{
   var count=0;
   var selected=new Array();
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要启动该授权？")) {
      	 accreditForm.target="_self";
	     accreditForm.action = "${ROOT}/onSelfAccredit.do1?action=listSelfOnAccredit.do1";
         accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_off()
{
   var count=0;
   var selected=new Array();
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要停止该授权？")) {
      	 accreditForm.target="_self";
	     accreditForm.action = "${ROOT}/offSelfAccredit.do1?action=listSelfOnAccredit.do1";
         accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_log()
{
	var url="${ROOT}/listAccreditHistory.do1?uid=<%=loginedUser.getId()%>";
	window.open(url,'','left=100, top=80, width=800, height=600, resizable=1,scrollbars=1');
}

function ev_exit()
{
	location.href="${ROOT}/main_page.jsp";
}

function ev_exit2()
{
	location.href="${ROOT}/system/common/accredit_self_list.jsp";
}
function ev_see(id)
{
	var url="${ROOT}/listWorkListItemByAccreditOn.do1?acid="+id;  
	window.open(url,'','left=100, top=80, width=800, height=600, resizable=1,scrollbars=1');
}
 </script>
</head>
 <body>
 <table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/images/cmd.jpg" height="30"><table width="100%">
   <tr>
       <td align=left width=3 ><img src="${ROOT}/images/cmd01.gif" ></td>
           <td id=search onaction="" width="500"> 
			 <input id="btn1" type="button" class="button" value="新增" onclick="javascript:ev_add();">
			 <input id="btn2" type="button" class="button" value="编辑" onclick="javascript:ev_update();">
			 <input id="btn5" type="button" class="button" value="停止" onclick="javascript:ev_off();">
			 <input id="btn6" type="button" class="button" value="授权日志" onclick="javascript:ev_log();">
		  </td>
   </tr>
</table></td></tr> 
 </table>
 <br>

  <form   name="accreditForm" method="post" action="">
  <input name="st" type="hidden" value="0">
  
<logic:notEqual name="viewTop" value="false">
  <table align="center" border="0">
  	<tr>
  	 <td align="left" width="80"><a href="javascript:self_off()">未启动授权</a></td>
  	 <td align="left" width="80"><a href="#"><span class="selectedMenuStytle" >已启动授权</span></a></td>
  	 <td align="left" width="80"><a href="javascript:self_receive()">接收到授权</a></td>
  	</tr>
  </table>
 </logic:notEqual>
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="8%" nowrap align="center" class=header onClick="ev_select();">选择
    <input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'selectedRow');">
    </td>

	<page:tabTitle title="业务类型" column="busi"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="center"/>

    <td width="11%" nowrap class=header align="center">授权人</td>
    <td width="11%" nowrap class=header align="center">被授权人</td>
    <td width="5%" nowrap class=header align="center">是否启动</td>
    <td width="8%" nowrap class=header align="center">状 态</td>
    
    <page:tabTitle title="开始时间" column="startDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="center"/>
    
    <page:tabTitle title="结束时间" column="endDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="center"/>

  </tr>
 <%if(accreditList!=null)
 { 
	 IBusiService ibs=(IBusiService)SpringHelper.getBean("busiService");
	 Date d=new Date();
	 SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 for(int i=0;i<accreditList.size();i++)
	 {
		 Accredit acc=(Accredit)accreditList.get(i);
		 String busiName="";
		 if(acc.getBusi().equals("*"))
		 	busiName="所有业务类型";
		 else
		 {
		 	Busi bu=ibs.findBusiById(acc.getBusi());
		 	busiName=bu.getBusiName();
		 }
		
 %>
	<tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
	<td align="center">
		<%=i+1 %>&nbsp;<input type="checkbox" name="selectedRow"  value="<%=acc.getId() %>">
	</td>
	<td><a href="javascript: view_form('${ROOT}/viewSelfAccredit.do1?method=update&accreditID=<%=acc.getId() %>');">
			<%=busiName %>
		</a>
	</td>
	
	<td><a href="javascript:ev_see('<%=acc.getId() %>');"><%=acc.getGrantorName() %></a></td>
	<td><%=acc.getAcceptorName() %></td>
	<td>
		<%if(acc.getFlgStart().intValue()==1) out.print("是"); else out.print("否"); %>
	</td>
	<td>
		<%if(acc.getStartDate().after(d) || acc.getEndDate().before(d)) 
				out.print("无效"); 
			else
				out.print("有效");
		%>
	</td>
		<td><%=df.format(acc.getStartDate()) %></td>
		<td><%=df.format(acc.getEndDate()) %></td>
	</tr>
 <%} }%> 
</table><br>

<page:root inputclass="editline" />
<input type="hidden" name="gl">
  </form>
    <script type="text/javascript">
   <%if(grantorStr!=null && !grantorStr.trim().equals("")){%>
 document.accreditForm.gl.value="<%=grantorStr%>";
 var ur="${ROOT}/system/common/delete_accredit_undo.jsp";
 window.open(ur,'','left=100, top=80, width=800, height=600, resizable=1,scrollbars=1');
 <%}%>
  </script>
  </body>
</html>
