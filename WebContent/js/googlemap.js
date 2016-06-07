var globalGeocoder;
var globalMap;
var searchMarker = new google.maps.Marker();
var leakMarkers = [ ];
var freezeMarkers = [ ];
var fatMarkers = [ ];
var breakMarkers = [ ];
var reverseMarkers = [ ];
var absenceMarkers = [ ];
var searchMarkers = [ ];
var dongMarkers = [ ];
var consumerMarkers = [ ] ;
var cons_sum = 0;
var cnt_leak = 0;
var cnt_absence = 0;
var cnt_freeze = 0;
var entire_flag = true;
var leak_flag = false;
var freezed_flag = false;
var fat_flag = false;
var break_flag = false;
var reverse_flag = false;
var absence_flag = false;
var abnormalColor = "FF0000";
var normalColor = "2ECCFA";
var incheon = "인천광역시";
var infoWindow ;
var leakcount = 0;
var freezecount = 0;
var fatcount = 0;
var breakcount = 0;
var reversecount = 0;
var absencecount = 0;


var click_countleak=0;
var click_countfreeze=0;
var click_countfat=0;
var click_countbreak=0;
var click_countreverse=0;
var click_countabsence=0;
var icon_on = 0;
var hidebutton = 0;

var searchResultText= document.getElementById('searchResultCount');

// 맵 초기화initialize 
function initialize( ) {

	// Incheon
//	if (x == 0)
		x = 37.4562557;
//	if (y == 0)
		y = 126.70520620000002;

	globalGeocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(x, y);

	var myOptions = {
		zoom : 13,
		center : latlng,
		navigationControl : false, // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택..
		navigationControlOptions : {
			position : google.maps.ControlPosition.TOP_RIGHT,
			style : google.maps.NavigationControlStyle.DEFAULT
		// ANDROID, DEFAULT, SMALL, ZOOM_PAN
		},
		streetViewControl : false,
		scaleControl : false, // 지도 축적 보여줄 것인지.
		mapTypeControl : false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};

	globalMap = new google.maps.Map(document.getElementById("map_canvas"),
			myOptions);

	//Create Entire Markers And Show all sign of abnormal dongs.
	createDongMarkers();
	search_info();


	// Search Box
	var input = document.getElementById('searchbox');

	// Color-interpolation Box
	var colorBox = document.getElementById('color-interpolation');

	// Appending boxes
	// globalMap.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	globalMap.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(colorBox);


	// Zoom Changed Event
	globalMap.addListener('zoom_changed', function() {
		//초기 상태로 되돌아옴.
		if (globalMap.getZoom() <= 13) {

			//동 마커 출력하고 , 수용가 마커 감추기.
			hideConsumerMarkersMarkers();
			showIcon();
			$("#ui-list-group").empty(); //리스트 초기화
			searchResultText.innerHTML = ''; //검색결과 수 초기화

		}
		// 줌을 확대했을때 map center와 일정한 거리 안에 들어오는 동은 전부 상세 주소 출력.
		else if (globalMap.getZoom() == 16) {
			// console.log('Zoom: ' + globalMap.getCenter());
		}
	});

	// autoComplete Event
	var autocomplete = new google.maps.places.Autocomplete(input);
	google.maps.event.addDomListener(window, 'load', initialize);
	
	//아이콘 삭제

	if(leakcount==0)
		$("#overusedimage").hide();
	if(freezecount==0)
		$("#freezeimage").hide();
	if(fatcount==0)
		$("#fatimage").hide();
	if(breakcount==0)
		$("#breakimage").hide();
	if(reversecount==0)
		$("#reverseimage").hide();
	if(absencecount==0)
		$("#absenceimage").hide();
	
	
	//아이콘 숫자 생성
	if(leakcount!=0)
		document.getElementById('overusedimage').innerHTML = leakcount;
	if(freezecount!=0)
		document.getElementById('freezeimage').innerHTML = freezecount;
	if(fatcount!=0)
		document.getElementById('fatimage').innerHTML = fatcount;
	if(breakcount!=0)
		document.getElementById('breakimage').innerHTML = breakcount;
	if(reversecount!=0)
		document.getElementById('reverseimage').innerHTML = reversecount;
	if(absencecount!=0)
		document.getElementById('absenceimage').innerHTML = absencecount;

	
	
	

}


