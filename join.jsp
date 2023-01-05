<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./join.css">
<script src="join.js" defer></script>
</head>
<body>
 <script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
    <script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;
                    }
                    else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if(data.userSelectedType === 'R'){
                        //법정동명이 있을 경우 추가한다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('address1').value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById('address2').focus();
                }
            }).open();
        }
    </script>
    <jsp:include page="header.jsp"/>
    <h2>회원가입</h2>
    <table id="joinForm">
	<form action="member_insert_action.jsp" name="member_insert" method="post">
		<tr>
		<td> 아이디 </td>
		<td ><input type="text" name="memberID" size="15"> 
		<input type="button" value="아이디 중복검사"></td>
		</tr>
		<tr>
		<td> 비밀번호 </td>
		<td ><input type="password" name="passwd" size="15"></td>
		</tr>
		<tr>
		<td> 비밀번호 확인 </td>
		<td ><input type="password" name="passwdC" size="15"></td>
		</tr>
		<tr>
		<td> 이름 </td>
		<td ><input type="text" name="memberName" size="10"></td>
		</tr>
		<tr class="birthday1">
		<td> 생년월일</td>
		<td><p><input type="text" name="birthday1" size="4">년</p>
		<p><input type="text" name="birthday2" size="2">월</p>
		<p><input type="text" name="birthday2" size="2">일</p></td>
		</tr>
		<tr>
		<td> 성별 </td>
		<td ><select name="sex" class="sex"><option value="남성">남성</option>
								<option value="남성">여성</option></select></td>
		</tr>
		<tr>
		<td> 이메일 </td>
		<td ><input type="text" name="email1" placeholder="아이디 입력" size="15">@ 
		 <input type="text" name="email2" placeholder="직접 입력" size="15">
					<select name="email3" class="email"> 
					<option value="">직접 입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="nate.com">nate.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="gmail.com">gmail.com</option>
					<option value="paran.com">paran.com</option>
					<option value="empas.com">empas.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option></select></td>
					
		</tr>
		<tr>
		<td> 주소 </td>
		<td ><input name="zipcode" id="zipcode" size="10" maxlength="7" readonly>
				<span onclick="execDaumPostcode();" style="cursor:pointer;">우편번호 검색</span><br/>
				<input name="address1" id="address1" size="40" maxlength="40" readonly><br/>
				<input name="address2" id="address2" size="40" maxlength="40"></td>
		</tr>
		<tr>
		<td> 휴대폰 번호 </td>
		<td ><select name="phone1" class="phone"><option value="010">010</option>
		 								<option value="011">011</option></select> -
           			 <input type="text" maxlength="4" size="4" name="phone2"> - 
           			 <input type="text" maxlength="4" size="4" name="phone3"></td>
        </tr>
        <tr>
        <td> 휴대폰 인증 </td>
        <td ><input type="text" name="phoneC" placeholder="인증번호 입력" size="8">
        	<input type="button" value="인증번호 받기"></td>
        </tr>
        <tr>
        <td> 관심분야 </td>
        <td>
					남성의류<input type="checkbox" name="interest" value="남성의류">
					여성의류<input type="checkbox" name="interest" value="여성의류">
					신발/잡화<input type="checkbox" name="interest" value="신발/잡화">
					시계/주얼리<input type="checkbox" name="interest" value="시계/주얼리"></br>
					디지털/가전 <input type="checkbox" name="interest" value="디지털/가전" class="interest">
					스포츠/레저<input type="checkbox" name="interest" value="스포츠/레저">
					가구/인테리어<input type="checkbox" name="interest" value="가구/인테리어"></br>
					음반/악기<input type="checkbox" name="interest" value="음반/악기">
					기타잡화<input type="checkbox" name="interest" value="기타잡화"></td>
		</tr>
		<tr>
		<td> 전체 동의 </td>
		<td><input type="checkbox" name="allcheck"></td>
		</tr>
		<tr>
		<td> 메일 수신 여부 </td>
		<td ><input type="radio" name="mailYN" value="동의" checked>동의 <input type="radio" name="mailYN" value="동의 안함">동의 안함</td>
		</tr>
		<tr>
		<td> 문자 수신 여부 </td>
		<td ><input type="radio" name="smsYN" value="동의" checked>동의 <input type="radio" name="smsYN" value="동의 안함">동의 안함</td>
		</tr>
		<tr>
		<td> 약관 동의 </td>
		<td><input type="radio" name="termsYN" value="동의" checked>동의 <input type="radio" name="termsYN" value="동의 안함">동의 안함</td>
		</tr>

	</form>
	</table>
	<div class="btnWarp">
	<input type="button" class="btn" value="취소하기">
	<input type="button" class="btn" value="가입하기">
	</div>
</body>
</html>