package visualizing.read;

public class ReadData {
	public String code; // 수용가 번호
	public String detail; // 수용가명
	public String number; // 지시부 번호
	public String meter_num; // 미터 번호
	public String meter_type; // 미터 타입
	public String meter_status; // 미터 상태
	public String date; // 검침일
	public String consumed; // 검침값
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getMeter_num() {
		return meter_num;
	}
	public void setMeter_num(String meter_num) {
		this.meter_num = meter_num;
	}
	public String getMeter_type() {
		return meter_type;
	}
	public void setMeter_type(String meter_type) {
		this.meter_type = meter_type;
	}
	public String getMeter_status() {
		return meter_status;
	}
	public void setMeter_status(String meter_status) {
		this.meter_status = meter_status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getConsumed() {
		return consumed;
	}
	public void setConsumed(String consumed) {
		this.consumed = consumed;
	}
}