//leak 발생한 동 temp저장하고, leakMarkers 배열에 삽입
function search_info() {

	for (var i = 0; i < dongInfoList.length; i++) {

		if (dongInfoList[i].leak != 0) {
			temp = dongInfoList[i].dong
			//dongInfoList[i].gu + 
			for (var j = 0; j < dongMarkers.length; j++) {
				if (temp == dongMarkers[j].title.split(' ')[2]) {
					// 마커를 저장한다.
					leakMarkers.push(dongMarkers[j]);
				}

			}
		}
	}
	
	for (var i = 0; i < dongInfoList.length; i++) {

		if (dongInfoList[i].freezed != 0) {
			temp = dongInfoList[i].dong
			//dongInfoList[i].gu + 
			for (var j = 0; j < dongMarkers.length; j++) {
				if (temp == dongMarkers[j].title.split(' ')[2]) {
					// 마커를 저장한다.
					freezeMarkers.push(dongMarkers[j]);
				}

			}
		}
	}
	
	for (var i = 0; i < dongInfoList.length; i++) {

		if (dongInfoList[i].fat != 0) {
			temp = dongInfoList[i].dong
			//dongInfoList[i].gu + 
			for (var j = 0; j < dongMarkers.length; j++) {
				if (temp == dongMarkers[j].title.split(' ')[2]) {
					// 마커를 저장한다.
					fatMarkers.push(dongMarkers[j]);
				}

			}
		}
	}
	
	for (var i = 0; i < dongInfoList.length; i++) {

		if (dongInfoList[i].breakage != 0) {
			temp = dongInfoList[i].dong
			//dongInfoList[i].gu + 
			for (var j = 0; j < dongMarkers.length; j++) {
				if (temp == dongMarkers[j].title.split(' ')[2]) {
					// 마커를 저장한다.
					breakMarkers.push(dongMarkers[j]);
				}

			}
		}
	}
	
	for (var i = 0; i < dongInfoList.length; i++) {

		if (dongInfoList[i].reverse != 0) {
			temp = dongInfoList[i].dong
			//dongInfoList[i].gu + 
			for (var j = 0; j < dongMarkers.length; j++) {
				if (temp == dongMarkers[j].title.split(' ')[2]) {
					// 마커를 저장한다.
					reverseMarkers.push(dongMarkers[j]);
				}

			}
		}
	}
	
	for (var i = 0; i < dongInfoList.length; i++) {

		if (dongInfoList[i].absence != 0) {
			temp = dongInfoList[i].dong
			//dongInfoList[i].gu + 
			for (var j = 0; j < dongMarkers.length; j++) {
				if (temp == dongMarkers[j].title.split(' ')[2]) {
					// 마커를 저장한다.
					absenceMarkers.push(dongMarkers[j]);
				}

			}
		}
	}
}


// 전체 사용자들 가운데 누수/동파/부재중/역류/비만관/파손 에 해당하는 사용자들을 포함하는 동을 빨간색, 나머지는 초록색으로 표시
function createDongMarkers( ) {

	for (var i = 0; i < dongInfoList.length; i++) {

		if ( dongInfoList[i].leak != 0 || dongInfoList[i].absence != 0 || dongInfoList[i].freezed != 0 ||
				dongInfoList[i].reverse != 0 || dongInfoList[i].fat != 0 || dongInfoList[i].breakage != 0 ) {

			var pinImage = new google.maps.MarkerImage(
					"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
							+ abnormalColor, new google.maps.Size(21, 34),
					new google.maps.Point(0, 0), new google.maps.Point(10,
							34));
			var pinShadow = new google.maps.MarkerImage(
					"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
					new google.maps.Size(40, 37), new google.maps.Point(0,
							0), new google.maps.Point(12, 35));

			// Craete marker
			var marker = new google.maps.Marker({
				title : incheon + " " + dongInfoList[i].gu + " "
						+ dongInfoList[i].dong,
				position : new google.maps.LatLng(dongInfoList[i].lat , dongInfoList[i].lng),
				draggable : false,
				icon : pinImage,
				shadow : pinShadow,
				map:globalMap
			});

			dongMarkers.push(marker);

			marker.set(globalMap);

			
			marker.addListener('click', function() {
				//change zoom level and position
				globalMap.setCenter(this.position);
				globalMap.setOptions({ 'zoom' : 15 });
				$("#ui-list-group").empty(); //검색결과 리스트 초기화
				
				hideDongMarkers();
				createConsumerMarkers(this.title.split(' '));
				$('#element_to_pop_up').bPopup();
				drawDongSummaryReport(this.title.split(' '));
					
			});
		}
	}

}

