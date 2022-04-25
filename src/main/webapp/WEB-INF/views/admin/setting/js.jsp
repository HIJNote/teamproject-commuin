<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="./../resources/admin"/>

<script src="${url}/vendors/js/vendor.bundle.base.js"></script>

<script src="${url}/vendors/chart.js/Chart.min.js"></script>  
  
<script src="${url}/vendors/datatables.net/jquery.dataTables.js"></script>
<script src="${url}/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="${url}/js/dataTables.select.min.js"></script>

<script src="${url}/js/off-canvas.js"></script>
<script src="${url}/js/hoverable-collapse.js"></script>
<script src="${url}/js/template.js"></script>
<script src="${url}/js/settings.js"></script>
<script src="${url}/js/todolist.js"></script>

<script src="${url}/js/dashboard.js"></script>
<script>
$(document).ready(function(){
  $("#userListSearch").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#userListTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
  $("#dormantSearch").on("keyup", function() {
	 var value = $(this).val().toLowerCase();
	 $("#dormant tr").filter(function() {
	 	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	 });
  });
  $("#blackSearch").on("keyup", function() {
	 var value = $(this).val().toLowerCase();
	 $("#black tr").filter(function() {
	 	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	 });
  });
  $("#stopSearch").on("keyup", function() {
     var value = $(this).val().toLowerCase();
     $("#stop tr").filter(function() {
	    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	 });
  });
  $("#removeSearch").on("keyup", function() {
	 var value = $(this).val().toLowerCase();
	 $("#remove tr").filter(function() {
	    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	 });
  });
  
  //관리자 메인페이지 검색 스크립트
  $("#newUserSearch").on("keyup", function() {
	 var value = $(this).val().toLowerCase();
	 $("#newUser tr").filter(function() {
	 	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	 });
  });
  $("#newBoardSearch").on("keyup", function() {
	 var value = $(this).val().toLowerCase();
	 $("#newBoard tr").filter(function() {
	 	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	 });
  });
  $("#newQuestionSearch").on("keyup", function() {
     var value = $(this).val().toLowerCase();
     $("#newQuestion tr").filter(function() {
	    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	 });
  });
  $("#newReportSearch").on("keyup", function() {
	 var value = $(this).val().toLowerCase();
	 $("#newReport tr").filter(function() {
	    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	 });
  });
  $("#board_All_List_Search").on("keyup", function() {
	 var value = $(this).val().toLowerCase();
	 $("#board_All_List tr").filter(function() {
	    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
     });
  });
  $("#board_Announcement_list_Search").on("keyup", function() {
	 var value = $(this).val().toLowerCase();
	 $("#board_Announcement_list tr").filter(function() {
	    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
     });
  });
  $("#board_Question_list_Search").on("keyup", function() {
	 var value = $(this).val().toLowerCase();
	 $("#board_Question_list tr").filter(function() {
	    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
     });
  });
});

</script>
