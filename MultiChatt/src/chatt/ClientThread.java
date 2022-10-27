package chatt;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class ClientThread extends Thread{
	ClientMain main;
	BufferedWriter bw;
	BufferedReader br;
	
	public ClientThread(Socket s, ClientMain m) {
		this.main = m;
		
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
		while(true) {
			try {
				String msg = br.readLine();		//blocking mode
				main.getTextArea().append(msg+"\n");
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
}
