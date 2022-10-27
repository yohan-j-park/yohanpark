package chatt;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class ServerThread extends Thread {		//Thread에서 가장 중요한 객체 br,bw
	BufferedWriter bw;
	BufferedReader br;
	ServerMain main;
	
	public ServerThread(Socket s, ServerMain m) {
		this.main = m;
		
		try {		// InputStream보다 OutputStream을 먼저 만들어야 한다(자바의 오류 때문)
			OutputStream os = s.getOutputStream();
			OutputStreamWriter osw = new OutputStreamWriter(os);
			bw = new BufferedWriter(osw);
			
			InputStream is = s.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			br = new BufferedReader(isr);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void run() {		//client가 전달한 메세지를 수신
		
		while(true) {
			try {
				String msg = br.readLine();
				main.getTextArea().append(msg+"\n");
				// 스크롤바를 맨 하단으로 내리는 기능
				main.getTextArea().setCaretPosition(main.getTextArea().getText().length());
				
				// 모든 클라이언트에게 메시지 전달
				sendMsgAll(msg);
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
	}
	public void sendMsg(String msg) {
		try {
			bw.write(msg);
			bw.write("\n");
			bw.flush();		// 버퍼를 지워줌
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sendMsgAll(String msg) {
		for(ServerThread st : main.clients) {
			try {
				st.bw.write(msg);
				st.bw.write("\n");
				st.bw.flush();
				
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
	}
}
