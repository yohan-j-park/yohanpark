/**
 * board.js
 */
$('.lastboard').on('click',function(){
	window.location.href='/';
})

    $('.btnSearch').on('click', function(){
        var frm = $('.frm_search')[0];
        frm.nowPage.value = 1;
        param = $(frm).serialize();
        $('#content').load("/board/board_select", param);
    });
    
    board.move = function(nowPage){
        frm = $('.frm_search')[0];
        frm.nowPage.value = nowPage;
        param = $(frm).serialize();
        $.post("/board/board_select", param, function(data){
            $('#content').html(data);
        })
    }
    
    board.view = function(sno){
        frm = $('.frm_search')[0];
        frm.sno.value = sno;
        param = $(frm).serialize();
        $.post("/board/board_view", param, function(data){
            $('#content').html(data);
        })
    }    
    
    $('.btnDeleteR').on('click', function(){
        let yn = confirm('자료를 삭제하시겠습니까 ?');
        if( !yn ) return;
        param = $('.frm').serialize();
        $.post("/board/board_delete", param, function(data){
            $('#content').html(data);
        })
    })    
       /* $.post("/board/board_select", param, function(data){
			console.log("ok");
            $('#content').html(data);
            
        })*/
       

/*
(board = function(){
    var frm = $('.frm')[0];
    var param;
    var url='board/board_main.jsp?';
    
    
    
    $('.btnInsert').on('click', function(){
        param = $('.frm_search').serialize();
        $.post(url + "job=insert", param, function(data){
            $('#content').html(data);
        })
    })
    $('.btnInsertR').on('click', function(){
        var frm = $('.frm')[0];
        var param = new FormData(frm);
       
        $.ajax({
            type : 'POST',
            url : 'board/fileUpload.do?job=insertR',
            contentType : false,
            processData : false,
            data : param,
            dataType : 'html',
            success : function(data){
                $('#content').html(data);
            }
        })
    })
    
    
    $('.btnUpdate').on('click', function(){
        param = $(frm).serialize();
        $.post(url+ "job=update", param, function(data){
            $('#content').html(data);
        })
    })
    $('.btnUpdateR').on('click', function(){
        var frm = $('.frm')[0];
        var param = new FormData(frm);
       
        $.ajax({
            type : 'POST',
            url : 'board/fileUpload.do?job=updateR',
            contentType : false,
            processData : false,
            data : param,
            dataType : 'html',
            success : function(data){
                $('#content').html(data);
            }
        })
    })
    
    $('.btnSelect').on('click', function(){
        param = $(frm).serialize();
        $.post("/board/board_select, param, function(data){
            $('#content').html(data);
        })
    })
    $('.btnRepl').on('click', function(){
        param = $(frm).serialize();
        $.post(url+ "job=repl", param, function(data){
            $('#content').html(data);
        })
    })
    $('.btnReplR').on('click', function(){
        var frm = $('.frm')[0];
        var param = new FormData(frm);
       
        $.ajax({
            type : 'POST',
            url : 'board/fileUpload.do?job=replR',
            contentType : false,
            processData : false,
            data : param,
            dataType : 'html',
            success : function(data){
                $('#content').html(data);
            }
        })
    })


   
})() */

