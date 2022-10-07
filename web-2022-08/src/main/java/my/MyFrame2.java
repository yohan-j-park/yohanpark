package my;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JTextArea;
import javax.swing.JEditorPane;
import javax.swing.JScrollPane;

public class MyFrame2 extends JFrame {

    private JPanel contentPane;
    private JTextField txtClickButton;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    MyFrame2 frame = new MyFrame2();
                    frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the frame.
     */
    public MyFrame2() {
        setTitle("두 번째 프레임");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 904, 530);
        contentPane = new JPanel();
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

        setContentPane(contentPane);
        contentPane.setLayout(null);
        
        JButton btnNewButton = new JButton("집에 가는 버튼");
        btnNewButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
            }
        });
        btnNewButton.setFont(new Font("굴림", Font.BOLD, 50));
        btnNewButton.setBounds(127, 160, 616, 186);
        contentPane.add(btnNewButton);
        
        txtClickButton = new JTextField();
        txtClickButton.setFont(new Font("Arial Rounded MT Bold", Font.PLAIN, 30));
        txtClickButton.setText("Click Button");
        txtClickButton.setBounds(127, 66, 616, 74);
        contentPane.add(txtClickButton);
        txtClickButton.setColumns(10);
        
        JScrollPane scrollPane = new JScrollPane();
        scrollPane.setBounds(755, 66, 123, 280);
        contentPane.add(scrollPane);
        
        JTextArea textArea = new JTextArea();
        scrollPane.setViewportView(textArea);
    }
}
