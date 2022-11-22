<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>생산관리</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/ProductionManagement.css" rel="stylesheet" />
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper" >
                <div class="sidebar-heading border-bottom bg-light">생산 관리</div>
                <div class="list-group list-group-flush">
                    <div class="btn-group">
						  <button type="button" class="list-group-item list-group-item-action list-group-item-light p-3" data-bs-toggle="dropdown" aria-expanded="false">
						    조회
						  </button>
							  <ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="#">Action</a></li>
							    <li><a class="dropdown-item" href="#">Another action</a></li>
							    <li><a class="dropdown-item" href="#">Something else here</a></li>
							    <li><hr class="dropdown-divider"></li>
							    <li><a class="dropdown-item" href="#">Separated link</a></li>
							  </ul>
					
					</div>
                    <div class="btn-group">
						  <button type="button" class="list-group-item list-group-item-action list-group-item-light p-3" data-bs-toggle="dropdown" aria-expanded="false">
						    통계
						  </button>
							  <ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="#">Action</a></li>
							    <li><a class="dropdown-item" href="#">Another action</a></li>
							    <li><a class="dropdown-item" href="#">Something else here</a></li>
							    <li><hr class="dropdown-divider"></li>
							    <li><a class="dropdown-item" href="#">Separated link</a></li>
							  </ul>
					
					</div>
                    
                	</div>
                
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btnHide" id="sidebarToggle">메뉴 감추기</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">초기 화면</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">판매 관리</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ㅇㅇㅇ님 반갑습니다</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">내 정보</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">로그 아웃</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                    <h1 class="mt-4">이 곳은 CRUD를 위한 공간입니다.</h1>
                   
             
                    
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/ProductionManagement.js"></script>
    </body>
</html>
