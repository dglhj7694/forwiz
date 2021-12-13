<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <c:set var="registerFlag" value="${empty employeeVO.emp_No ? 'create' : 'modify'}"/>
    <title>Employee <c:if test="${registerFlag == 'create'}">등록</c:if>
                  <c:if test="${registerFlag == 'modify'}">수정</c:if>
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="employeeVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 목록 화면 function */
        function fn_employee_selectList() {
           	document.detailForm.action = "<c:url value='/employeeList.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_employee_delete() {
           	document.detailForm.action = "<c:url value='/deleteEmployee.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 등록 function */
        function fn_employee_save() {
        	frm = document.detailForm;
         	if(!validateEmployeeVO(frm)){
                return;
            }else{ 
            	frm.action = "<c:url value="${registerFlag == 'create' ? '/addEmployee.do' : '/updateEmployee.do'}"/>";
                frm.submit();
            } 
        }
        
        -->
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="employeeVO" id="detailForm" name="detailForm">
    <div id="content_pop">
    	<!-- 타이틀 -->
    	<div id="title">
    		<ul>
    			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                    <c:if test="${registerFlag == 'create'}">사용자 정보 등록</c:if>
                    <c:if test="${registerFlag == 'modify'}">사용자 정보 수정</c:if>
                </li>
    		</ul>
    	</div>
    	<!-- // 타이틀 -->
    	<div id="table">
    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
    		<colgroup>
    			<col width="150"/>
    			<col width="?"/>
    		</colgroup>
    		<%-- <c:if test="${registerFlag == 'modify'}"> --%>
        		<tr>
        			<td class="tbtd_caption"><label for=emp_Id">아이디</label></td>
        			<td class="tbtd_content">
        				<form:input path="emp_Id" cssClass="essentiality" maxlength="10"/>
        			</td>
        			<td class="tbtd_caption"><label for="emp_Name">이름</label></td>
        			<td class="tbtd_content">
        				<form:input path="emp_Name" cssClass="essentiality" maxlength="10"/>
        			</td>
        		</tr>
    		<%-- </c:if> --%>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_Pw">비밀번호</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Pw" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Pw" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_Pwck">비밀번호확인</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Pwck" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Pwck" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_JoinDT">입사일</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_JoinDT" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_JoinDT" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_No">사원번호</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_No" maxlength="30" cssClass="essentiality" />
    				<form:errors path="emp_No" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_Dept">부서</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Dept" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Dept" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_Tel">전화번호</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Tel" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Tel" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_Position">직위</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Position" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Position" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_Phone">휴대폰번호</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Phone" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Phone" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_Birth">생년월일</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Birth" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Birth" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_Gen">성별</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Gen" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Gen" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_Email">메일</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Email" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Email" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_Addr">주소</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Addr" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Addr" />
    			</td>
    		</tr>
<%--     		<tr>
    			<td class="tbtd_caption"><label for="useYn"><spring:message code="title.sample.useYn" /></label></td>
    			<td class="tbtd_content">
    				<form:select path="useYn" cssClass="use">
    					<form:option value="Y" label="Yes" />
    					<form:option value="N" label="No" />
    				</form:select>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="description"><spring:message code="title.sample.description" /></label></td>
    			<td class="tbtd_content">
    				<form:textarea path="description" rows="5" cols="58" />&nbsp;<form:errors path="description" />
                </td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="regUser"><spring:message code="title.sample.regUser" /></label></td>
    			<td class="tbtd_content">
                    <c:if test="${registerFlag == 'modify'}">
        				<form:input path="regUser" maxlength="10" cssClass="essentiality" readonly="true" />
        				&nbsp;<form:errors path="regUser" /></td>
                    </c:if>
                    <c:if test="${registerFlag != 'modify'}">
        				<form:input path="regUser" maxlength="10" cssClass="txt"  />
        				&nbsp;<form:errors path="regUser" /></td>
                    </c:if>
    		</tr> --%>
    	</table>
      </div>
    	<div id="sysbtn">
    		<ul>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_employee_selectList();">목록</a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_employee_save();">
                            <c:if test="${registerFlag == 'create'}">등록</c:if>
                            <c:if test="${registerFlag == 'modify'}">수정</c:if>
                        </a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<c:if test="${registerFlag == 'modify'}">
                    <li>
                        <span class="btn_blue_l">
                            <a href="javascript:fn_employee_delete();">삭제</a>
                            <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                        </span>
                    </li>
    			</c:if>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:document.detailForm.reset();">초기화</a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
            </ul>
    	</div>
    </div>
    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>