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
import java.util.List;
import java.awt.event.ActionEvent;

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
        super("성적 조회",true,true,true,true);
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
        	btnNewButton = new JButton("검색");
        	btnNewButton.addActionListener(new ActionListener() {
        	    public void actionPerformed(ActionEvent e) {
        	        String find = findStr.getText().trim();
        	        ScoreDao dao = new ScoreDao();
        	        List<ScoreVo> list = dao.read();
        	        DefaultTableModel model = (DefaultTableModel)table.getModel();
        	        model.setRowCount(0);  //기존에 테이블이 가지고 있던 데이터가 사라진다.
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
            // 헤더 생성
            DefaultTableModel model = new DefaultTableModel();
            String[] header = {"순번","아이디","시험일자","과목","점수"};
            model.setDataVector(null, header);
            
        	table = new JTable(model);
        }
        return table;
    }
}
