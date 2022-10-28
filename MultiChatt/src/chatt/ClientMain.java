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

import org.json.simple.JSONObject;

public class ClientMain extends JFrame {
	ClientThread ct;
	Vector<String> users = new Vector<String>();

	private JPanel contentPane;
	private JLabel lblNewLabel;
	private JTextField tfIp;
	private JButton btnConnect;
	private JButton btnDisconnect;
	private JLabel lblNewLabel_1;
	private JScrollPane scrollPane;
	private JList list;
	private JLabel lblNewLabel_2;
	private JScrollPane scrollPane_1;
	private JTextArea textArea;
	private JButton btnSend;
	private JButton btnWhisper;
	private JLabel lblNewLabel_3;
	private JTextField tfUser;
	private JTextField tfMessage;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ClientMain frame = new ClientMain();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}


	public void connect() {
		try {
			String ip = tfIp.getText();
			int port = 6666;
			Socket s = new Socket(ip,port);
			ct = new ClientThread(s,this); 	// ClientMain.this		
			ct.start();
			
			btnConnect.setEnabled(false);
			btnDisconnect.setEnabled(true);
			btnSend.setEnabled(true);
			btnWhisper.setEnabled(true);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		// 1) 서버에게 자신의 종료 사실 통보
		JSONObject obj = new JSONObject();
		obj.put("user", tfUser.getText());
		obj.put("command", ServerMain.LOGOUT);
		obj.put("message", "Client_Disconnect");
		
		ct.sendMsg(obj.toJSONString());
		
		
		// 2) ct 종료
		try {
			ct.br.close();
			ct.bw.close();
			ct.socket.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		ct=null;
		
		
		// 3) 버튼 상태 변경
		btnConnect.setEnabled(true);
		btnDisconnect.setEnabled(false);
		btnSend.setEnabled(false);
		btnWhisper.setEnabled(false);
	}
	
	public ClientMain() {
		setTitle("멀티 채팅 클라이언트");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1003, 531);
		contentPane = new JPanel();
		contentPane.setBackground(Color.DARK_GRAY);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		contentPane.add(getLblNewLabel());
		contentPane.add(getTfIp());
		contentPane.add(getBtnConnect());
		contentPane.add(getBtnDisconnect());
		contentPane.add(getScrollPane());
		contentPane.add(getScrollPane_1());
		contentPane.add(getBtnSend());
		contentPane.add(getBtnWhisper());
		contentPane.add(getLblNewLabel_3());
		contentPane.add(getTfUser());
		contentPane.add(getTfMessage());
	}
	public JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("서버 IP  ");
			lblNewLabel.setFont(new Font("굴림", Font.BOLD, 20));
			lblNewLabel.setForeground(Color.WHITE);
			lblNewLabel.setHorizontalAlignment(SwingConstants.RIGHT);
			lblNewLabel.setBounds(138, 25, 117, 28);
		}
		return lblNewLabel;
	}
	public JTextField getTfIp() {
		if (tfIp == null) {
			tfIp = new JTextField();
			tfIp.setBounds(247, 31, 130, 21);
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
	
	public JButton getBtnConnect() {
		if (btnConnect == null) {
			btnConnect = new JButton("접속");
			btnConnect.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					connect();
				}
			});
			btnConnect.setForeground(Color.WHITE);
			btnConnect.setBackground(Color.ORANGE);
			btnConnect.setBounds(639, 25, 62, 23);
		}
		return btnConnect;
	}
	public JButton getBtnDisconnect() {
		if (btnDisconnect == null) {
			btnDisconnect = new JButton("종료");
			btnDisconnect.setEnabled(false);
			btnDisconnect.setForeground(Color.WHITE);
			btnDisconnect.setBackground(Color.ORANGE);
			btnDisconnect.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					disconnect();
				}
			});
			btnDisconnect.setBounds(713, 25, 62, 23);
		}
		return btnDisconnect;
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
		}
		return textArea;
	}
	public JButton getBtnSend() {
		if (btnSend == null) {
			btnSend = new JButton("전 송");
			btnSend.setEnabled(false);
			btnSend.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					String msg = tfMessage.getText();
					ct.sendMsg(msg);
					textArea.append(msg+"\n");
				    tfMessage.setText("");
					
				}
			});
			btnSend.setBackground(SystemColor.textHighlight);
			btnSend.setForeground(Color.WHITE);
			btnSend.setBounds(777, 429, 91, 55);
		}
		return btnSend;
	}
	public JButton getBtnWhisper() {
		if (btnWhisper == null) {
			btnWhisper = new JButton("귓속말");
			btnWhisper.setEnabled(false);
			btnWhisper.setForeground(Color.WHITE);
			btnWhisper.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
				}
			});
			btnWhisper.setBackground(SystemColor.textHighlight);
			btnWhisper.setBounds(880, 429, 91, 55);
		}
		return btnWhisper;
	}
	public JLabel getLblNewLabel_3() {
		if (lblNewLabel_3 == null) {
			lblNewLabel_3 = new JLabel("접속자 ");
			lblNewLabel_3.setFont(new Font("굴림", Font.BOLD, 20));
			lblNewLabel_3.setForeground(Color.WHITE);
			lblNewLabel_3.setHorizontalAlignment(SwingConstants.RIGHT);
			lblNewLabel_3.setBounds(378, 25, 117, 28);
		}
		return lblNewLabel_3;
	}
	public JTextField getTfUser() {
		if (tfUser == null) {
			tfUser = new JTextField();
			tfUser.setColumns(10);
			tfUser.setBounds(494, 29, 130, 21);
		}
		return tfUser;
	}
	public JTextField getTfMessage() {
		if (tfMessage == null) {
			tfMessage = new JTextField();
			tfMessage.addKeyListener(new KeyAdapter() {
				@Override
				public void keyReleased(KeyEvent e) {
					if(e.getKeyCode()==KeyEvent.VK_ENTER) {
					String msg = tfMessage.getText();
					ct.sendMsg(msg);
					
					}
				}
			});
			tfMessage.setBounds(22, 418, 738, 66);
			tfMessage.setColumns(10);
		}
		return tfMessage;
	}
}
