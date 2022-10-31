package chatt;
import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;
import java.util.Vector;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;
import javax.swing.event.MenuKeyEvent;

import org.json.simple.JSONObject;

public class ServerMain extends JFrame {
	ServerSocket server;
	Vector<ServerThread> clients = new Vector<ServerThread>();	// 동적 배열, 접속한 클라이언트의 정보를 실시간으로 저장하는 목적
	boolean flagServer = true;
	DefaultListModel userListModel = new DefaultListModel<String>();

	//	Vector<String> users = new Vector<String>();	// 동적 배열, 접속한 클라이언트의 정보를 실시간으로 저장하는 목적
	
	// JSON에서 정수는 모두 long타입이다.
	final static int SERVER_START = 1;		//정석
	final static int SERVER_STOP = 2;		// 상수는 카멜타입을 사용할 수 없고 _를 사용한다
	final static int LOGIN = 3;
	final static int LOGOUT = 4;
	final static int MESSAGE = 5;
	final static int USERS = 6;				// 유저들의 명단
	final static int WHISPER = 7;			// 귓속말
	

	private JPanel contentPane;
	private JTextField tfIp;
	private JButton btnStart;
	private JButton btnStop;
	private JLabel lblNewLabel_1;
	private JScrollPane scrollPane;
	private JList list;
	private JLabel lblNewLabel_2;
	private JScrollPane scrollPane_1;
	private JTextArea textArea;
	private JButton btnSend;
	private JButton btnWhisper;
	private JLabel lblNewLabel_3;
	private JTextField tfMessage;
	private JList list_1;
	

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ServerMain frame = new ServerMain();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}


	public void start() {	//클라이언트 접속할 때 까지 아무런 동작도 할 수 없다. deadlock상태, 그래서 멀티스레드인 Thread클래스가 필요하다

		try {
			Thread t = new Thread(new Runnable() {		// cpu는 cpu대로 ui는 ui대로 일한다
				
				
				public void run() {		//Runnable 인터페이스 run()메소드 오버라이딩
					try {
						textArea.append("서버가 시작되었습니다.\n");
						btnStart.setEnabled(false);
						btnStop.setEnabled(true);
						btnSend.setEnabled(true);
						btnWhisper.setEnabled(true);
						server = new ServerSocket(6666);
						
						flagServer = true;	
						//while문이 돌기 전에 true로 놓는 이유는 flagServer를 중지시켰다가 다시 실행 할 경우를 생각해서
						while(flagServer) {
							Socket socket = server.accept();	
							// server.accept(): blocking모드/ accept()가 호출되면 프로그램은 실행을 멈추고 클라이언트 포크가
							// 6666번으로 연결할 때 까지 대기한다. 클라이언트가 연결되면 accept()메소드는 Scoket객체를 반환한다.
							if(flagServer) {
							//blocking을 해제하지 않고 종료하면 서버가 폭주함
							// 스레드를 만들지 않으면 클라이언트가 들어올 때 까지 아무것도 못함..
								ServerThread st = new ServerThread(socket, ServerMain.this);
								st.start();		// 멀티스레드로 동작,
								clients.add(st);
							}
						}
						
						for(ServerThread st : clients) {
							st.br.close();
							st.bw.close();
							st.socket.close();
						}
						//clients.remove(st) : 강퇴시킬 client찾아서 remove하면 강퇴다
						clients.clear();
						server.close();
						userListModel.clear();
						
						
					} catch (IOException e) {
						
						e.printStackTrace();
					}
					
				}
			});
			t.start();		// 스레드 생성  Thread의 start()메소드를 호출하면 run()메소드가 실행된다.

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void stop() {
		// 1) 접속 된 모든 클라이언트들에게 서버 중지 사실을 알린다.
		try {
			JSONObject jData = new JSONObject(); 	
			jData.put("user", "server");
			jData.put("command", SERVER_STOP);
			jData.put("message", "서버가 중지되었습니다.");
			
			for(ServerThread st : clients) {
				st.bw.write(jData.toJSONString());
				st.bw.write("\n");
				st.bw.flush();
			}

		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 2) 버튼들을 토클
		btnStart.setEnabled(true);
		btnStop.setEnabled(false);
		btnSend.setEnabled(false);
		btnWhisper.setEnabled(false);
		
		// 3) 서버를 중지하기 위한 가상의 클라이언트로 접속
		flagServer = false;		// -> Thread의 while문이 돌지 않게 됨
		try {
			Socket tempSocket = new Socket("127.0.0.1", 6666);	// accept 해제 127.~ : localhost
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void send() {
		String msg = tfMessage.getText();
		
		JSONObject obj = new JSONObject();
		obj.put("user", "server");
		obj.put("command", ServerMain.MESSAGE);
		obj.put("message", msg);
		
		textArea.append(msg+ "\n");
		textArea.setCaretPosition(textArea.getText().length());
		
		for(ServerThread st : clients) {
			try {
				st.bw.write(obj.toJSONString());
				st.bw.write("\n");
				st.bw.flush();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void sendWhisper() {
		String msg = tfMessage.getText();
		
		JSONObject obj = new JSONObject();
		obj.put("user", "server");
		obj.put("command", ServerMain.WHISPER);
		obj.put("message", msg);
		
		textArea.append(msg + "\n");
		textArea.setCaretPosition(textArea.getText().length());
		
		// 데이터를 보내는 부분
		
		List<String> receiveUsers = getList().getSelectedValuesList();
		// JList에서 참여자 aa나 bb등 귓속말을 보낼 유저'들'을 선택 -> SelectedValue's'List라서.
		
		for(ServerThread st : clients){
			if(!receiveUsers.contains(st.user)) continue;
			// 선택한 유저가 st의 user('현재 접속중인' list에 포함되어 있지 않으면 다시 for문을 돌린다.
			
			try {
				st.bw.write(obj.toJSONString());
				st.bw.write("\n");
				st.bw.flush();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public ServerMain() {
		setTitle("멀티 채팅 서버");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1005, 531);
		contentPane = new JPanel();
		contentPane.setBackground(Color.DARK_GRAY);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		contentPane.add(getTfIp());
		contentPane.add(getBtnStart());
		contentPane.add(getBtnStop());
		contentPane.add(getScrollPane());
		contentPane.add(getScrollPane_1());
		contentPane.add(getBtnSend());
		contentPane.add(getBtnWhisper());
		contentPane.add(getLblNewLabel_3());
		contentPane.add(getTfMessage());
	}
	public JTextField getTfIp() {
		if (tfIp == null) {
			tfIp = new JTextField();
			tfIp.setBounds(355, 27, 130, 21);
			tfIp.setColumns(10);
			
			try {
				InetAddress ia = InetAddress.getLocalHost();
				tfIp.setText(ia.getHostAddress());
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return tfIp;
	}
	public JButton getBtnStart() {
		if (btnStart == null) {
			btnStart = new JButton("시작");
			btnStart.setBackground(Color.ORANGE);
			btnStart.setForeground(Color.WHITE);
			btnStart.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					// 서버를 시작하고 클라이언트의 접속대기
					start();
				}
			});
			
			btnStart.setBounds(505, 27, 62, 23);
		}
		return btnStart;
	}
	public JButton getBtnStop() {
		if (btnStop == null) {
			btnStop = new JButton("종료");
			btnStop.setEnabled(false);
			btnStop.setForeground(Color.WHITE);
			btnStop.setBackground(Color.ORANGE);
			btnStop.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					stop();
				}
			});
			btnStop.setBounds(579, 27, 62, 23);
		}
		return btnStop;
	}
	public JLabel getLblNewLabel_1() {
		if (lblNewLabel_1 == null) {
			lblNewLabel_1 = new JLabel("접속자");
			lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return lblNewLabel_1;
	}
	public JScrollPane getScrollPane() {
		if (scrollPane == null) {
			scrollPane = new JScrollPane();
			scrollPane.setBounds(22, 107, 117, 293);
			scrollPane.setViewportView(getList());
			scrollPane.setColumnHeaderView(getLblNewLabel_1());
			scrollPane.setViewportView(getList());
		}
		return scrollPane;
	}
	
	public JList getList() {
		if (list == null) {
			list = new JList(userListModel);
		}
		return list;
	}
//	public JList getList() {
//		if (list == null) {
//			list = new JList();
//		}
//		테스트용
//		users.add("kim");
//		users.add("hong");
//		list.setListData(users);
//		
//		return list;
//	}
	public JLabel getLblNewLabel_2() {
		if (lblNewLabel_2 == null) {
			lblNewLabel_2 = new JLabel("대화 내용");
			lblNewLabel_2.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return lblNewLabel_2;
	}
	public JScrollPane getScrollPane_1() {
		if (scrollPane_1 == null) {
			scrollPane_1 = new JScrollPane();
			scrollPane_1.setBounds(247, 107, 686, 293);
			scrollPane_1.setViewportView(getTextArea());
			scrollPane_1.setColumnHeaderView(getLblNewLabel_2());
		}
		return scrollPane_1;
	}
	public JTextArea getTextArea() {
		if (textArea == null) {
			textArea = new JTextArea();
			textArea.setEditable(false);
		}
		return textArea;
	}
	public JButton getBtnSend() {
		if (btnSend == null) {
			btnSend = new JButton("전 송");
			btnSend.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
//						String msg = tfMessage.getText();
//						st.sendMsgAll(msg);
//						textArea.append(msg+"\n");
					if(!tfMessage.getText().equals("")) {
						send();
						}
						tfMessage.setText("");
				}
			});
			btnSend.setEnabled(false);
			btnSend.setForeground(Color.WHITE);
			btnSend.setBackground(SystemColor.textHighlight);
			btnSend.setBounds(777, 429, 91, 55);
		}
		return btnSend;
	}
	public JButton getBtnWhisper() {
		if (btnWhisper == null) {
			btnWhisper = new JButton("귓속말");
			btnWhisper.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					sendWhisper();
				}
			});
			btnWhisper.setEnabled(false);
			btnWhisper.setForeground(Color.WHITE);
			btnWhisper.setBackground(SystemColor.textHighlight);
			btnWhisper.setBounds(880, 429, 91, 55);
		}
		return btnWhisper;
	}
	public JLabel getLblNewLabel_3() {
		if (lblNewLabel_3 == null) {
			lblNewLabel_3 = new JLabel("서버 IP");
			lblNewLabel_3.setHorizontalAlignment(SwingConstants.RIGHT);
			lblNewLabel_3.setForeground(Color.WHITE);
			lblNewLabel_3.setFont(new Font("굴림", Font.BOLD, 20));
			lblNewLabel_3.setBounds(226, 21, 117, 28);
		}
		return lblNewLabel_3;
	}
	public JTextField getTfMessage() {
		if (tfMessage == null) {
			tfMessage = new JTextField();
			tfMessage.addKeyListener(new KeyAdapter() {
				@Override
				public void keyReleased(KeyEvent e) {
					if(e.getKeyCode()==MenuKeyEvent.VK_ENTER) {
						if(!tfMessage.getText().equals("")) {
						send();
						}
						tfMessage.setText("");
						
					}
				}
				
			});
			tfMessage.setBounds(22, 423, 743, 68);
			tfMessage.setColumns(10);
		}
		return tfMessage;
	}

}
