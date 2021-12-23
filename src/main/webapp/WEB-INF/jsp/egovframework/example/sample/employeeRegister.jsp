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
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    
    <!--For Commons Validator Client Side-->
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    
 <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
    <validator:javascript formName="employeeVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
    <script type="text/javaScript" language="javascript" defer="defer">

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
            }else if(frm.emp_Pw.value != frm.emp_Pwck.value){
                alert("비밀번호와 비밀번화 확인이 일치하지 않습니다.");
                return;
            }
         	 else{ 
            	frm.action = "<c:url value="${registerFlag == 'create' ? '/addEmployee.do' : '/updateEmployee.do'}"/>";
                frm.submit();
            } 
        }
        

    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="employeeVO" id="detailForm" name="detailForm" encType="multipart/form-data">
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
        			<td rowspan="6" width="225px" height="300px">
        			<c:if test="${registerFlag == 'create'}">
        			<img width="225px" height="300px" id="image_section" src="#" alt="your photo" /></c:if>        			
        			
        			<c:if test="${registerFlag == 'modify'}">
        			<img width="225px" height="300px" id="image_section" src="#" alt="your photo" /></c:if>        			
        			</td>
        			
        			<td class="tbtd_caption" width="80px"><label for="emp_Id">아이디</label></td>
        			<td class="tbtd_content">
        				<form:input path="emp_Id" cssClass="txt" maxlength="10"/>
        			</td>
        			<td class="tbtd_caption" width="80px"><label for="emp_Name">이름</label></td>
        			<td class="tbtd_content">
        				<form:input path="emp_Name" cssClass="txt" maxlength="10"/>
        			</td>
        		</tr>
    		<%-- </c:if> --%>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_Pw">비밀번호</label></td>
    			<td class="tbtd_content">
    				<form:password path="emp_Pw" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Pw" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_Pwck">비밀번호확인</label></td>
    			<td class="tbtd_content">
    				<form:password path="emp_Pwck" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Pwck" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_JoinDT">입사일</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_JoinDT" name="emp_JoinDT" maxlength="30" cssClass="txt" autocomplete="off" readonly="true" />
    				<form:errors path="emp_JoinDT" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_No">사원번호</label></td>
    			<td class="tbtd_content">
    			<c:if test="${registerFlag == 'create'}">
    			<p style="color : red">(번호 자동 부여)</p>
    			</c:if>
    			<c:if test="${registerFlag == 'modify'}">
    				<form:input path="emp_No" maxlength="30" cssClass="essentiality" readonly="true" />
    				<form:errors path="emp_No" />
    			</c:if>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_Dept">부서</label></td>
    			<td class="tbtd_content">
    				<form:select path="emp_Dept" cssClass="use">
    				 	<option value="">--부서선택--</option>
    					<form:option value="경영관리팀" label="경영관리팀" />
    					<form:option value="전략사업본부" label="전략사업본부" />
    					<form:option value="영업1본부" label="영업1본부" />
    					<form:option value="영업2본부" label="영업2본부" />
    					<form:option value="SI사업본부" label="SI사업본부" />
    					<form:option value="금융사업부" label="금융사업부" />
    					<form:option value="부설연구소" label="부설연구소" />  					
    				</form:select>
    			<%-- 	<form:input path="emp_Dept" maxlength="30" cssClass="txt"/> --%>
    				<form:errors path="emp_Dept" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_Tel">전화번호</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Tel" type="text" name="tel" class="tel" maxlength="12" placeholder="전화번호"/>
    				<form:errors path="emp_Tel" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_Position">직위</label></td>
    			<td class="tbtd_content">
    			    <form:select path="emp_Position" cssClass="use">
    			    <option value="">--직급선택--</option>
    					<form:option value="회장" label="회장" />
    					<form:option value="사장" label="사장" />
    					<form:option value="부사장" label="부사장" />
    					<form:option value="이사" label="이사" />
    					<form:option value="부장" label="부장" />
    					<form:option value="차장" label="차장" />
    					<form:option value="과장" label="과장" />  					
    					<form:option value="대리" label="대리" />  					
    					<form:option value="주임" label="주임" />  					
    					<form:option value="사원" label="사원" />  					
    					<form:option value="인턴" label="인턴" />  					
    				</form:select>
<%--     				<form:input path="emp_Position" maxlength="30" cssClass="txt"/> --%>
    				<form:errors path="emp_Position" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_Phone">휴대폰번호</label></td>
    			<td class="tbtd_content">
    				 <form:input path="emp_Phone" type="text" name="phone" class="phone" maxlength="13" placeholder="휴대폰번호"/>
    				<form:errors path="emp_Phone" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="emp_Birth">생년월일</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Birth" maxlength="30" cssClass="txt" autocomplete="off" readonly="true"/>
    				<form:errors path="emp_Birth" />
    			</td>
    			<td class="tbtd_caption"><label for="emp_Gen">성별</label></td>
    			<td class="tbtd_content">
<%--     				<form:input path="emp_Gen" maxlength="30" cssClass="txt"/> --%>
					<form:radiobutton path="emp_Gen" value="M"/> 남자
					<form:radiobutton path="emp_Gen" value="W"/> 여자
    				<form:errors path="emp_Gen" />
    			</td>
    		</tr>
    		<tr>
    			<!-- <td>사진등록 버튼 구현 ㄱ</td> -->
    			<td class="tbtd_content">
    				<form:input type ="file" path="uploadFile" id="uploadFile" name="uploadFile" onchange="readURL(this);"/>   				  				
    				<form:errors path="input_photo" />
    			</td>
    			
    			
    			
    			
    			<td class="tbtd_caption"><label for="emp_Email">메일</label></td>
    			<td class="tbtd_content">
    			<c:if test="${registerFlag == 'create'}">
    				아이디 + @forwiz.com
    			</c:if>
    				<c:if test="${registerFlag == 'modify'}">
    				<form:input path="emp_Email" maxlength="30" cssClass="essentiality" readonly="true" />
    				<form:errors path="emp_Email" />
    				</c:if>
    			</td>
    			
    			<td class="tbtd_caption"><label for="emp_Addr">주소</label></td>
    			<td class="tbtd_content">
    				<form:input path="emp_Addr" maxlength="30" cssClass="txt"/>
    				<form:errors path="emp_Addr" />
    			</td>
    		</tr>
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

<script>
/* 설정 */
const config = {
	dateFormat: 'yy-mm-dd',
	showOn : "button",
	buttonText:"날짜선택",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
	    changeMonth:true,
	    changeYear:true,
	    minDate:'-100y',
	    yearRange:'c-100:c+10',
	    showButtonPanel: true,
	    currentText: "오늘 날짜" // 오늘 날짜로 이동하는 버튼 패널    	
}

$('button.ui-datepicker-current').live('click', function() {

    $.datepicker._curInst.input.datepicker('setDate', new Date()).datepicker('hide').blur();

});


/* 캘린더 */
$(function() {
  $( "input[name='emp_JoinDT']" ).datepicker(config);
});

$(function() {
  $( "input[name='emp_Birth']" ).datepicker(config);
});





function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();
reader.onload = function (e) {
$('#image_section').attr('src', e.target.result);
}
reader.readAsDataURL(input.files[0]);
}
}

$('.phone').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }
 
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
});

$('.tel').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 7) {
            $text.val($text.val() + '-');
        }
    }
 
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
});


</script>


</body>

</html>