//수용가 마커를 생성하고 클릭 이벤트를 등록.
function createConsumerMarkers ( addressArray ) {


	var gu = addressArray[1];
	var dong = addressArray[2];
	var color = "";

	for ( var i = 0 ; i < summaryReportList.length ; i ++ ) {
		if( summaryReportList[i].gu == gu && summaryReportList[i].dong == dong ) {

			if ( summaryReportList[i].leak != 0 || summaryReportList[i].absence != 0 || summaryReportList[i].freezed != 0 ||
					summaryReportList[i].reverse != 0 || summaryReportList[i].fat != 0 || summaryReportList[i].breakage != 0 ) {
				color = abnormalColor;
			}
			else {
				color = normalColor;
			}

			//수용가 마커 생성.
			var pinImage = new google.maps.MarkerImage(
					"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
							+ color, new google.maps.Size(21, 34),
					new google.maps.Point(0, 0), new google.maps.Point(10,
							34));
			var pinShadow = new google.maps.MarkerImage(
					"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
					new google.maps.Size(40, 37), new google.maps.Point(0,
							0), new google.maps.Point(12, 35));

			// Craete marker
			var marker = new google.maps.Marker({
				title : incheon + " " + summaryReportList[i].gu + " "
						+ summaryReportList[i].dong + " " + summaryReportList[i].detail,
				position : new google.maps.LatLng(summaryReportList[i].lat , summaryReportList[i].lng),
				draggable : false,
				icon : pinImage,
				shadow : pinShadow,
				map:globalMap
			});
			consumerMarkers.push(marker);

			marker.set(globalMap);

			// 수용가 마커를 클릭했을때의 이벤트 처리 함수
			marker.addListener('click', function() {

//				globalMap.setCenter(this.position);
				$('#element_to_pop_up').bPopup();
				drawConsumerReport(this.title.split(' '));

			});
		}
	}
}

function drawConsumerReport( addressArray ){

	var gu = addressArray[1];
	var dong = addressArray[2];
	var detail = addressArray[3];
	var sum_weeklyConsumption = 0;
	var dongCount = 0;
	var dongConsumption = 0;

	//동의 개수를 세고 동의 총 사용량을 구함.
	for ( var i = 0 ; i < summaryReportList.length ; i ++ ) {
		if(summaryReportList[i].gu == gu && summaryReportList[i].dong == dong ) {
			dongCount ++;
			dongConsumption += Number(summaryReportList[i].consumed);
		}
	}

	for ( var i = 0 ; i < summaryReportList.length ; i ++ ) {

		if(summaryReportList[i].gu == gu && summaryReportList[i].dong == dong && summaryReportList[i].detail == detail ) {

			//1.주소칸
			document.getElementById('modal-title').innerHTML = incheon+ ' ' + gu + ' ' + dong + ' ' + detail;
			console.log(incheon+ ' ' + gu + ' ' + dong + ' ' + detail);
			info_date.style.fontSize = "90%"; // 주소 출력 폰트 사이즈

			//일주일치 사용량 합 구하기.
			sum_weeklyConsumption = Number(summaryReportList[i].day1) + Number ( summaryReportList[i].day2 ) + Number ( summaryReportList[i].day3 ) +
			Number ( summaryReportList[i].day4) + Number ( summaryReportList[i].day5 ) + Number ( summaryReportList[i].day6 ) + Number (summaryReportList[i].day7);


			//3.요약 report 사용량,예측량, 일주일 평균 , 지역 평균 그래프 그리기.
			drawColumn(Math.round(summaryReportList[i].consumed),
					Math.round(summaryReportList[i].predicted),
					Math.round(sum_weeklyConsumption/7) ,
					Math.round(dongConsumption / dongCount) );

			//4.요약 report history 그래프 그리기.
			drawHistory ( Number(summaryReportList[i].day7) , Number ( summaryReportList[i].day6 ) , Number ( summaryReportList[i].day5 ) ,
			Number ( summaryReportList[i].day4), Number ( summaryReportList[i].day3 ) , Number ( summaryReportList[i].day2 ) ,
			Number (summaryReportList[i].day1));
		}
	}
}

//누수, 동파, 비만, 파손, 역류, 부재중  동단위 count
function countTrouble(){
	for (var i = 0; i < dongInfoList.length; i++) {
		if(dongInfoList[i].leak != 0)
			leakcount++;
		if(dongInfoList[i].freezed != 0)
			freezecount++;
		if(dongInfoList[i].fat != 0)
			fatcount++;
		if(dongInfoList[i].breakage != 0)
			breakcount++;
		if(dongInfoList[i].reverse != 0)
			reversecount++;
		if(dongInfoList[i].absence != 0)
			absencecount++;
	}
}

countTrouble();



//요약 report column 그래프(사용량, 예측량, 일주일 평균, 지역 평균
function drawColumn(cons, pred, week, region) {
	var data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
		role : "style"
	} ], [ '사용량', cons, '#b87333' ], // RGB value
	[ '예측량', pred, 'silver' ], // English color name
	[ '일주일평균', week, '#b87333' ], [ '지역평균', region, '#b87333' ] ]);

	var view = new google.visualization.DataView(data);
	view.setColumns([ 0, 1, {
		calc : "stringify",
		sourceColumn : 1,
		type : "string",
		role : "annotation"
	}, 2 ]);

	var options = {
		fontSize : 11,
		bar : {
			groupWidth : "80%"
		},
		legend : {
			position : "none"
		},
		vAxis : {
			minValue : 0,
			viewWindow : {
				min : 0
			}
		}
	};

	chart = new google.visualization.ColumnChart(document
			.getElementById("info_graph"));

	chart.draw(view, options);
}


