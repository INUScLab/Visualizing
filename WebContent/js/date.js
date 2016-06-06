function initDate () {
	var startDateFields = document.getElementById("sdate");
	var endDateFields = document.getElementById("edate");
	
	var sdate = new Date();
	var edate = new Date();
	sdate.setFullYear(2015, 1, 31);
	edate.setFullYear(2015, 02, 08);
	alert('sdate');
	alert('edate');
	
}

function formatChange(date)
{
    var yyyy = date.getFullYear().toString();
    var mm = (date.getMonth() + 1).toString();
    var dd = date.getDate().toString();

    return yyyy + "-"+(mm[1] ? mm : '0'+mm[0]) +"-"+ (dd[1] ? dd : '0'+dd[0]);
}