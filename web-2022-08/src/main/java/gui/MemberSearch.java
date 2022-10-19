package gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.util.List;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import iostream.Data;
import iostream.MemberDao;
import javax.swing.event.InternalFrameAdapter;
import javax.swing.event.InternalFrameEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class MemberSearch extends JInternalFrame {
    MyInterMain main;
    
    private JPanel panel;
    private JTextField textField;
    private JButton btnNewButton;
    private JScrollPane scrollPane;
    private JTable table;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    MemberSearch frame = new MemberSearch();
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
    public MemberSearch(MyInterMain main) {
        this();
        this.main = main;
    }
    public MemberSearch() {
        super("회원조회",true,true,true);
        addInternalFrameListener(new InternalFrameAdapter() {
            @Override
            public void internalFrameClosing(InternalFrameEvent e) {
                main.ms = null;
            }
        });
        setVisible(true);
        setBounds(100, 100, 823, 491);
        getContentPane().add(getPanel(), BorderLayout.NORTH);
        getContentPane().add(getScrollPane(), BorderLayout.CENTER);

    }
   

    public JPanel getPanel() {
        if (panel == null) {
        	panel = new JPanel();
        	panel.setPreferredSize(new Dimension(10, 35));
        	panel.setLayout(new BorderLayout(0, 0));
        	panel.add(getTextField(), BorderLayout.CENTER);
        	panel.add(getBtnNewButton(), BorderLayout.EAST);
        }
        return panel;
    }
    public JTextField getTextField() {
        if (textField == null) {
        	textField = new JTextField();
        	textField.setColumns(10);
        }
        return textField;
    }
    public JButton getBtnNewButton() {
        if (btnNewButton == null) {
        	btnNewButton = new JButton("조회");
        }
        return btnNewButton;
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
            MemberDao dao = new MemberDao();
            List<Data> list = dao.read();
            
            Vector vector = new Vector();
            for(Data d : list) {
                vector.add(d.getVector());
            }
            DefaultTableModel model = new DefaultTableModel();
            Vector<String> header = new Vector();
            header.add("아이디");
            header.add("성 명");
            header.add("주 소");
            header.add("연락처");
            header.add("포인트");
            
            model.setDataVector(vector, header);
            
            
        	table = new JTable(model);
        	table.addMouseListener(new MouseAdapter() {
        	    @Override
        	    public void mouseClicked(MouseEvent e) {
        	        // JTable에서 클릭된 좌표(row,column)
        	        int row = table.getSelectedRow();
        	        int col = table.getSelectedColumn();
        	        Object obj = table.getValueAt(row, col);
        	        System.out.printf("(%d,%d)=%s",row,col,obj);
        	        if(main.mi == null) {
        	            main.mi = new MemberInput(main);
        	            main.getDesktopPane().add(main.mi);
        	            main.getDesktopPane().updateUI();
        	            main.mi.toFront();
        	        }
        	        MemberInput mi = (MemberInput)main.mi;
        	        String id = (String)table.getValueAt(row, 0);
        	        String irum = (String)table.getValueAt(row, 1);
        	        String addr = (String)table.getValueAt(row, 2);
        	        String phone = (String)table.getValueAt(row, 3);
        	        Integer point = (Integer)table.getValueAt(row, 4);
        	        
        	        mi.getTfId().setText(id);
        	        mi.getTfIrum().setText(irum);
        	        mi.getTfAddr().setText(addr);
        	        mi.getTfPhone().setText(phone);
        	        mi.getTfPoint().setText(point+"");
        	    }
        	});
        }
        return table;
    }
}