// 일주일간 히스토리 꺾은선 그래프 그리는 함수
function drawHistory(day1, day2, day3, day4, day5, day6, day7, avg) {

	var data = new google.visualization.DataTable();
	data.addColumn('date', 'Time of Day');
	data.addColumn('number', 'Consumption');
	data.addColumn('number', 'Average');

	data.addRows([ [ new Date(2015, 1, 22), day1, avg ],
			[ new Date(2015, 1, 23), day2, avg ],
			[ new Date(2015, 1, 24), day3, avg ],
			[ new Date(2015, 1, 25), day4, avg ],
			[ new Date(2015, 1, 26), day5, avg ],
			[ new Date(2015, 1, 27), day6, avg ],
			[ new Date(2015, 1, 28), day7, avg ], ]);

	var options = {
		//title : "일주일 간 history",

		titleTextStyle : {
			color : "black",
			fontSize : 15
		},
		hAxis : {
			format : 'yy-MM-dd'
		// gridlines: {count: 15}
		},
		vAxis : {
			gridlines : {
				color : 'none'
			},
		},
		legend : {
			position : "bottom"
		},
		series : {
			1 : {
				lineDashStyle : [ 5, 5 ]
			}
		}
	};

	var chart = new google.visualization.LineChart(document
			.getElementById('info_history'));

	chart.draw(data, options);
}

//요약 리포트 부가 서비스별 최근 발생 횟수 및 한달간 발생 빈도 그래프
function drawServiceFrequency( count_leak , count_absence , count_freezed , count_reverse , count_fat , count_breakage ) {
	var data = google.visualization.arrayToDataTable([
	                                                  ["Element", "Density", { role: "style" } ],
	                                                  ["누수", count_leak, "color: blue"],
	                                                  ["부재중", count_absence, "color: blue"],
	                                                  ["동파", count_freezed, "color: blue"],
	                                                  ["역류", count_reverse, "color: blue"],
	                                                  ["비만", count_fat, "color: blue"],
	                                                  ["파손", count_breakage, "color: blue"]
	                                                  ]);
	
	var view = new google.visualization.DataView(data);
	view.setColumns([0, 1,
	                 { calc: "stringify",
		sourceColumn: 1,
		type: "string",
		role: "annotation" },
		2]);
	
	var options = {
			title: "지번 달 부가서비스 발생 횟수",
			height: 200,
			chartArea: {'width': '80%', 'height': '80%'},
			bar: {groupWidth: "40%"},
			legend: { position: "none" },
	};
	var chart = new google.visualization.ColumnChart(document.getElementById("info_service"));
	chart.draw(view, options);
	
}

// 동 요약 리포트
/*
 * 2016.4.3 수정 : summaryReport데이터에서 요약리포트 만드는것으로 바꿈.(욱현)
 */
