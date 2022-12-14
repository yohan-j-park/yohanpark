package gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.sql.Connection;
import java.util.Vector;

import javax.swing.ButtonModel;
import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.event.InternalFrameAdapter;
import javax.swing.event.InternalFrameEvent;
import javax.swing.table.DefaultTableModel;

import jdbc.MemberDto;
import jdbc.MemberVo;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class MemberSearchDB extends JInternalFrame {
    private JPanel panel;
    private JButton btnNewButton;
    private JTextField findStr;
    private JScrollPane scrollPane;
    private JTable table;
    
    MyInterMain main;
//    MemberInputDB midb;
    Connection conn;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    MemberSearchDB frame = new MemberSearchDB();
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
    public MemberSearchDB() {
        super("ํ์์กฐํDB",true,true,true,true);
        setVisible(true);
        addInternalFrameListener(new InternalFrameAdapter() {
            @Override
            public void internalFrameClosing(InternalFrameEvent e) {
                main.msdb = null;
            }
        });
        setBounds(100, 100, 450, 300);
        getContentPane().add(getPanel(), BorderLayout.NORTH);
        getContentPane().add(getScrollPane(), BorderLayout.CENTER);

    }
    
    public MemberSearchDB(MyInterMain main) {
        this();
        this.main = main;
    }
    public void select() {
        // ๊ฒ์์ด๋ฅผ ๊ฐ์?ธ์ MemberDto.select ํธ์ถ -> ๋ฐํํ: Vectorํ์์ vector(Vector<Vector>)
        String f = findStr.getText();
        MemberDto dto = new MemberDto();
        Vector<Vector> list = dto.select(f);
        
        // DefaultTableModel์ ์๋ ๋ชจ๋? ๋ฐ์ดํฐ๋ฅผ ์ญ์?
        DefaultTableModel model = (DefaultTableModel)table.getModel();
        model.setRowCount(0);
        
        // DefaultTableModel model ์ ๋ฆฌํด๋ฐ์ Vector ๋ฐ์ดํฐ๋ฅผ ์ถ๊ฐ
        for(Vector v : list) {
            model.addRow(v);
        }
        
        // model์ table์ ์ค์?
    }
    public JPanel getPanel() {
        if (panel == null) {
        	panel = new JPanel();
        	panel.setPreferredSize(new Dimension(10, 35));
        	panel.setLayout(new BorderLayout(0, 0));
        	panel.add(getBtnNewButton(), BorderLayout.EAST);
        	panel.add(getFindStr(), BorderLayout.CENTER);
        }
        return panel;
    }
    public JButton getBtnNewButton() {
        if (btnNewButton == null) {
        	btnNewButton = new JButton("๊ฒ์");
        	btnNewButton.addActionListener(new ActionListener() {
        	    public void actionPerformed(ActionEvent e) {
        	        select();
        	    }
        	});
        }
        return btnNewButton;
    }
    public JTextField getFindStr() {
        if (findStr == null) {
        	findStr = new JTextField();
        	findStr.addKeyListener(new KeyAdapter() {
        	    @Override
        	    public void keyReleased(KeyEvent e) {
        	        if(e.getKeyCode() == KeyEvent.VK_ENTER) {
        	            select();
        	        }
        	    }
        	});
        	findStr.setColumns(10);
        }
        return findStr;
    }
    public JScrollPane getScrollPane() {
        if (scrollPane == null) {
        	scrollPane = new JScrollPane();
        	scrollPane.setViewportView(getTable());
        }
        return scrollPane;
    }
    public JTable getTable() {
        if (table == null) {
        	table = new JTable();
        	table.addMouseListener(new MouseAdapter() {
        	    @Override
        	    public void mouseClicked(MouseEvent e) {
        	        int row = table.getSelectedRow();
        	        String id = (String)table.getValueAt(row, 0);
        	        MemberDto dto = new MemberDto();
        	        MemberVo vo = dto.SelectOne(id);   //id๋ฅผ ๋งค๊ฐ๋ณ์๋ก ๋ฐ์ vo๋ฅผ ๋ฆฌํดํ๋ ๋ฉ์๋
        	        
        	        if(main.midb == null) {        // main์ midb๊ฐ ์๋ค๋ฉด
        	            main.midb = new MemberInputDB(main);   // main์ midb๋ฅผ ์์ฑ
        	            main.getDesktopPane().add(main.midb);
        	        }
        	            main.midb.loadData(vo);
        	            main.midb.toFront();
        	    }
        	});
        	String[] header = {"์์ด๋","์ฑ๋ช","์ฑ๋ณ","์ฐ๋ฝ์ฒ","๋ฑ๋ก์ผ"};
        	DefaultTableModel model = new DefaultTableModel(null, header);
        	table.setModel(model);
        }
        return table;
    }
}