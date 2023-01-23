$(document).ready(function() {
// 		alert("load on");
		
		let count = 0;
		let session_nickname_value = '<c:out value="${sessionScope.sessionId}"/>';
		let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
		
		$('#edit').on("click", function() {
			let k_nickname = $('#update_div').val();
// 			alert(k_nickname);
			if(count%2 == 0) {
				++count;
				$('#update_div').attr("readonly", false);
				$('#update_div').focus();
// 				alert("insert_form");
			}else{
				--count;
// 				alert("checkpoint2 : " + k_nickname);
				if(reg.test(k_nickname) == false) {
				$.ajax({
					type:'POST',
					url:"kakao_update.do",
					data: {"k_nickname" : k_nickname},
					success:function(data) {
						if(data == 0 ) {
							alert("닉네임이 수정되었습니다.")
						}else if(data == 1) {
							alert("현재 닉네임과 동일합니다.")
						}else if(data == 2) {
							alert("중복된 닉네임입니다.")
						}
							$('#update_div').attr("readonly", true);
							setTimeout(function() {
								location.reload();
							}, 200);
					}
				});
				alert("update");
				
			}else{
				alert('특수문자 및 공백은 사용할 수 없습니다.');
				setTimeout(function() {
					location.reload();
				}, 200);
			}
			}
		});
});