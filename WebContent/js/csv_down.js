// Convert a hex string to a byte array
function hexToBytes(hex) {
    for (var bytes = [], c = 0; c < hex.length; c += 2)
    bytes.push(parseInt(hex.substr(c, 2), 16));
    return bytes;
}
 
function download_csv_analysis(pageName) {
	//console.log(searchedData[1].avgconsume)
	
	var data = [];
	
	var csv = '번호, 수용가명, 지시부번호, 미터번호, 미터타입, 검침기간, 총사용량, 일수, 평균사용량\n';
	
	var form1 = $('#search_form').serialize();
	var fileDatas1 = form1.split('&');
	console.log(fileDatas1);
	var form2 = $('#pagePassF').serialize();
	var fileDatas2 = form2.split('&');
	
	
	var fileData = fileDatas2[5].split('=')
	console.log(fileData[0] + ': ' + fileData[1]);
	
	console.log(fileDatas2);
	//si gugun umdong sdate edate consumerNum consumerName telNumber meterNum 순서
	console.log(fileDatas2);
	var fileName = pageName + '_';
	fileName += fileDatas1[3].split('=')[1] + '_' + fileDatas1[4].split('=')[1] + '_';
	fileName += fileDatas1[0].split('=')[1] + '_' + fileDatas1[1].split('=')[1] + '_' + fileDatas1[2].split('=')[1] + '_' + fileDatas1[6].split('=')[1];
	console.log(decodeURIComponent(fileName));

/*
	for (i=5; i<fileDatas2.length; i++){
		var fileData = fileDatas2[i].split('=')
		console.log(fileData[0] + ': ' + fileData[1]);
		if (fileData[1] != "")
			fileName += '_' + fileData[1];
		else
			fileName += '_전체' ;
	}
	*/
	fileName = decodeURIComponent(fileName);
	
	//console.log(fileName);
	//console.log(fileDatas2);
	
	for(i=0; i<searchedData.length ; i++){
		var indata = [];
		indata.push(searchedData[i].code)  //번호
		indata.push(searchedData[i].detail) //수용가명
		indata.push(searchedData[i].number) //지시부번호
		indata.push(searchedData[i].meternum) // 미터번호
		indata.push(searchedData[i].metertype) // 미터타입
		indata.push(searchedData[i].term) // 검침기간
		indata.push(searchedData[i].consume) //총사용량
		indata.push(searchedData[i].count) //일수
		indata.push(searchedData[i].avgconsume) // 일 평균 사용량
		data.push(indata)
	}
	

	var csv = '번호,수용가명,지시부번호,미터번호,미터타입,검침기간,총사용량,일수,평균사용량\n';
	data.forEach(function(row) {

		csv += row.join(',');
    	csv += "\n";
	});
 
	var hiddenElement = document.createElement('a');
	hiddenElement.href = 'data:text/csv;charset=utf-8,%EF%BB%BF' + encodeURI(csv);
	hiddenElement.target = '_blank';
	hiddenElement.download = fileName + '.csv';
	hiddenElement.click();
    
}

function download_csv_reportDay(pageName){
	var data = [];
	var csv = '번호,수용가명,지시부번호,미터번호,미터타입,검침월,사용량,01일,02일,03일,04일,05일,06일,07일,08일,09일,10일,11일,12일,13일,14일,15일,16일,17일,18일,19일,20일,21일,22일,23일,24일,25일,26일,27일,28일,29일,30일,31일\n';
	
	for(i=0; i<searchedData.length ; i++){
		var indata = [];
		indata.push(searchedData[i].code)  //번호
		indata.push(searchedData[i].detail) //수용가명
		indata.push(searchedData[i].number) //지시부번호
		indata.push(searchedData[i].meternum) // 미터번호
		indata.push(searchedData[i].metertype) // 미터타입
		indata.push(searchedData[i].term) // 검침기간
		indata.push(searchedData[i].consume) //총사용량
		indata.push(searchedData[i].day1)
		indata.push(searchedData[i].day2)
		indata.push(searchedData[i].day3)
		indata.push(searchedData[i].day4)
		indata.push(searchedData[i].day5)
		indata.push(searchedData[i].day6)
		indata.push(searchedData[i].day7)
		indata.push(searchedData[i].day8)
		indata.push(searchedData[i].day9)
		indata.push(searchedData[i].day10)
		indata.push(searchedData[i].day11)
		indata.push(searchedData[i].day12)
		indata.push(searchedData[i].day13)
		indata.push(searchedData[i].day14)
		indata.push(searchedData[i].day15)
		indata.push(searchedData[i].day16)
		indata.push(searchedData[i].day17)
		indata.push(searchedData[i].day18)
		indata.push(searchedData[i].day19)
		indata.push(searchedData[i].day20)
		indata.push(searchedData[i].day21)
		indata.push(searchedData[i].day22)
		indata.push(searchedData[i].day23)
		indata.push(searchedData[i].day24)
		indata.push(searchedData[i].day25)
		indata.push(searchedData[i].day26)
		indata.push(searchedData[i].day27)
		indata.push(searchedData[i].day28)
		indata.push(searchedData[i].day29)
		indata.push(searchedData[i].day30)
		indata.push(searchedData[i].day31)
		data.push(indata)
	}
	
	data.forEach(function(row) {
		csv += row.join(',');
    	csv += "\n";
	});
	
	
	var form1 = $('#search_form').serialize();
	var fileDatas1 = form1.split('&');
	
	console.log(fileDatas1);
	/*console.log(fileDatas1);
	console.log(fileDatas1[3].split('=')[1]);
	console.log(decodeURIComponent(fileDatas1[6].split('=')[1]))
	*/
	
	var form2 = $('#pagePassF').serialize();
	var fileDatas2 = form2.split('&');
	console.log(fileDatas2);
	var fileName = pageName + '_';
	
	fileName += fileDatas1[3].split('=')[1] + '_' + fileDatas1[4].split('=')[1] + '_' + fileDatas1[0].split('=')[1] + '_' + fileDatas1[1].split('=')[1] + '_' + fileDatas1[2].split('=')[1] + '_' + fileDatas1[6].split('=')[1];
	//console.log()
	//fileName += fileDatas1[0].split('=')[1] + '_' + fileDatas1[1].split('=')[1] + '_' + fileDatas1[2].split('=')[1];

/*
	for (i=5; i<fileDatas2.length; i++){
		var fileData = fileDatas2[i].split('=')
		console.log(fileData[0] + ': ' + fileData[1]);
		if (fileData[1] != "")
			fileName += '_' + fileData[1];
		else
			fileName += '_전체' ;
	}
	*/
	fileName = decodeURIComponent(fileName);
	
	
	var hiddenElement = document.createElement('a');
	hiddenElement.href = 'data:text/csv;charset=utf-8,%EF%BB%BF' + encodeURI(csv);
	hiddenElement.target = '_blank';
	hiddenElement.download = fileName+'.csv';
	hiddenElement.click();
}

