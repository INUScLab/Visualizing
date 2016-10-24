/*
 * var data = [
   		['한글', 'programmer'],
   		['되냐', '테스트좀bus driver'],
   		['Moo', 'Reindeer Hunter']
];
 */

console.log("test")
 
 
function download_csv() {
	console.log("test in download_csv")
	console.log(searchedData[1].avgconsume)
	
	var data = [];
	
	var csv = '번호, 수용가명, 지시부번호, 미터번호, 미터타입, 검침기간, 총사용량, 일수, 평균사용량\n';
	
	
	
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
	hiddenElement.download = 'people.csv';
	hiddenElement.click();
    
    
    
    
}