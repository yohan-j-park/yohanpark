/**
 9/25 1일차 미완성
 */
// DOM
let playground = document.querySelector(".playground > ul");


// SETTING
let game_rows = 20;
let game_cols = 10;


// variables;
let score = 0;  
let duration = 500;		//블럭이 떨어지는 시간
let downInterval; 		//
let tempMovingItem;		// 무빙을 실행하기 전에 담아두는 용도
const blocks = {
	Tshape: [
		[[0,0],[0,1],[1,0],[1,1]], // [] 안의 []는 방향키를 눌렀을때 변하는 좌표값
		[],
		[],
		[],
	]
}
const MovingItem = {	// 다음 블럭의 타입과 좌표들의 정보를 담는 변수
	type: "Tshape",
	direction: 0, 		// 화살표 방향키를 눌렀을때 좌우로 돌리는 지표
	top: 0,				// 좌표 기준으로 어디까지 내려가야 되는지 표현해주는 것
	left: 0		// 좌표 기준으로 어디까지 옆으로 움직일 수 있는지 표현해주는 것	
}
init();


// functions
function init(){ /* 화면이 처음 실행될 때 실행되는 함수 이부분 어려움.. */
	tempMovingItem = {...movingItem}; 
	MovingItem.left = 3;
	 // init을 하게되면 tempMovingItem을 잠깐 담아둠
	/*for (let i=0; i< game_rows; i++){
		prependNewLine()
		
	}	
	*/
}

function prependNewLine(){
	let li = document.createElement("li");
	let ul = document.createElement("ul");
	for (let j=0; j<game_cols; j++){
		prependNewLine()
	let matrix = document.createElement("li");
		ul.prepend(matrix);
	}
	li.prepend(ul)
	playground.prepend(li)
}

function renderBlocks(){	//블럭을 좌표값에 맞게 그리는 함수
	
	
}