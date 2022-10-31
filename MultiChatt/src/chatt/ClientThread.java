package chatt;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ClientThread extends Thread{
	ClientMain main;
	BufferedWriter bw;
	BufferedReader br;
	Socket socket;
<<<<<<< HEAD
	boolean flag = true;
=======
	boolean flag=true;
>>>>>>> 2844728828a9b07eb25cf7e35b6407c017d97107
	
	public ClientThread(Socket s, ClientMain m) {
		this.main = m;
		this.socket =s;
		try {
			OutputStreamWriter osw = new OutputStreamWriter(s.getOutputStream());
			bw = new BufferedWriter(osw);
			
			InputStreamReader isr = new InputStreamReader(s.getInputStream());
			br = new BufferedReader(isr);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public void run() {
		JSONParser parser = new JSONParser();
		flag=true;
		
		//서버에게 자신의 login 사실을 전달
		JSONObject loginObj = new JSONObject();
		loginObj.put("user", main.getTfUser().getText());
		loginObj.put("command", ServerMain.LOGIN);
		loginObj.put("message", "나야~ 나...");
		try {
			bw.write(loginObj.toJSONString());
			bw.write("\n");
			bw.flush();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		
		while(flag) {
			try {
<<<<<<< HEAD
				String msg = br.readLine();		//blocking mode
				if(msg == null) break;
				String u = "";
				
				JSONObject obj = (JSONObject)parser.parse(msg);
				if(!obj.get("message").equals("")){
				main.getTextArea().append(obj.get("user")+ " : ");
				main.getTextArea().append(obj.get("message")+"\n");
				}
				main.getTextArea().setCaretPosition(main.getTextArea().getText().length());
=======
				String msg = br.readLine();
				System.out.println(msg);
				if(msg == null) break;
				String u = "";
				
				JSONObject obj = (JSONObject)parser.parse(msg);
				
				main.getTextArea().append(obj.get("user")+" : ");
				main.getTextArea().append(obj.get("message")+"\n");
>>>>>>> 2844728828a9b07eb25cf7e35b6407c017d97107
				
				main.getTextArea()
					.setCaretPosition(main.getTextArea().getText().length());
				
				Long  o = (Long)obj.get("command");
				
				switch(o.intValue()) {
				case ServerMain.SERVER_STOP:
					flag=false;
					break;
				case ServerMain.USERS:	
					JSONArray array = (JSONArray)obj.get("data");
					if(array == null) break;
					main.userListModel.clear();
<<<<<<< HEAD
					for(Object ob : array) {
						main.userListModel.addElement((String)ob);
//						main.users.add((String)ob); 에서 바뀜
					}
					break;

				case ServerMain.LOGIN:
					u = (String)obj.get("user");
					main.userListModel.addElement(u);
					break;
				
=======
					for(Object ob : array) {	
						main.userListModel.addElement((String)ob);
//						main.users.add(ob)에서 바뀜
					}
					break;
				case ServerMain.LOGIN:
					u = (String)obj.get("user");
					main.userListModel.addElement(u);
					break;
>>>>>>> 2844728828a9b07eb25cf7e35b6407c017d97107
				case ServerMain.LOGOUT:
					u = (String)obj.get("user");
					main.userListModel.removeElement(u);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		try {
			br.close();
			bw.close();
			socket.close();
			
			main.getBtnConnect().setEnabled(true);
			main.getBtnDisconnect().setEnabled(false);
			main.getBtnSend().setEnabled(false);
			main.getBtnWhisper().setEnabled(false);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void sendMsg(String msg) {
		try {
			JSONObject obj = new JSONObject();
			obj.put("user", main.getTfUser().getText());
			obj.put("command", ServerMain.MESSAGE);
			obj.put("message", msg);
			bw.write(obj.toJSONString());
			bw.write("\n");
			bw.flush();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
<<<<<<< HEAD
	public void sendWhisper(List<String> users, String msg) {	// List import할 때 java.awt.List(JList)로 되지 않게 주의
		try {
		JSONObject obj = new JSONObject();
		obj.put("user", main.getTfUser().getText());
		obj.put("command", ServerMain.WHISPER);
		obj.put("message", msg);
		// sendMsg에다가 List라는 Object를 추가하는 기능을 추가
		obj.put("users", users);	// 배열[  ] 구조인 List를 map구조인 JSONObject에 Value로 넣는다
		
		bw.write(obj.toJSONString());
		bw.write("\n");
		bw.flush();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
=======
>>>>>>> 2844728828a9b07eb25cf7e35b6407c017d97107
}
