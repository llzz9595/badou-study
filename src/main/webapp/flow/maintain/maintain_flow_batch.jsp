<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/web/pub/head.inc"%>
<head>
	<title>
		流程批次维护
	</title>
	
	<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout.css" />
    <script>
    	function query()
    	{
    		if(CheckForm(form1)){
    			form1.submit();
    		}
           return true;
    	}
    	/**
    	*  显示考核表
    	*/ 
    	function showAssessment(id)
    	{
    	    openFullScreenWin("${ROOT}/openAssessmentByMaintenance.do1?id="+id);
    		return true;
    	}
    	function ev_editStatus(status){
    		if(SelectUtil.checkedCount('selectedRow')>0){
    			$_E("form1").action = "${ROOT}/updateFlowBatchStatus.do1?status="+status;
    			$_E("form1").submit();
    		}else{
    			alert("请先选择要操作的考核表！");
    		}
        }
    </script>
</head>


<body class="LN_body" onmousewheel="setScrollzheight()">
 <div class="LN_popupsBox">
   <div class="LN_Append">
   <c:if test="${batchStatus==1}">
<div class="LN_popupstransmit100">
	<a href="#" onclick="ev_editStatus(0);return false;">转为未归档</a>
</div>
</c:if>
<c:if test="${batchStatus==null || batchStatus==0}">
<div class="LN_popupstransmit100">
	<a href="#" onclick="ev_editStatus(1);return false;">转为已归档</a>
</div>
</c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle2">
流程批次维护
</div>
<form name="form1" id="form1" method="post" action="${ROOT}/queryFlowBatchByMaintenance.do1">
<div class="LN_formTitle2">
 <table cellspacing="0" cellpadding="0" border="0" class="listquery">
 <tr>
        <td width="80%" align="left"  valign="bottom">
      	  部门(不递归):&nbsp;&nbsp;
          <input id="orgValues" name="orgValues" type="hidden" value="${orgValues}" />
        <textarea cols="65" rows="3" class="textarea1" id="orgName" name="orgNames" readonly="true" check="notBlank;" required="true" showName="被考核对象">${orgNames}</textarea>
				&nbsp;&nbsp;  
		<a style="cursor:hand" class="choose" onclick="getAddressList('0;','n','0','orgNames','orgValues');">选择查询对象</a>
        </td>
        <td width="20%"  align="left" valign="bottom">
            &nbsp;&nbsp;
        </td>
</tr>
 <tr>
        <td width="80%" align="left" >
        考核批次 :&nbsp;&nbsp;<page:singleBatchLN batch1="${batchDate}"/>&nbsp;&nbsp;&nbsp;&nbsp;
                     业务类型 :&nbsp;&nbsp;
        <select name="busiType">
        	<option value="YGKH" ${busiType=='YGKH' ? "selected" : "" }>员工考核</option>
        	<option value="BMKH" ${busiType=='BMKH' ? "selected" : "" }>组织考核</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;
          批次状态 :&nbsp;&nbsp;<select name="batchStatus">
        	<option value="0" ${batchStatus==0 ? "selected" : "" }>未归档</option>
        	<option value="1" ${batchStatus==1 ? "selected" : "" }>已归档</option>
        </select>
        </td>
		<td width="20%"  style="text-align:right;">
		<a href="#"  onclick="query();return false;"><img  src="${ROOT}/images/search.gif" >查询</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </td>
       
 </tr>

</table>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">查询列表</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="6%" class="LN_tableBoxtitle2" style="text-align:center;">序号
              <input type="checkbox" id="selectAllHandler" onclick="SelectUtil.checkAll(this,'selectedRow');"/></td>
            <td width="30%" class="LN_tableBoxtitle2" style="text-align:center;">批次名称</td>
            <td width="20%" class="LN_tableBoxtitle2" style="text-align:center;">所属组织</td>
            <td width="15%" class="LN_tableBoxtitle2" style="text-align:center;">发起时间</td>
            <td width="15%" class="LN_tableBoxtitle2" style="text-align:center;">归档时间</td>
            <td width="10%" class="LN_tableBoxtitle2" style="text-align:center;">状态</td>
            </tr>
             <c:choose>
               <c:when test="${!empty list}" >
                  <c:forEach var="o" items="${list}" varStatus="idx">
                  <tr class="list-color${idx.index%2==0?1:2}"}" >
                  <td class="LN_tableBoxText2">
                  <input type="checkbox" value="${o.id}" name="selectedRow" />${idx.count}</td>  
                  <td class="LN_tableBoxText2" >
                  <a href="#" class="LN_BlueLink" onclick="showAssessment('${o.id}');return false;">${o.batchName}</a>
                  </td>
                  <td class="LN_tableBoxText2"  style="text-align:left;word-break:break-all">${o.orgFullName}</td>
                  <td class="LN_tableBoxText2" >
                  	<fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
                  	&nbsp;
                  </td>
                  <td class="LN_tableBoxText2">
                  <c:if test="${o.status==1}">
                  <fmt:formatDate value="${o.archiveDate}" pattern="yyyy-MM-dd hh:mm:ss"/></c:if></td>
                  <td class="LN_tableBoxText2" >${o.status==1 ? '已归档' : '未归档'}</td>
                  </tr>
                  </c:forEach>	
               </c:when>
                <c:otherwise>
                 <tr>
                  <td class="LN_tableBoxText2" colspan ="9" style="text-align:center">没有符合相关条件的记录！</td>
                 </tr> 
                </c:otherwise>
             </c:choose>	
          </table>
      </td>
  </tr>
</table>
	<kpi:page-bar formId="form1"/>	
	</form>
</div>
</div>	
<script type="text/javascript">window.onload = function(){setPHeight3();}</script>
</body>
<kpi:UIResponse/>
</html>