function drawDongSummaryReport(addressArray) {

	var len = addressArray.length;
	var leak_date = "";
	var absence_date = "null";
	var freeze_date = "null";
	var address = "";

	var gu = addressArray[1];
	var dong = addressArray[2];

	var sum_day1 = 0;
	var sum_day2 = 0;
	var sum_day3 = 0;
	var sum_day4 = 0;
	var sum_day5 = 0;
	var sum_day6 = 0;
	var sum_day7 = 0;
	var sum_weeklyConsumption = 0;
	
	var userCount = 0;
	var dongCount = 0;

	var sum_consumed = 0;
	var sum_predicted = 0;
	var sum_consumed_gu = 0;

	var count_leak = 0;
	var count_absence = 0;
	var count_freezed = 0;
	var count_reverse = 0;
	var count_fat = 0;
	var count_breakage = 0;
	
	var leakFrequency = 0;
	var absenceFrequency = 0;
	var freezedFrequency = 0;
	var reverseFrequency = 0;
	var fatFrequency = 0;
	var breakageFrequency = 0;

	var dongList = [ ];

	for (var i = 0; i < len; i++) {
		address += addressArray[i] + ' ';
	}

	//구에 해당하는 동의 수 count , 구의 총 사용량 구하기.
	for (var j = 0; summaryReportList[j]; j++) {

		if (gu == summaryReportList[j].gu ) {

			sum_consumed_gu += Number(summaryReportList[j].consumed);

			if( dongList.indexOf(summaryReportList[j].dong) == -1) {
				dongList.push(summaryReportList[j].dong)
				dongCount += 1;
			}
		}
	}

	//클릭한 동에 해당하는 수용가의 수만큼 반복한다.
	for (var j = 0; summaryReportList[j]; j++) {

		if (gu == summaryReportList[j].gu && dong == summaryReportList[j].dong ) {

			//동에 해당하는 수용가의 수 count.
			userCount += 1;

			//사용량,예측량
			sum_consumed += Number(summaryReportList[j].consumed);
			sum_predicted += Number(summaryReportList[j].predicted);

			//동의 일주일치 history
			sum_day1 += Number(summaryReportList[j].day1);
			sum_day2 += Number(summaryReportList[j].day2);
			sum_day3 += Number(summaryReportList[j].day3);
			sum_day4 += Number(summaryReportList[j].day4);
			sum_day5 += Number(summaryReportList[j].day5);
			sum_day6 += Number(summaryReportList[j].day6);
			sum_day7 += Number(summaryReportList[j].day7);

			//동에 해당하는 수용가들의 부가서비스 count.
			if ( summaryReportList[j].leak == 1 ) {
				count_leak ++;
			}
			if ( summaryReportList[j].absence == 1 ) {
				count_absence ++;
			}
			if ( summaryReportList[j].freezed == 1 ) {
				count_freezed ++;
			}
			if ( summaryReportList[j].reverse == 1 ) {
				count_reverse ++;
			}
			if ( summaryReportList[j].fat == 1 ) {
				count_fat ++;
			}
			if ( summaryReportList[j].breakage == 1 ) {
				count_breakage ++;
			}
			
			leakFrequency += Number (summaryReportList[j].countLeak);
			absenceFrequency += Number (summaryReportList[j].countAbsence);
			freezedFrequency += Number(summaryReportList[j].countFreezed);
			reverseFrequency += Number(summaryReportList[j].countReverse);
			fatFrequency += Number(summaryReportList[j].countFat);
			breakageFrequency += Number(summaryReportList[j].countBreakage);
		}
	}

	//1.주소칸
	document.getElementById('modal-title').innerHTML = incheon+ ' ' + gu + ' ' + dong ; // 주소 출력

	//2.부가서비스별 발생 횟수.
	document.getElementById('blockLeak').innerHTML = count_leak + "건";
	
	document.getElementById('blockFreezed').innerHTML = count_freezed + "건";

	document.getElementById('blockFat').innerHTML = count_fat + "건";

	document.getElementById('blockBreakage').innerHTML = count_breakage + "건";
	
	document.getElementById('blockReverse').innerHTML = count_reverse + "건";

	document.getElementById('blockAbsence').innerHTML = count_absence + "건";
	
	//일주일치 사용량 합 구하기.
	sum_weeklyConsumption += sum_day1 + sum_day2 + sum_day3 + sum_day4 + sum_day5 + sum_day6 + sum_day7;
	
	//3.요약 report 사용량,예측량, 일주일 평균 , 지역 평균 그래프 그리기.
	drawColumn(Math.round(sum_consumed), Math.round(sum_predicted), Math.round(sum_weeklyConsumption/7) , Math.round(sum_consumed_gu / dongCount) );

	//4.요약 report history 그래프 그리기.
	drawHistory(sum_day7 , sum_day6 , sum_day5 , sum_day4 , sum_day3 , sum_day2 , sum_day1 , sum_weeklyConsumption/7 );
	
	drawServiceFrequency(leakFrequency, absenceFrequency, freezedFrequency, reverseFrequency, fatFrequency, breakageFrequency);

}


// 전체 동들의 마커를 지도에 출력
function showDongMarkers() {
	for (var i = 0; i < dongMarkers.length; i++) {
		dongMarkers[i].setMap(globalMap);
	}
}

// 전체 동들의 마커를 지도에서 숨김
function hideDongMarkers() {
	for (var i = 0; i < dongMarkers.length; i++) {
		dongMarkers[i].setMap(null);
	}
}

// 세부 사용자들의 마커를 지도에 출력
function showConsumerMarkers() {
	for (var i = 0; i < consumerMarkers.length; i++) {
		consumerMarkers[i].setMap(globalMap);
	}
}

// 세부 사용자들의 마커를 지도에서 숨김.
function hideConsumerMarkersMarkers() {
	var i = 0;
	while (i < consumerMarkers.length) {
		consumerMarkers[i].setMap(null);
		i++;
	}
	consumerMarkers = [ ];
}

