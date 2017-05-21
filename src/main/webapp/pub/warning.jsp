<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pub/head.inc"%>
<!-- exception.jsp -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统警告</title>
    <style type="text/css">
    	#errorPageContainer {
		  position: relative;
		  min-width: 13em;
		  max-width: 52em;
		  margin: 4em auto;
		  border: 1px solid ThreeDShadow;
		  border-radius: 10px;
		  padding: 3em;
		  -moz-padding-start: 30px;
		  background: url("chrome://global/skin/icons/warning-large.png") left 0 no-repeat -moz-Field;
		  background-origin: content-box;
		}
		
		#errorPageContainer.certerror {
		  background-image: url("chrome://global/skin/icons/sslWarning.png");
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
		
		#errorShortDesc > p {
		  overflow: auto;
		  border-bottom: 1px solid ThreeDLightShadow;
		  padding-bottom: 1em;
		  font-size: 130%;
		  white-space: pre-wrap;
		}
		
		#errorLongDesc {
		  -moz-padding-end: 3em;
		  font-size: 110%;
		}
		
		#errorLongDesc > p {
		}
		
		#errorTryAgain {
		  margin-top: 2em;
		  -moz-margin-start: 80px;
		}
    </style>
</head>
<body>
	<div xmlns="http://www.w3.org/1999/xhtml" id="errorPageContainer">
    
      <!-- Error Title -->
      <div id="errorTitle">
        <h1 id="errorTitleText">${errorMessage}</h1>
      </div>
      
      <!-- LONG CONTENT (the section most likely to require scrolling) -->
      <div id="errorLongContent">
      
        <!-- Short Description -->
        <div id="errorShortDesc">
          <p id="errorShortDescText">Firefox 无法建立到 localhost:302 服务器的连接。</p>
        </div>

        <!-- Long Description (Note: See netError.dtd for used XHTML tags) -->
        <div id="errorLongDesc">
<ul>
  <li>此站点暂时不可用或者太忙。请稍后重试。</li>
  <li>如果您无法载入任何页面，请检查您计算机的网络连接。</li>
  <li>如果您的计算机受到防火墙或代理服务器的保护，请确认 Firefox  被授权访问网页。</li>
</ul>
</div>

        <!-- Override section - For ssl errors only.  Removed on init for other
             error types.  -->
        
      </div>

      <!-- Retry Button -->
      <button id="errorTryAgain" autocomplete="off" onclick="retryThis(this);" autofocus="true">重试</button>
    </div>
	<!--<table>
   		<tr>
   			<td>出现异常!</td>
   		</tr>
   		<tr>
   			<td>管理员QQ:	</td>
   		</tr>
   		<tr>
   			<td>管理员主页:</td>
   		</tr>
   		<tr>
   			<td>管理员邮箱:</td>
   		</tr>
   		<tr>
   			<td>
   				<div>
			  		异常对象本身: 
 					<s:property value="exception"/><br/>  
			  		输出异常堆栈信息:
			       	<s:property value="exceptionStack" />
			    </div>
   			</td>
   		</tr>
   	</table>
	
--></body>
</html>
