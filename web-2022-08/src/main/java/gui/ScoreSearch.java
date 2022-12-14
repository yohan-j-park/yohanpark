package gui;

import java.awt.EventQueue;

import javax.swing.JInternalFrame;
import java.awt.BorderLayout;
import javax.swing.JPanel;
import java.awt.Dimension;
import javax.swing.JButton;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import iostream.ScoreDao;
import iostream.ScoreVo;

import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.event.InternalFrameAdapter;
import javax.swing.event.InternalFrameEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class ScoreSearch extends JInternalFrame {
    private JPanel panel;
    private JButton btnNewButton;
    private JTextField findStr;
    private JScrollPane scrollPane;
    private JTable table;
    
    MyInterMain main;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    ScoreSearch frame = new ScoreSearch();
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
    public ScoreSearch() {
        super("์ฑ์  ์กฐํ",true,true,true,true);
        addInternalFrameListener(new InternalFrameAdapter() {
            @Override
            public void internalFrameClosing(InternalFrameEvent e) {
                main.ss = null;
            }
        });
        setVisible(true);
        setBounds(100, 100, 768, 352);
        getContentPane().setLayout(new BorderLayout(0, 0));
        getContentPane().add(getPanel(), BorderLayout.NORTH);
        getContentPane().add(getScrollPane(), BorderLayout.CENTER);

    }
    
    public ScoreSearch(MyInterMain main) {
        this();
        this.main = main;
    }

    public JPanel getPanel() {
        if (panel == null) {
        	panel = new JPanel();
        	panel.setPreferredSize(new Dimension(10, 26));
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
        	        String find = findStr.getText().trim();
        	        ScoreDao dao = new ScoreDao();
        	        List<ScoreVo> list = dao.read();
        	        DefaultTableModel model = (DefaultTableModel)table.getModel();
        	        model.setRowCount(0);  //๊ธฐ์กด์ ํ์ด๋ธ์ด ๊ฐ์ง๊ณ  ์๋ ๋ฐ์ดํฐ๊ฐ ์ฌ๋ผ์ง๋ค.
        	        for(ScoreVo vo : list) {
        	            if(vo.getId().contains(find) || vo.getSubject().contains(find)) {
        	                model.addRow(vo.getVector());
        	            }
        	        }
        	        table.updateUI();
        	    }
        	});
        }
        return btnNewButton;
    }
    public JTextField getFindStr() {
        if (findStr == null) {
        	findStr = new JTextField();
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
            // ํค๋ ์์ฑ
            ScoreDao dao = new ScoreDao();
            List<ScoreVo> list = dao.read();
            Vector vector = new Vector();
            for(ScoreVo s : list) {
                vector.add(s.getVector());
            }
            
            DefaultTableModel model = new DefaultTableModel();
            String[] header = {"์๋ฒ","์์ด๋","์ํ์ผ์","๊ณผ๋ชฉ","์ ์"};
            Vector<String> vs = new Vector(Arrays.asList(header));
            model.setDataVector(vector, vs);
            
        	table = new JTable(model);
        	table.addMouseListener(new MouseAdapter() {    
        	    //Mouse์ ์๋ ๋ชจ๋  EventListener๋ฅผ ํฌ๊ดํ๋ MouseAdapter
        	    //์ ๋ฏธ์ฌ๊ฐ Listener๋ฉด Interface , Adapter๋ฉด ์ฌ์ ์ํ class
        	    //Listener๋ฅผ ์ฌ์ฉํ๋ฉด ๋ง์ฐ์ค์ ํฌํจ๋ ๋ชจ๋  ๋ฉ์๋๋ฅผ ์ฌ์ ์ํด์ผํ๋๋ฐ(์ฌ์ฉํ์ง ์์์๋) ๋ชจ๋  ์ด๋ฒคํธ๋ฅผ ํฌ๊ดํ๋Adapter๋ก ์ฌ์ ์ํ์ฌ ๊ฐํธํ๊ฒ ์ฌ์ฉํจ
        	    
        	    @Override
        	    public void mouseClicked(MouseEvent e) {
        	        int row = table.getSelectedRow();      //
        	        
        	        if(main.si == null) {      //MyInterMain ์์ ScoreInput ์ฐฝ์ด ์์ผ๋ฉด
        	            main.si = new ScoreInput(main);
        	            main.getDesktopPane().add(main.si);
        	            main.getDesktopPane().updateUI();
        	            main.si.toFront();                     
        	            // 138~141: ss์์ si์ฐฝ์ด ์์ ์ ss์ row๋ฅผ ํด๋ฆญํ๋ฉด si์ฐฝ์ด ๋จ๊ฒ ํ๋ ์ฝ๋

        	        }
        	        
        	        Integer serial = (Integer)(table.getValueAt(row, 0));
        	        String id = (String)table.getValueAt(row, 1);
        	        String mDate = (String)table.getValueAt(row, 2);
        	        String subject = (String)table.getValueAt(row, 3);
        	        int score = (Integer)(table.getValueAt(row, 4));
        	        
        	        main.si.getTfSerial().setText(serial.toString());
        	        main.si.getTfId().setText(id);
        	        main.si.getTfMdate().setText(mDate);
        	        main.si.getTfSubject().setText(subject);
        	        main.si.getTfScore().setText(score+"");
        	                
        	        
        	    }
        	});
        }
        return table;
    }
}
