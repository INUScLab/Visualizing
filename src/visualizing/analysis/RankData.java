package visualizing.analysis;

import java.util.ArrayList;

public class RankData {

   public ArrayList<ArrayList<String>> leak_rank; // 누수 랭킹
   public ArrayList<ArrayList<String>> freezed_rank; // 동파 랭킹
   public ArrayList<ArrayList<String>> fat_rank; // 비만관 랭킹
   public ArrayList<ArrayList<String>> breakage_rank; // 파손 랭킹
   public ArrayList<ArrayList<String>> reverse_rank; // 역류 랭킹
   public ArrayList<ArrayList<String>> absence_rank; // 부재 랭킹
   
   public ArrayList<ArrayList<String>> upper_leak_data; // 누수 상위 랭킹 한달 데이터
   public ArrayList<ArrayList<String>> upper_freezed_data; // 동파 상위 랭킹 한달 데이터
   public ArrayList<ArrayList<String>> upper_fat_data; // 비만관 상위 랭킹 한달 데이터
   public ArrayList<ArrayList<String>> upper_breakage_data; // 파손 상위 랭킹 한달 데이터
   public ArrayList<ArrayList<String>> upper_reverse_data; // 역류 상위 랭킹 한달 데이터
   public ArrayList<ArrayList<String>> upper_absence_data; // 부재 상위 랭킹 한달 데이터
   
   public ArrayList<ArrayList<String>> consumed_rank; // 사용량 랭킹
   public ArrayList<ArrayList<String>> upper_consumed_data; // 사용량 상위 랭킹 한달 데이터
   public ArrayList<ArrayList<String>> predicted_consumed_rank; // 사용량 예측량 차이 랭킹
   public ArrayList<ArrayList<String>> upper_predicted_consumed_data; // 사용량 상위 랭킹 한달 데이터
   public ArrayList<ArrayList<String>> count; // 지역 인구수

   
   /*
   public ArrayList<ArrayList<String>> getTest() {
      return consumed_rank;
   }
   public void setTest(ArrayList<ArrayList<String>> consumed) {
      this.consumed_rank = consumed_rank;
   }*/
   public ArrayList<ArrayList<String>> getUpper_consumed_data() {
      return upper_consumed_data;
   }
   public void setUpper_consumed_data(ArrayList<ArrayList<String>> upper_consumed_data) {
      this.upper_consumed_data = upper_consumed_data;
   }
   public ArrayList<ArrayList<String>> getUpper_predicted_consumed_data() {
	  return upper_predicted_consumed_data;
   }
   public void setUpper_predicted_consumed_data(ArrayList<ArrayList<String>> upper_predicted_consumed_data) {
	  this.upper_predicted_consumed_data = upper_predicted_consumed_data;
   }
   
   
   
   public ArrayList<ArrayList<String>> getLeak_rank() {
      return leak_rank;
   }
   public void setLeak_rank(ArrayList<ArrayList<String>> leak_rank) {
      this.leak_rank = leak_rank;
   }
   public ArrayList<ArrayList<String>> getFreezed_rank() {
      return freezed_rank;
   }
   public void setFreezed_rank(ArrayList<ArrayList<String>> freezed_rank) {
      this.freezed_rank = freezed_rank;
   }
   public ArrayList<ArrayList<String>> getFat_rank() {
      return fat_rank;
   }
   public void setFat_rank(ArrayList<ArrayList<String>> fat_rank) {
      this.fat_rank = fat_rank;
   }
   public ArrayList<ArrayList<String>> getBreakage_rank() {
      return breakage_rank;
   }
   public ArrayList<ArrayList<String>> getConsumed_rank() {
	  return consumed_rank;
   }
   public ArrayList<ArrayList<String>> getPredictedConsumed_rank() {
	   return predicted_consumed_rank;
   }
   
   
   public void setBreakage_rank(ArrayList<ArrayList<String>> breakage_rank) {
      this.breakage_rank = breakage_rank;
   }
   
   public ArrayList<ArrayList<String>> getReverse_rank() {
      return reverse_rank;
   }
   public void setReverse_rank(ArrayList<ArrayList<String>> reverse_rank) {
      this.reverse_rank = reverse_rank;
   }
   public ArrayList<ArrayList<String>> getAbsence_rank() {
      return absence_rank;
   }
   public void setAbsence_rank(ArrayList<ArrayList<String>> absence_rank) {
      this.absence_rank = absence_rank;
   }
   public void setConsumed_rank(ArrayList<ArrayList<String>> consumed_rank) {
	  this.consumed_rank = consumed_rank;
   }
   public void setPredictedConsumed_rank(ArrayList<ArrayList<String>> predicted_consumed_rank) {
	   this.predicted_consumed_rank = predicted_consumed_rank;
   }
   public void setCount(ArrayList<ArrayList<String>> count) {
	   this.count = count;
   }
   public ArrayList<ArrayList<String>> getCount() {
      return count;
   }
   
   
   public ArrayList<ArrayList<String>> getUpper_leak_data() {
      return upper_leak_data;
   }
   public void setUpper_leak_data(ArrayList<ArrayList<String>> upper_leak_data) {
      this.upper_leak_data = upper_leak_data;
   }
   public ArrayList<ArrayList<String>> getUpper_freezed_data() {
      return upper_freezed_data;
   }
   public void setUpper_freezed_data(ArrayList<ArrayList<String>> upper_freezed_data) {
      this.upper_freezed_data = upper_freezed_data;
   }
   public ArrayList<ArrayList<String>> getUpper_fat_data() {
      return upper_fat_data;
   }
   public void setUpper_fat_data(ArrayList<ArrayList<String>> upper_fat_data) {
      this.upper_fat_data = upper_fat_data;
   }
   public ArrayList<ArrayList<String>> getUpper_breakage_data() {
      return upper_breakage_data;
   }
   public void setUpper_breakage_data(ArrayList<ArrayList<String>> upper_breakage_data) {
      this.upper_breakage_data = upper_breakage_data;
   }
   public ArrayList<ArrayList<String>> getUpper_reverse_data() {
      return upper_reverse_data;
   }
   public void setUpper_reverse_data(ArrayList<ArrayList<String>> upper_reverse_data) {
      this.upper_reverse_data = upper_reverse_data;
   }
   public ArrayList<ArrayList<String>> getUpper_absence_data() {
	  return upper_absence_data;
   }
   public void setUpper_absence_data(ArrayList<ArrayList<String>> upper_absence_data) {
	  this.upper_absence_data = upper_absence_data;
   }

   
   
}