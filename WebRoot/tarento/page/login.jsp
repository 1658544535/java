<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>淘竹马达人中心</title>
    <link rel="stylesheet" href="<s:i18n name="sysconfig"><s:text name="seller_dns" /></s:i18n>/seller/css/homecsslib.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<s:i18n name="sysconfig"><s:text name="seller_dns" /></s:i18n>/seller/css/member_login.css" type="text/css" media="all" />
</head>

<body>
    <!-- 头部 -->
    <div class="m-wrapper-1080 m-mb-header">
        <div class="f-fl">
            <a class="mb-main-logo" href="#" title="淘竹马-妈妈的特卖会"></a>
        </div>
    </div>
    <!-- 内容区 -->
    <div class="m-wrapper-1080 m-mb-content">
        <!-- 左侧广告位 -->
        <div class="fl m-mb-amscont"></div>
        <!-- 右侧输入区域 -->
        <div class="fr m-ipt-cont">
            <form action="doTarentoLogin.do" class="m-ipt-area J_loginForm" method="post" accept-charset="utf-8">
                <div class="area-title">登录到淘竹马达人中心后台</div>
                <div class="ipt-group">
                    <label class="group-label">
                        <span class="identi"><i class="iconfont">&#xf012d;</i></span>
                        <input type="text" class="ipt-input" placeholder="您的手机号" name="username" value="">
                    <span id="usernameMsg"></span>
                    </label>
                </div>
                <div class="ipt-group">
                    <label class="group-label">
                        <span class="identi"><i class="iconfont">&#xf00c9;</i></span>
                        <input type="password" class="ipt-input" placeholder="密码" name="passwd" value="">
                    <span id="passwdMsg"></span>
                    </label>
                </div>
              
                <div class="ipt-btn-area">
                    <input type="submit" value="登录" class="ipt-btn" style="border:none;width:100%;" />
                </div>
                <div class="ipt-quick">
                    <span class="u-hp-target">
	                    ${msg }
	                </span>
                </div>
            </form>
        </div>
    </div>
    <!-- 页脚 -->
        <div id="footer">
			<div class="footer-nav">
			&nbsp;
			</div>
			<div class="footer-content">
				<div class="wrapper">
					<p>
                    	广东群宇互动科技有限公司 Copyright © 2014 All Rights Reserved 版权所有 粤ICP备13081564号
					</p>
				</div>
			</div>
		</div>
</body>

</html>
