package json;

import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonExam {
	public void stringToJSON() throws Exception {
		System.out.println("1번문제");
		String score = "[44,33,55,65,78]";
		int sum = 0;
		int avg = 0;
		JSONParser jParser = new JSONParser();
		Object o = jParser.parse(score);
		JSONArray jArray = (JSONArray)o;
		for(int i=0; i<jArray.size(); i++) {
			Long s = (Long)jArray.get(i);
			sum += s;
			avg = sum/jArray.size();
		}
		System.out.println("평균: " + avg);
	
	//---------------------------------------------
	 System.out.println("-".repeat(20));
	 System.out.println("2번문제");
	 
	 String score1 = "{'id':'hong', 'name':'길동', 'phone':'010-2222'}"; 
	 score1 = score1.replace("'" , "\"");
	 JSONObject jObject = (JSONObject)jParser.parse(score1);
	 System.out.println("id: "  + jObject.get("id"));
	 System.out.println("name: "  + jObject.get("name"));
	 System.out.println("phone: "  + jObject.get("phone"));
	
	
	//---------------------------------------------
	 System.out.println("-".repeat(20));
	 System.out.println("3번문제");
	 String member = "[{ '담임' : '홍', '학생':['김', '이', '박']},"
				+ "{ '담임' : '김', '학생':['남','최']},"
				+ "{ '담임' : '남', '학생':['김','가','나','마','사','이']}]";
	 member = member.replace("'", "\"");
	 jArray = (JSONArray)jParser.parse(member);
	 System.out.println(jArray);
	 int hap = 0;

	 for(int i=0; i<jArray.size(); i++) {
		jObject = (JSONObject)jArray.get(i);
		JSONArray jArray2 = (JSONArray)jObject.get("학생");
		
		
		System.out.println(jArray2);

		for(int j=1; j<=jArray2.size(); j++) {
			hap=j;
			
		}
		System.out.println( "학생 수: " + hap + "명");
	 }
	 
//	 for(Object o2 : jArray) {
//		 JSONObject job = (JSONObject)o2;
//		 System.out.println("담임 : " + job.get("담임") + "  학생 : " + job.get("학생"));
//	
//	 }
	 
	 //---------------------------------------------
//	 System.out.println("-".repeat(20));
//	 System.out.println("4. ");
//	 String jsonListMap = "[{'name':'hong' , 'addr':'seoul'},{'name':'kim' , 'addr':'busan'}]";
//	 jsonListMap = jsonListMap.replace("'", "\"");
//	 jArray = (JSONArray)jParser.parse(jsonListMap);
//	 for(Object o2 : jArray) {
//		 JSONObject job = (JSONObject)o2;
//		 System.out.println("name : " + job.get("name"));
//		 System.out.println("addr : " + job.get("addr"));
//	 }
	 
	 //---------------------------------------------
//	 System.out.println("-".repeat(20));
//	 jsonString = "{'names' : ['a','b','c','d']}";
//	 jsonString = jsonString.replace("'", "\"");
//	 jObject = (JSONObject)jParser.parse(jsonString);
//	 Object value = jObject.get("names");
//	 jArray = (JSONArray)value;
//	 for(Object ob : jArray) {
//		 System.out.println(ob);
//	 }
	 
	 //---------------------------------------------
//	 System.out.println("-".repeat(20));
//	 jsonString = "[{'names' : ['a','b','c']} , {'ages' :[5,6,7]}]";
//	 jsonString = jsonString.replace("'","\"");
//	 jArray = (JSONArray)jParser.parse(jsonString);
//	 System.out.println(jArray.toJSONString());
//	 for(int i=0; i<jArray.size(); i++){
//		 jObject = (JSONObject)jArray.get(i);
//		 Iterator<String> iter = jObject.keySet().iterator();// 반환형 set구조 
//		 while(iter.hasNext()) {
//			 String key = (String)iter.next(); // 배열마다 가지고 있는 key의 개수가 다를 수도 있기 때문
//			 JSONArray values = (JSONArray)jObject.get(key);
//			 System.out.println(values.toJSONString());
//		 }
//	 } // 첨자가 필요 없을 때
//	 for(Object ob : jArray) { 
//		 
//	 } // 첨자가 필요할 때
}
	public static void main(String[] args){
		JsonExam je = new JsonExam();
		
		try {
			je.stringToJSON();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
}