// 지도 검색 - 자동완성 기능을 사용했을때와 그냥 동 이름을 검색했을때를 다시 생각할것.
function codeAddress() {

   // Get Address from HTML
   var address = document.getElementById("searchbox").value;
   var color = "0000FF";

   var pinImage = new google.maps.MarkerImage(
         "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
               + color, new google.maps.Size(21, 34),
         new google.maps.Point(0, 0), new google.maps.Point(10, 34));
   var pinShadow = new google.maps.MarkerImage(
         "http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
         new google.maps.Size(40, 37), new google.maps.Point(0, 0),
         new google.maps.Point(12, 35));

   
   
   globalGeocoder.geocode({
      'address' : address
   }, function(results, status) {
      if (status === google.maps.GeocoderStatus.OK) {

         searchMarker.setMap(null);
         
         var addressArray = address.split(" ");
         var dongMarkerstTitle = dongMarkers
         
         //초기화
         globalMap.setCenter(results[0].geometry.location);
         $("#ui-list-group").empty(); //검색 결과 리스트 초기화 
         
         var temp;
         var j = 0;
         var dong = '';
         var searchResultCount = 0;
         
         //해당 동의 수용가를 목록으로 출력한다.
         var i = 0
         while(j < dongMarkers.length){
             temp = dongMarkers[j].title.split(" ");
             
             if(addressArray[3] == temp[2] || addressArray[0] == temp[2]){
                 dong = temp[2];
             }
             j++;
          }
         
         while (dong != '' && i < summaryReportList.length ) {
        	 if ( dong == summaryReportList[i].dong ) {
        		 searchResultCount ++;
        		 
        		 var guDong = summaryReportList[i].gu + ' ' + summaryReportList[i].dong;
        		 var detail = summaryReportList[i].detail;
        		 
        		 var li = document.createElement('li');
        		 li.className = "list-group-item";
        		 li.style="cursor:pointer"
//        		 li.onclick = function ( value  ) { 
//        			 console.log(value.target)
//        		 };
//        		 var a = document.createElement('a');
//        		 a.href = '#'
//    			 a.className = 'clear';

        		 var strong_guDong = document.createElement('strong');
        		 strong_guDong.innerHTML = guDong ;
        		 
        		 var br = document.createElement('br');
        		 
        		 var small_detail = document.createElement('small');
        		 small_detail.innerHTML = detail;
        		 
//        		 a.appendChild(strong_guDong);
//        		 a.appendChild(br);
//        		 a.appendChild(small_detail);
//        		 li.appendChild(a);
        		 
        		 li.appendChild(strong_guDong);
        		 li.appendChild(br);
        		 li.appendChild(small_detail);
        		 
        		 $("#ui-list-group").append(li);
        		 
        	 }
        	 
        	 i++;
         }
      
         if(searchResultCount != 0) {
        	 searchResultText.innerHTML = '(' + searchResultCount + '건' + ')';
        	 
         }
         
         
         j = 0;
         while(j < dongMarkers.length){
            temp = dongMarkers[j].title.split(" ");
            
            if(addressArray[3] == temp[2] || addressArray[0] == temp[2]){
                dong = temp[2];
            	//검색어가 DB에 저장된 동과 일치하면 요약리포트를 띄운다.
                globalMap.setOptions({ 'zoom' : 15 });
                $('#element_to_pop_up').bPopup();
                hideDongMarkers();
                hideConsumerMarkersMarkers();
                createConsumerMarkers(dongMarkers[j].title.split(' '));
                drawDongSummaryReport(dongMarkers[j].title.split(' '));
               
            }
            j++;
         }
         
         
      } else {
         alert('Geocode was not successful for the following reason: '
               + status);
      }
   });
   

}

//검색 결과 클릭 이벤트
$(document).on("click", "li.list-group-item", function() {
    var searchListArray =  ( incheon + ' ' + $(this).find("strong").text() + ' ' + $(this).find("small").text() ).split(' ');
    globalMap.setOptions({ 'zoom' : 15 });
    $('#element_to_pop_up').bPopup();
    drawConsumerReport(searchListArray);
});

function showLeakabnormalDongmarkers(){
	var i=0;
	hideDongMarkers();
	while(i<leakMarkers.length){
		leakMarkers[i].setMap(globalMap);
		i++;
	}
}

function showAbsenceabnormalDongmarkers(){
	var i=0;
	hideDongMarkers();
	while(i<absenceMarkers.length){
		leakMarkers[i].setMap(globalMap);
		i++;
	}
}
function showFreezedabnormalDongmarkers(){
	var i=0;
	hideDongMarkers();
	while(i<freezeMarkers.length){
		freezeMarkers[i].setMap(globalMap);
		i++;
	}
}
function showFatabnormalDongmarkers(){
	var i=0;
	hideDongMarkers();
	while(i<fatMarkers.length){
		fatMarkers[i].setMap(globalMap);
		i++;
	}
}
function showReverseabnormalDongmarkers(){
	var i=0;
	hideDongMarkers();
	while(i<reverseMarkers.length){
		reverseMarkers[i].setMap(globalMap);
		i++;
	}
}
function showBreakabnormalDongmarkers(){
	var i=0;
	hideDongMarkers();
	while(i<breakMarkers.length){
		breakMarkers[i].setMap(globalMap);
		i++;
	}
}
// Flag가 True인 아이콘을 출력.
function showIcon() {
	//초기에 모두 아이콘 초기화
	$('.color').css("background-color", "white");
	searchResultText.innerHTML= '';
	$("#ui-list-group").empty();
	
	
	if (leak_flag) {
		showLeakabnormalDongmarkers();
		$('#img_leak').css("background-color", "yellow");
	} 

	else if (absence_flag) {
		showAbsenceabnormalDongmarkers();
		$('#img_absence').css("background-color", "yellow");
	} 
	else if (freezed_flag) {
		showFreezedabnormalDongmarkers();
		$('#img_freeze').css("background-color", "yellow");
	} 
	
	else if (fat_flag) {
		showFatabnormalDongmarkers();
		$('#img_fat').css("background-color", "yellow");
	} 
	
	else if (reverse_flag) {
		showReverseabnormalDongmarkers();
		$('#img_reverse').css("background-color", "yellow");
	} 
	
	else if (break_flag) {
		showBreakabnormalDongmarkers();
		$('#img_break').css("background-color", "yellow");
	} 
	
	//모든 아이콘이 꺼져있을때
	else{
		showDongMarkers();
		$('.color').css("background-color", "white");
	}

}

