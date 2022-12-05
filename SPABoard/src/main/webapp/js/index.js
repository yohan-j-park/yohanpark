/**
 * index
 */
 
 (spa = function(){
    
    //게시판 링크를 클릭한 경우
    $('.board').on('click', function(ev){
        $('#content').load('board/board_main.jsp?job=select');
    });
    
})()