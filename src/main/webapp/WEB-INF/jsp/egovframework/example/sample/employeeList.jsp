<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>사용자 목록화면</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javaScript" language="javascript" defer="defer">
        <!-- 
        /* 글 수정 화면 function */
        function fn_employee_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateEmployeeView.do'/>";
           	document.listForm.submit();
        }
        
        /* 사용자 등록 화면 function */
        function fn_employee_addView() {
           	document.listForm.action = "<c:url value='/addEmployeePage.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_employee_selectList() {
        	document.listForm.action = "<c:url value='/EmployeeList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovEmployeeList.do'/>";
           	document.listForm.submit();
        }
        
      //-->
    </script>
    
</head>



<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<h1>사용자 목록 화면 입니다.</h1>
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>사용자 목록</li>
        		</ul>
        	</div>
        	<!-- // 타이틀 -->
        	<div id="search">
        		<ul>
        			<li>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use">
        					<form:option value="1" label="Name" />
        					<form:option value="0" label="ID" />
        				</form:select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="searchKeyword" cssClass="txt"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_employee_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
        	
        	
        	<!-- 네비 -->
		<!-- <a href="/employeeList.do">사용자 목록 조회</a>       	  	 -->	
        	
        	
        	
        	
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="사원번호, 아이디, 이름, 부서, 직위, 전화번호, 이메일을 표시하는 테이블">
        			<caption style="visibility:hidden">사원번호, 아이디, 이름, 부서, 직위, 전화번호, 이메일을 표시하는 테이블</caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="80"/>
        				<col width="80"/>
        				<col width="80"/>
        				<col width="140"/>
        				<col width="60"/>
        				<col width="180"/>
        				<col width="220"/>
        			</colgroup>
        			<tr>
        				<th align="center">No</th>
        				<th align="center">사원번호</th>
        				<th align="center">아이디</th>
        				<th align="center">이름</th>
        				<th align="center">부서</th>
        				<th align="center">직위</th>
        				<th align="center">전화번호</th>
        				<th align="center">이메일</th>
        			</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
<%--             				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.emp_No}"/>')"><c:out value="${result.emp_No}"/></a></td>
            				<td align="left" class="listtd"><c:out value="${result.emp_Id}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.emp_Name}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.emp_Dept}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.emp_Position}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.emp_Phone}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.emp_Email}"/>&nbsp;</td> --%>
            				
            				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
            				<td align="center" class="listtd"><a href="javascript:fn_employee_select('<c:out value="${result.empNo}"/>')"><c:out value="${result.empNo}"/></a></td>
            				<td align="left" class="listtd"><c:out value="${result.empId}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.empName}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.empDept}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.empPosition}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.empPhone}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.empEmail}"/>&nbsp;</td>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span class="btn_blue_l">
        	              <a href="javascript:fn_employee_addView();">사용자 등록</a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
        	</div>
        </div>
    </form:form>
</body>



</html>