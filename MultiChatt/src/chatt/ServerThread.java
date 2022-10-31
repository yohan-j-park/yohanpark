package chatt;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class ServerThread extends Thread {		//Thread에서 가장 중요한 객체 br,bw
	String user;
	BufferedWriter bw;
	BufferedReader br;
	ServerMain main;
	Socket socket;
	boolean flag;
	
	public ServerThread(Socket s, ServerMain m) {
		this.socket = s;
		this.main = m;
		
		try {		// InputStream보다 OutputStream을 먼저 만들어야 한다(자바의 오류 때문)
			OutputStream os = s.getOutputStream();	// 바이트단위 출력 최상위 클래스 
			OutputStreamWriter osw = new OutputStreamWriter(os);	//문자단위 출력을 위한 하위 스트림 클래스 : 바이트 단위로 읽어들인 데이터를 문자로 변환
			bw = new BufferedWriter(osw);	//바이트단위 출력을 위한 하위 스트림 클래스 : 문자열을 처리할 수 있음
			
			InputStream is = s.getInputStream();	//바이트단위 입력 최상위 클래스
			InputStreamReader isr = new InputStreamReader(is);		//문자단위 입력을 위한 하위 스트림 클래스 : 바이트 단위로 읽어들인 데이터를 문자로 변환
			br = new BufferedReader(isr);	//바이트단위 입력	을 위한 하위 스트림 클래스 : 문자열을 처리할 수 있음
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void run() {		//client가 전달한 메세지를 수신
		JSONParser parser = new JSONParser();
		flag = true;		
		while(flag) {
			try {
				String msg = br.readLine();		// 서버스레드의 readLine은 서버랑 1:1로 연결되어있는 클라이언트1과 통신
				 // readLine(): 줄단위로 읽어오면서 개행기호 빼고 읽어온것 println 해주어야함
				
				JSONObject obj = (JSONObject)parser.parse(msg);
				main.getTextArea().append(obj.get("user")+ " : ");
				main.getTextArea().append(obj.get("message")+"\n");
				// 스크롤바를 맨 하단으로 내리는 기능
				main.getTextArea().setCaretPosition(main.getTextArea().getText().length());
				
				// 모든 클라이언트에게 메시지 전달
//				sendMsgAll(msg);
				
				Long o = (Long)obj.get("command");				
				switch(o.intValue()) {	// static이 아니며 Integer 객체에서 int형 값을 뽑아내는 메소드이다 
				
				case ServerMain.LOGIN:
					String u = (String)obj.get("user");
					this.user = u;
					
					
					// 자기 자신에게 users에 저장된 모든 목록을 전송
					if(main.userListModel.size()>0) {
					JSONObject usersObj = new JSONObject();
					usersObj.put("command",ServerMain.USERS);
					usersObj.put("user","server");
					usersObj.put("message", u + "님이 접속함");
					
					Object[] array = main.userListModel.toArray();
					Vector<String> userVector = new Vector(Arrays.asList(array));
					usersObj.put("data", userVector);	//접속자 명단
					sendMsg(usersObj);
					
					}

					//접속된 모든 유저에게 신규유저의 아이디를 전송
					JSONObject newObj = new JSONObject();
					newObj.put("command", ServerMain.LOGIN);
					newObj.put("user", u);
					newObj.put("message", u + "님이 접속함");
					
					sendMsgAll(newObj);
					
					//서버 자신을 JList에 추가
					main.userListModel.addElement(u);
					
					break;
				
				case ServerMain.LOGOUT:
					main.clients.remove(this);
					main.userListModel.removeElement(user);
					flag = false;
					sendMsgAll(obj);
					break;
					
				case ServerMain.WHISPER:
					sendWhisper(obj);
					break;
					
				default:
					sendMsgAll(obj);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				JSONObject obj = new JSONObject();
				obj.put("user", "server");
				obj.put("command", ServerMain.SERVER_STOP);
				obj.put("message", "서버에 예기치 않은 오류가 발생");
				sendMsg(obj);
				flag = false;
			}
		}
		
		try {
			br.close();
			bw.close();
			socket.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void sendMsg(JSONObject obj) {
		try {
			bw.write(obj.toJSONString());
			bw.write("\n");
			bw.flush();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	
		
	public void sendMsgAll(JSONObject obj) {
		for(ServerThread st : main.clients) {
			if(st.isAlive()) {

				try {
					st.bw.write(obj.toJSONString());
					st.bw.write("\n");
					st.bw.flush();
					
				} catch (IOException e) {
					
					e.printStackTrace();
				}
				
			}
		}
	}
	
	public void sendWhisper(JSONObject obj) {
		List<String> receiveUser = (List) obj.get("users");
		if(receiveUser == null) return;
		for(ServerThread st : main.clients) {	//서버메인에서 클라이언트들을 하나씩 가져와 서버스레드에 넣는다
			if(receiveUser.contains(st.user) && st.isAlive()) {

				try {
					st.bw.write(obj.toJSONString());
					st.bw.write("\n");
					st.bw.flush();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
	}
}
