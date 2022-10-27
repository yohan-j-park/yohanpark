package chatt;
import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

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

import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class ServerMain extends JFrame {
	ServerSocket server;
	ServerThread st;
	
	Vector<ServerThread> clients = new Vector<ServerThread>();

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
	
	BufferedWriter bw;
	BufferedReader br;

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


	public void start() {

		try {
			Thread t = new Thread(new Runnable() {		// cpu는 cpu대로 ui는 ui대로 일한다
				
				
				public void run() {
					try {
						textArea.append("서버가 시작되었습니다.\n");
						btnStart.setEnabled(false);
						btnStop.setEnabled(true);
						btnSend.setEnabled(true);
						btnWhisper.setEnabled(true);
						server = new ServerSocket(6666);
						while(true) {
							Socket socket = server.accept();		// 스레드를 만들지 않으면 클라이언트가 들어올 때 까지 아무것도 못함..
							st = new ServerThread(socket, ServerMain.this);
							st.start();
							clients.add(st);
							
						}
						
					} catch (IOException e) {
						
						e.printStackTrace();
					}
					
				}
			});
			t.start();		// 스레드 생성

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void stop() {
		// 1) 접속 된 모든 클라이언트들에게 서버 중지 사실을 알린다.
		for(ServerThread st : clients) {
			String msg = "서버가 종료되었습니다.\n";
			st.sendMsgAll(msg);
			clients.remove(st);
		}
		
		// 2) ServerSocket 종료
		try {
			server.close();
		} catch (IOException e) {}
		
		// 3) 버튼들을 토클
		btnStart.setEnabled(true);
		btnStop.setEnabled(false);
		btnSend.setEnabled(false);
		btnWhisper.setEnabled(false);
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
		}
		return scrollPane;
	}
	public JList getList() {
		if (list == null) {
			list = new JList();
		}
		return list;
	}
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
						String msg = tfMessage.getText();
						st.sendMsgAll(msg);
					    textArea.append(msg+"\n");
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
						String msg = tfMessage.getText()+"\n";
						st.sendMsgAll(msg);
					}
				}
				
			});
			tfMessage.setBounds(22, 416, 743, 68);
			tfMessage.setColumns(10);
		}
		return tfMessage;
	}
}
