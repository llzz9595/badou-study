<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pub/head.inc"%>
<!-- exception.jsp 00-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统警告</title>
    <style type="text/css">
    	#errorPageContainer {
		  position: relative;
		  min-width: 15em;
		  max-width: 40em;
		  min-height: 15em;
		  margin: 4em auto;
		  border: 1px solid ThreeDShadow;
		  border-radius: 10px;
		  padding: 3em;
		  -moz-padding-start: 30px;
		  background: url(${baseURL}/pub/images/error_06.png) left 0 no-repeat;
		  background-origin: content-box;
		}
		
		#errorPageContainer.certerror {
		  background-image: url(${baseURL}/pub/images/error_03.png);
		}
		
		#errorPageContainer:-moz-dir(rtl) {
		  background-position: right 0;
		}
		
		#errorTitle {
		  -moz-margin-start: 80px;
		}
		
		#errorLongContent {
		  -moz-margin-start: 80px;
		}
		
		#errorShortDesc > img {
		  overflow: auto;
		
		  padding-bottom: 1em;
		  font-size: 130%;
		  white-space: pre-wrap;
		  padding-left:40px;
		  margin-left:50px;
		  
		}
		
		#errorLongDesc {
		  -moz-padding-end: 3em;
		  font-size: 110%;
		  padding-left:80px;
		}
		
		#errorLongDesc > img {
		}
		
		#errorTryAgain {
		  margin-top: 1em;
		  -moz-margin-start: 80px;
		  margin-left: 8em;
		  align:right;
		}
    </style>
</head>
<body style="padding-top:50px">
	<!--<div xmlns="http://www.w3.org/1999/xhtml" id="errorPageContainer">
    <img src="${baseURL}/pub/images/error_06.png"></img>
      --><!-- Error Title --><!--
      <div id="errorTitle">
        <h1 id="errorTitleText">${errorMessage}</h1>
      </div>
      
      --><!-- LONG CONTENT (the section most likely to require scrolling) -->
      
      <div id="errorPageContainer">
        <!-- Short Description -->
        <div id="errorShortDesc">
         <img src="${baseURL}/pub/images/error_03.png" alt="" />
        </div>

        <!-- Long Description (Note: See netError.dtd for used XHTML tags) -->
<div id="errorLongDesc">
<h3>您访问的页面不存在!</h3>
<ul><li>如您对以上信息有疑问，请联系系统管理人员。</li>
  <li>管理员QQ: 49937310</li>
  <li>管理员主页: www.hbasechina.com</li>
  <li>管理员邮箱: 8duosoft@sina.cn</li>
</ul>
<!-- Override section - For ssl errors only.  Removed on init for other error types.  -->
      <button id="btnClose" autocomplete="off"  class="l-button l-button-submit" >关闭</button>
</div>
<script type="text/javascript">
    $(function (){
         //关闭
         $("#btnClose").click(function(){
        	 if (parent.tab)
             {
        		 parent.tab.removeTabItem(parent.tab.getSelectedTabItemID());
             }else{
            	 window.close();
             }
         });   
    });
</script>
</body>
</html>