function download_csv_reportMonth(pageName){
	var data = [];
	var csv = '번호,수용가명,지시부번호,미터번호,미터타입,검침월,사용량,01월,02월,03월,04월,05월,06월,07월,08월,09월,10월,11월,12월\n';
	
	for(i=0; i<searchedData.length ; i++){
		var indata = [];
		indata.push(searchedData[i].code)  //번호
		indata.push(searchedData[i].detail) //수용가명
		indata.push(searchedData[i].number) //지시부번호
		indata.push(searchedData[i].meternum) // 미터번호
		indata.push(searchedData[i].metertype) // 미터타입
		indata.push(searchedData[i].term) // 검침기간
		indata.push(searchedData[i].consume) //총사용량
		indata.push(searchedData[i].month1)
		indata.push(searchedData[i].month2)
		indata.push(searchedData[i].month3)
		indata.push(searchedData[i].month4)
		indata.push(searchedData[i].month5)
		indata.push(searchedData[i].month6)
		indata.push(searchedData[i].month7)
		indata.push(searchedData[i].month8)
		indata.push(searchedData[i].month9)
		indata.push(searchedData[i].month10)
		indata.push(searchedData[i].month11)
		indata.push(searchedData[i].month12)
		data.push(indata)
	}
	
	data.forEach(function(row) {
		csv += row.join(',');
    	csv += "\n";
	});
	
	
	var form1 = $('#search_form').serialize();
	var fileDatas1 = form1.split('&');
	/*console.log(fileDatas1);
	console.log(fileDatas1[3].split('=')[1]);
	console.log(decodeURIComponent(fileDatas1[6].split('=')[1]))
	*/
	
	var form2 = $('#pagePassF').serialize();
	var fileDatas2 = form2.split('&');
	console.log(fileDatas1);
	var fileName = pageName + '_';
	fileName += fileDatas1[3].split('=')[1] + '_' + fileDatas1[0].split('=')[1] + '_' + fileDatas1[1].split('=')[1] + '_' + fileDatas1[2].split('=')[1] + '_' + fileDatas1[5].split('=')[1];

	
	//fileName += fileDatas1[3].split('=')[1] + '_' + fileDatas1[4].split('=')[1] + '_'+ fileDatas1[5].split('=')[1];
	//fileName += fileDatas1[0].split('=')[1] + '_' + fileDatas1[1].split('=')[1] + '_' + fileDatas1[2].split('=')[1];

/*
	for (i=5; i<fileDatas2.length; i++){
		var fileData = fileDatas2[i].split('=')
		console.log(fileData[0] + ': ' + fileData[1]);
		if (fileData[1] != "")
			fileName += '_' + fileData[1];
		else
			fileName += '_전체' ;
	}
	*/
	fileName = decodeURIComponent(fileName);
	
	var hiddenElement = document.createElement('a');
	hiddenElement.href = 'data:text/csv;charset=utf-8,%EF%BB%BF' + encodeURI(csv);
	hiddenElement.target = '_blank';
	hiddenElement.download = fileName+'.csv';
	hiddenElement.click();
}