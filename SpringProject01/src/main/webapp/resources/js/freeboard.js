/*
var lcnt = '<c:out value="${fbContent.fb_likeCnt }" />';
var lcnt2 = '<c:out value="${fbContent.fb_likeCnt }" />';
var hcnt = '<c:out value="${fbContent.fb_hateCnt }" />';
var hcnt2 = '<c:out value="${fbContent.fb_hateCnt }" />';*/
var alreadyLikeClick = false;
var alreadyHateClick = false;
// 추천
function updateLikeCnt() {
	var value = $('#fno').val();
	if (!alreadyLikeClick) {
		lcnt2 = parseInt(lcnt) + 1;
		var likeCnt = document.getElementById("likeBtn");
		likeCnt.innerHTML = "<i class=\"zmdi zmdi-thumb-up\"></i> 추천 " + lcnt2;
		alreadyLikeClick = true;
		alreadyHateClick = true;

		$.ajax('updateLikeCnt', {
			type : 'GET',
			data : {
				'fb_no' : value
			},
			dataType : 'text',
			error : function(request, status, error) {
				alert("code = " + request.status + " message = "
						+ request.responseText + " error = " + error); // 실패 시
				// 처리
			},
			success : function(data) {

			}
		});

	} else {
		if (hcnt != hcnt2) {
			alert("이미 비추천 하셨습니다.")
			return;
		} else {
			alert("이미 추천 하셨습니다.");
			return;
		}
	}
}

// 비추천
function updateHateCnt() {
	var value = $('#fno').val();
	if (!alreadyHateClick) {
		hcnt2 = parseInt(hcnt) + 1;
		var hateCnt = document.getElementById("hateBtn");
		hateCnt.innerHTML = "<i class=\"zmdi zmdi-thumb-down\"></i> 비추천 -"
				+ hcnt2;
		alreadyLikeClick = true;
		alreadyHateClick = true;

		$.ajax('updateHateCnt', {
			type : 'GET',
			data : {
				'fb_no' : value
			},
			dataType : 'text',
			error : function(request, status, error) {
				alert("code = " + request.status + " message = "
						+ request.responseText + " error = " + error); // 실패 시
				// 처리

			},
			success : function(data) {

			}
		});

	} else {
		if (lcnt != lcnt2) {
			alert("이미 추천 하셨습니다.")
			return;
		} else {
			alert("이미 비추천 하셨습니다.");
			return;
		}
	}
}

// 댓글목록 + 댓글스크립트 시작
$(document).ready(function() {
	$(".replyMore").click(function() {
		if ($('.replyMore').hasClass('replyMore')) {
			showReplyList();
			$('.replyMore').addClass('replyClose').removeClass('replyMore');
			$('#replyList').css('display', 'block');
		} else if ($('.replyClose').hasClass('replyClose')) {
			$('.replyClose').addClass('replyMore').removeClass('replyClose');
			$('#replyList').css('display', 'none');
		}
	});
});

// 댓글 스크립트
function showReplyList() {
	var value = $('#fno').val();
	$
			.ajax(
					'getReplyList',
					{
						type : 'GET',
						data : {
							'fb_no' : value
						},
						dataType : 'json',
						success : function(result) {

							var htmls = "";

							if (result.length < 1) {

								htmls += "<div>";
								htmls += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
								htmls += "</table></div>";
								htmls += "</div>";

							} else {
								/*
								 * alert("result : "+result+"@@@@ result.length :
								 * "+result.length);
								 */
								$(result)
										.each(
												function() {

													htmls += '<div class="media text-muted pt-3" id="br_no'
															+ this.br_no + '">';

													htmls += '<title>Placeholder</title>';

													htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

													htmls += '<span class="d-block">';

													htmls += '<strong style="font-size: 12pt "; class="text-gray-dark">'
															+ this.br_id
															+ '</strong>';

													htmls += '<span style="padding-left: 7px; font-size: 9pt">';

													htmls += '<a href="javascript:void(0)" onclick="fn_editReply('
															+ this.br_no
															+ ', \''
															+ this.br_id
															+ '\', \''
															+ this.br_content
															+ '\' )" style="padding-right:5px">수정</a>';

													htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply('
															+ this.br_no
															+ ')" >삭제</a>';

													htmls += '</span>';

													htmls += '</span>';

													htmls += '<span style="font-size: 10pt">';
													htmls += this.br_content;
													htmls += '</span>';

													htmls += '</p>';

													htmls += '</div>';

												}); // each end

							}

							$("#replyList").html(htmls);

							/*
							 * document.getElementById("replyList").innerHTML =
							 * htmls;
							 */

						}, // Ajax success end

						error : function(request, status, error) {

							alert("code = " + request.status + " message = "
									+ request.responseText + " error = "
									+ error); // 실패 시 처리

						}

					});

}// function showReplyList End;

// 댓글 입력
$(document).on('click','#btnReplyInsert',
		function insertReply() {
			
			var fb_no = $('#fb_no').val();
			var br_content = $('#br_content').val();
			var br_id = $('#br_id').val();
			var paramData = JSON.stringify({
				"br_content" : br_content,
				"br_id" : br_id,
				"fb_no" : fb_no });

			var headers = {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST" };

			$.ajax('insertReply', {

				headers : headers,
				data : paramData,
				type : 'POST',
				dataType : 'text',
				success : function(result) {

					alert("댓글입력성공");
					showReplyList();
					$('#br_content').val('');
					$('#br_id').val('');
				},
				error : function(request, status, error) {

					alert("code = " + request.status + " message = "
							+ request.responseText + " error = " + error);
				}
			});
		});

// 댓글 수정폼
function fn_editReply(br_no, br_id, br_content) {

	var htmls = "";

	htmls += '<div class="media text-muted pt-3" id="br_no' + br_no + '">';

	htmls += '<title>Placeholder</title>';

	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

	htmls += '<span class="d-block">';

	htmls += '<strong class="text-gray-dark">' + br_id + '</strong>';

	htmls += '<span style="padding-left: 7px; font-size: 9pt">';

	htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + br_no
			+ ', \'' + br_id + '\')" style="padding-right:5px">저장</a>';

	htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';

	htmls += '</span>';

	htmls += '</span>';

	htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

	htmls += br_content;

	htmls += '</textarea>';

	htmls += '</p>';

	htmls += '</div>';

	$('#br_no' + br_no).replaceWith(htmls);

	$('#br_no' + br_no + ' #editContent').focus();

}

// 댓글 수정
function fn_updateReply(br_no, br_id) {

	var replyEditContent = $('#editContent').val();
	var paramData = JSON.stringify({
		"br_content" : replyEditContent ,"br_no" : br_no });
	var headers = { "Content-Type" : "application/json" , 
			"X-HTTP-Method-Override" : "POST"};

	$.ajax('updateReply', {
		headers : headers,
		data : paramData,
		type : 'POST',
		dataType : 'text',
		success : function(result) {
			showReplyList();
		},
		error : function(request, status, error) {

			alert("code = " + request.status + " message = "
					+ request.responseText + " error = " + error); 
		}
	});

}

// 댓글 삭제
function fn_deleteReply(br_no) {

	var paramData = { "br_no" : br_no };

	$.ajax('delReply', {
		data : paramData,
		type : 'POST',
		dataType : 'text',
		success : function(result) {
			showReplyList();
		},
		error : function(request, status, error) {

			alert("code = " + request.status + " message = "
					+ request.responseText + " error = " + error); 
		}
	});

}