function leak_clicked() {

	// 초기 리포트 페이지를 띄우고 초기 상태로 돌아감.
	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (leak_flag == false) {
		leak_flag = true;
		freezed_flag = false;
		fat_flag = false;
		absence_flag = false;
		break_flag = false;
		reverse_flag = false;


	} else {
		leak_flag = false;

	}

	showIcon();
}

// 동파 아이콘을 클릭했을때
function freezed_clicked() {
	
	// 초기 리포트 페이지를 띄우고 초기 상태로 돌아감.
	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (freezed_flag == false) {
		leak_flag = false;
		freezed_flag = true;
		fat_flag = false;
		absence_flag = false;
		break_flag = false;
		reverse_flag = false;

	} else {
		freezed_flag = false;

	}

	showIcon();
}

// 부재중 알림 아이콘을 클릭했을때
function absence_clicked() {

	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (absence_flag == false) {
		leak_flag = false;
		freezed_flag = false;
		fat_flag = false;
		absence_flag = true;
		break_flag = false;
		reverse_flag = false;
	} else {
		absence_flag = false;

	}

	showIcon();
}

function reverse_clicked() {
	
	// 초기 리포트 페이지를 띄우고 초기 상태로 돌아감.
	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (reverse_flag == false) {
		leak_flag = false;
		freezed_flag = false;
		fat_flag = false;
		absence_flag = false;
		break_flag = false;
		reverse_flag = true;

	} else {
		reverse_flag = false;
	}

	showIcon();
}
	


function fat_clicked() {
	
	// 초기 리포트 페이지를 띄우고 초기 상태로 돌아감.
	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (fat_flag == false) {
		leak_flag = false;
		freezed_flag = false;
		fat_flag = true;
		absence_flag = false;
		break_flag = false;
		reverse_flag = false;

	} else {
		fat_flag = false;
	}

	showIcon();
}
function break_clicked(){
	
	// 초기 리포트 페이지를 띄우고 초기 상태로 돌아감.
	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (break_flag == false) {
		leak_flag = false;
		freezed_flag = false;
		fat_flag = false;
		absence_flag = false;
		break_flag = true;
		reverse_flag = false;

	} else {
		break_flag = false;


	}

	showIcon();
}

