<%@ page language="java" import="visualizing.Mapreport.*, java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
	
<link rel="stylesheet" href="/Visualizing/css/bootstrap.css"
	type="text/css" />
<link rel="stylesheet" href="/Visualizing/css/font-awesome.min.css"
	type="text/css" />
<link rel="stylesheet" href="/Visualizing/css/font.css" type="text/css"
	cache="false" />
<link rel="stylesheet" href="/Visualizing/css/app.css" type="text/css" />

<div class="modal-dialog" id="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4 class="modal-title">인천광역시 남구 숭의 1~3동</h4>
		</div>

		<div class="modal-body">
			<div class="panel wrapper">

				<div class="row">
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">50<small
								class="text-muted">건</small></span> <small class="text-muted h5">누수</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">55<small
								class="text-muted">건</small></span> <small class="text-muted h5">동파</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">0<small
								class="text-muted">건</small></span> <small class="text-muted h5">비만</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">0<small
								class="text-muted">건</small></span> <small class="text-muted h5">파손</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">0<small
								class="text-muted">건</small></span> <small class="text-muted h5">역류</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">0<small
								class="text-muted">건</small></span> <small class="text-muted h5">부재중</small>
						</a>
					</div>
				</div>
			</div>

			<div class="row m-t m-b">
				<div class="col-lg-4">
					<section class="panel">
						<header class="panel-heading">사용량비교</header>
						<div class="panel-body text-center">
							<img src="../images/chart-1.jpg">
						</div>
					</section>
				</div>

				<div class="col-lg-4">
					<section class="panel">
						<header class="panel-heading">일주일 사용량 비교</header>
						<div class="panel-body text-center">
							<img src="../images/chart-2.jpg">
						</div>
					</section>
				</div>

				<div class="col-lg-4">
					<section class="panel">
						<header class="panel-heading">3월달 부가서비스 발생횟수</header>
						<div class="panel-body text-center">
							<img src="../images/chart-3.jpg">
						</div>
					</section>
				</div>

			</div>


		</div>
	</div>
	<div class="leaflet-popup-tip-container">
		<div class="leaflet-popup-tip"></div>
	</div>
</div>
<!-- /.modal-content -->
</div>