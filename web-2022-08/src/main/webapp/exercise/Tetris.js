/**
 10/3 2일차 미완성
 */
// DOM
let playground = document.querySelector(".playground > ul");


// SETTING
let game_rows = 20;
let game_cols = 10;


// variables;
let score = 0;  
let duration = 500;		//블럭이 떨어지는 시간
let downInterval; 		//최대한 null값?
let tempMovingItem;		// 무빙을 실행하기 전에 담아두는 용도
const blocks = {
	Tshape: [
		[[2,1],[0,1],[1,0],[1,1]], // [] 안의 []는 방향키를 눌렀을때 변하는 좌표값
		[],
		[],
		[],
	]
}
const MovingItem = {	// 다음 블럭의 타입과 좌표들의 정보를 담는 변수
	type: "Tshape",
	direction: 0, 		// 화살표 방향키를 눌렀을때 좌우로 돌리는 지표
	top: 0,				// 좌표 기준으로 어디까지 내려가야 되는지 표현해주는 것
	left: 3,		// 좌표 기준으로 어디까지 옆으로 움직일 수 있는지 표현해주는 것	
};

init()


// functions
function init(){     /* 화면이 처음 실행될 때 실행되는 함수 이부분 어려움.. */
	tempMovingItem = { ...MovingItem }; //spread operator (배열 안의 값만 가져옴, 중요)
	// movingItem의 값이 변경되어도 tempMovingItem의 값이 변경되지 않음
	 // init을 하게되면 tempMovingItem을 잠깐 담아둠
	for (let i=0; i< game_rows; i++){
		prependNewLine()
	}	
	renderBlocks()
}

function prependNewLine() {
	const li = document.createElement("li");
	const ul = document.createElement("ul");
	for (let j=0; j<game_cols; j++){
		
	let matrix = document.createElement("li");
		ul.prepend(matrix);
	}
	li.prepend(ul)
	playground.prepend(li)
}

function renderBlocks(){	//블럭을 좌표값에 맞게 그리는 함수
	const { type, direction, top, left} = tempMovingItem;
	const movingBlocks = document.querySelectorAll(".moving");
	movingBlocks.forEach(moving=>{
		moving.classList.remove(type, "moving");
	})
	blocks[type][direction].forEach(block=>{
		const x = block[0] + left; // ul안에 들어있는 li의 값
		const y = block[1] + top; // li의 row값
		const target = playground.childNodes[y]? playground.childNodes[y].childNodes[0].childNodes[x] : null;
		const isAvailable = checkEmpty(target);
		if(isAvailable){
			target.classList.add(type, "moving")
		} else{
			tempMovingItem = {...MovingItem}
			renderBlocks()
		}
		target.classList.add(type, "moving") // 명시 된 클래스를 추가하는 매서드
	})
}
function checkEmpty(taget){
	if(!taget){
		return false;
	}
	return true;
}
function moveBlock(moveType, amount){
	tempMovingItem[moveType] += amount;
	renderBlocks()
}
// event handling
document.addEventListener("keydown", e=>{
	switch(e.keyCode){
		case 39: //39: right
			moveBlock("left", 1);
			break;
		case 37: //37: left
			moveBlock("left", -1);  
			break;
		case 40: //40: down
			moveBlock("top", 1);
			break;
			
		default:
			break;
	}
})