function hide(){
	if((hidebutton%2)==0){
		$('#sidebar').hide();
		$('#hidebutton').css({left: '14.5em'});
		hidebutton++;
	}
	else{
		$('#sidebar').show();
		$('#hidebutton').css({left: '34.5em'});
		hidebutton++;
	}
	
}
/*================================================================================
 * @name: bPopup - if you can't get it up, use bPopup
 * @author: (c)Bjoern Klinggaard (twitter@bklinggaard)
 * @demo: http://dinbror.dk/bpopup
 * @version: 0.9.4.min
 ================================================================================*/
 (function(b){b.fn.bPopup=function(z,F){function K(){a.contentContainer=b(a.contentContainer||c);switch(a.content){case "iframe":var h=b('<iframe class="b-iframe" '+a.iframeAttr+"></iframe>");h.appendTo(a.contentContainer);r=c.outerHeight(!0);s=c.outerWidth(!0);A();h.attr("src",a.loadUrl);k(a.loadCallback);break;case "image":A();b("<img />").load(function(){k(a.loadCallback);G(b(this))}).attr("src",a.loadUrl).hide().appendTo(a.contentContainer);break;default:A(),b('<div class="b-ajax-wrapper"></div>').load(a.loadUrl,a.loadData,function(){k(a.loadCallback);G(b(this))}).hide().appendTo(a.contentContainer)}}function A(){a.modal&&b('<div class="b-modal '+e+'"></div>').css({backgroundColor:a.modalColor,position:"fixed",top:0,right:0,bottom:0,left:0,opacity:0,zIndex:a.zIndex+t}).appendTo(a.appendTo).fadeTo(a.speed,a.opacity);D();c.data("bPopup",a).data("id",e).css({left:"slideIn"==a.transition||"slideBack"==a.transition?"slideBack"==a.transition?g.scrollLeft()+u:-1*(v+s):l(!(!a.follow[0]&&m||f)),position:a.positionStyle||"absolute",top:"slideDown"==a.transition||"slideUp"==a.transition?"slideUp"==a.transition?g.scrollTop()+w:x+-1*r:n(!(!a.follow[1]&&p||f)),"z-index":a.zIndex+t+1}).each(function(){a.appending&&b(this).appendTo(a.appendTo)});H(!0)}function q(){a.modal&&b(".b-modal."+c.data("id")).fadeTo(a.speed,0,function(){b(this).remove()});a.scrollBar||b("html").css("overflow","auto");b(".b-modal."+e).unbind("click");g.unbind("keydown."+e);d.unbind("."+e).data("bPopup",0<d.data("bPopup")-1?d.data("bPopup")-1:null);c.undelegate(".bClose, ."+a.closeClass,"click."+e,q).data("bPopup",null);H();return!1}function G(h){var b=h.width(),e=h.height(),d={};a.contentContainer.css({height:e,width:b});e>=c.height()&&(d.height=c.height());b>=c.width()&&(d.width=c.width());r=c.outerHeight(!0);s=c.outerWidth(!0);D();a.contentContainer.css({height:"auto",width:"auto"});d.left=l(!(!a.follow[0]&&m||f));d.top=n(!(!a.follow[1]&&p||f));c.animate(d,250,function(){h.show();B=E()})}function L(){d.data("bPopup",t);c.delegate(".bClose, ."+a.closeClass,"click."+e,q);a.modalClose&&b(".b-modal."+e).css("cursor","pointer").bind("click",q);M||!a.follow[0]&&!a.follow[1]||d.bind("scroll."+e,function(){B&&c.dequeue().animate({left:a.follow[0]?l(!f):"auto",top:a.follow[1]?n(!f):"auto"},a.followSpeed,a.followEasing)}).bind("resize."+e,function(){w=y.innerHeight||d.height();u=y.innerWidth||d.width();if(B=E())clearTimeout(I),I=setTimeout(function(){D();c.dequeue().each(function(){f?b(this).css({left:v,top:x}):b(this).animate({left:a.follow[0]?l(!0):"auto",top:a.follow[1]?n(!0):"auto"},a.followSpeed,a.followEasing)})},50)});a.escClose&&g.bind("keydown."+e,function(a){27==a.which&&q()})}function H(b){function d(e){c.css({display:"block",opacity:1}).animate(e,a.speed,a.easing,function(){J(b)})}switch(b?a.transition:a.transitionClose||a.transition){case "slideIn":d({left:b?l(!(!a.follow[0]&&m||f)):g.scrollLeft()-(s||c.outerWidth(!0))-C});break;case "slideBack":d({left:b?l(!(!a.follow[0]&&m||f)):g.scrollLeft()+u+C});break;case "slideDown":d({top:b?n(!(!a.follow[1]&&p||f)):g.scrollTop()-(r||c.outerHeight(!0))-C});break;case "slideUp":d({top:b?n(!(!a.follow[1]&&p||f)):g.scrollTop()+w+C});break;default:c.stop().fadeTo(a.speed,b?1:0,function(){J(b)})}}function J(b){b?(L(),k(F),a.autoClose&&setTimeout(q,a.autoClose)):(c.hide(),k(a.onClose),a.loadUrl&&(a.contentContainer.empty(),c.css({height:"auto",width:"auto"})))}function l(a){return a?v+g.scrollLeft():v}function n(a){return a?x+g.scrollTop():x}function k(a){b.isFunction(a)&&a.call(c)}function D(){x=p?a.position[1]:Math.max(0,(w-c.outerHeight(!0))/2-a.amsl);v=m?a.position[0]:(u-c.outerWidth(!0))/2;B=E()}function E(){return w>c.outerHeight(!0)&&u>c.outerWidth(!0)}b.isFunction(z)&&(F=z,z=null);var a=b.extend({},b.fn.bPopup.defaults,z);a.scrollBar||b("html").css("overflow","hidden");var c=this,g=b(document),y=window,d=b(y),w=y.innerHeight||d.height(),u=y.innerWidth||d.width(),M=/OS 6(_\d)+/i.test(navigator.userAgent),C=200,t=0,e,B,p,m,f,x,v,r,s,I;c.close=function(){a=this.data("bPopup");e="__b-popup"+d.data("bPopup")+"__";q()};return c.each(function(){b(this).data("bPopup")||(k(a.onOpen),t=(d.data("bPopup")||0)+1,e="__b-popup"+t+"__",p="auto"!==a.position[1],m="auto"!==a.position[0],f="fixed"===a.positionStyle,r=c.outerHeight(!0),s=c.outerWidth(!0),a.loadUrl?K():A())})};b.fn.bPopup.defaults={amsl:50,appending:!0,appendTo:"body",autoClose:!1,closeClass:"b-close",content:"ajax",contentContainer:!1,easing:"swing",escClose:!0,follow:[!0,!0],followEasing:"swing",followSpeed:500,iframeAttr:'scrolling="no" frameborder="0"',loadCallback:!1,loadData:!1,loadUrl:!1,modal:!0,modalClose:!0,onClose:!1,onOpen:!1,opacity:0.7,position:["auto","auto"],positionStyle:"absolute",scrollBar:!0,speed:250,transition:"fadeIn",transitionClose:!1,zIndex:9997}})(jQuery);
