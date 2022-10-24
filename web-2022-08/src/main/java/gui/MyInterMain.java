package gui;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import collection.ListFrame;
import collection.SetFrame;

import java.awt.BorderLayout;
import javax.swing.JDesktopPane;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class MyInterMain extends JFrame {
// JInternalFrame을 하나씩만 생성하게 처리
   JInternalFrame mi, ms;
   ScoreInput si; 
   ScoreSearch ss; 
   SelectBox sb;
   MemberInputDB midb;
   MemberSearchDB msdb;
   
   private JPanel contentPane;
   private JDesktopPane desktopPane;
   private JMenuBar menuBar;
   private JMenu mnNewMenu;
   private JMenu mnNewMenu_1;
   private JMenu mnNewMenu_2;
   private JMenuItem mntmNewMenuItem;
   private JMenuItem mntmNewMenuItem_1;
   private JMenu mnNewMenu_3;
   private JMenuItem mntmNewMenuItem_2;
   private JMenuItem mntmNewMenuItem_3;
   private JMenuItem mntmNewMenuItem_4;
   private JMenuItem mntmNewMenuItem_5;
   private JMenuItem mntmNewMenuItem_6;
   private JMenuItem mntmNewMenuItem_7;
   private JMenuItem mntmNewMenuItem_8;
   private JMenuItem mntmNewMenuItem_9;
   
   /**
    * Launch the application.
    */
   
   public static void main(String[] args) {
      EventQueue.invokeLater(new Runnable() {
         public void run() {
            try {
               MyInterMain frame = new MyInterMain();
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
   public MyInterMain() {
      setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      setBounds(100, 100, 1115, 688);
      setJMenuBar(getMenuBar_1());
      contentPane = new JPanel();
      contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

      setContentPane(contentPane);
      contentPane.setLayout(new BorderLayout(0, 0));
      contentPane.add(getDesktopPane(), BorderLayout.CENTER);
      desktopPane.updateUI();   //중요
   }

   public JDesktopPane getDesktopPane() {
      if (desktopPane == null) {
         desktopPane = new JDesktopPane();
      }
      return desktopPane;
   }
   public JMenuBar getMenuBar_1() {
      if (menuBar == null) {
         menuBar = new JMenuBar();
         menuBar.add(getMnNewMenu());
         menuBar.add(getMnNewMenu_1());
         menuBar.add(getMnNewMenu_2());
         menuBar.add(getMnNewMenu_3());
      }
      return menuBar;
   }
   public JMenu getMnNewMenu() {
      if (mnNewMenu == null) {
         mnNewMenu = new JMenu("회원관리");
         mnNewMenu.add(getMntmNewMenuItem());
         mnNewMenu.add(getMntmNewMenuItem_1());
         mnNewMenu.add(getMntmNewMenuItem_8());
         mnNewMenu.add(getMntmNewMenuItem_9());
      }
      return mnNewMenu;
   }
   public JMenu getMnNewMenu_1() {
      if (mnNewMenu_1 == null) {
         mnNewMenu_1 = new JMenu("성적관리");
         mnNewMenu_1.add(getMntmNewMenuItem_5());
         mnNewMenu_1.add(getMntmNewMenuItem_6());
      }
      return mnNewMenu_1;
   }
   public JMenu getMnNewMenu_2() {
      if (mnNewMenu_2 == null) {
         mnNewMenu_2 = new JMenu("게시판");
      }
      return mnNewMenu_2;
   }
   public JMenuItem getMntmNewMenuItem() {
      if (mntmNewMenuItem == null) {
         mntmNewMenuItem = new JMenuItem("회원가입");
         
         mntmNewMenuItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
               if(mi==null) {
                   mi = new MemberInput(MyInterMain.this);  // MemberInput과 MyInterMain의 연결고리
                   desktopPane.add(mi);
                   desktopPane.updateUI();
                   mi.toFront();                 
               }
            }
         });    
      }
      return mntmNewMenuItem;
   }
   public JMenuItem getMntmNewMenuItem_1() {
      if (mntmNewMenuItem_1 == null) {
         mntmNewMenuItem_1 = new JMenuItem("회원조회");
         mntmNewMenuItem_1.addActionListener(new ActionListener() {
             public void actionPerformed(ActionEvent e) {
                 if(ms==null) {
                     ms = new MemberSearch(MyInterMain.this);       //연결고리
                     desktopPane.add(ms);
                     desktopPane.updateUI();
                     ms.toFront();                     
                 }
                 
             }
         });
      }
      return mntmNewMenuItem_1;
   }
   public JMenu getMnNewMenu_3() {
      if (mnNewMenu_3 == null) {
         mnNewMenu_3 = new JMenu("Util");
         mnNewMenu_3.add(getMntmNewMenuItem_2());
         mnNewMenu_3.add(getMntmNewMenuItem_3());
         mnNewMenu_3.add(getMntmNewMenuItem_4());
         mnNewMenu_3.add(getMntmNewMenuItem_7());
      }
      return mnNewMenu_3;
   }
   public JMenuItem getMntmNewMenuItem_2() {
      if (mntmNewMenuItem_2 == null) {
         mntmNewMenuItem_2 = new JMenuItem("Pattern");
         
         mntmNewMenuItem_2.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
               JInternalFrame p = new PatternFrame();
                  desktopPane.add(p);
                  desktopPane.updateUI();
                  p.toFront();
            }
         });
      }
      return mntmNewMenuItem_2;
   }
   public JMenuItem getMntmNewMenuItem_3() {
      if (mntmNewMenuItem_3 == null) {
         mntmNewMenuItem_3 = new JMenuItem("ListFrame");
         mntmNewMenuItem_3.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JInternalFrame lf = new ListFrame();
               desktopPane.add(lf);
               desktopPane.updateUI();
               lf.toFront();
               
            }
         });
      }
      return mntmNewMenuItem_3;
   }
    public JMenuItem getMntmNewMenuItem_4() {
        if (mntmNewMenuItem_4 == null) {
        	mntmNewMenuItem_4 = new JMenuItem("SetFrame");
        	mntmNewMenuItem_4.addActionListener(new ActionListener() {
        	    public void actionPerformed(ActionEvent e) {
        	        JInternalFrame lotto = new SetFrame();
        	        desktopPane.add(lotto);
        	        desktopPane.updateUI();
        	        lotto.toFront();
        	    }
        	});
        }
        return mntmNewMenuItem_4;
    }
    public JMenuItem getMntmNewMenuItem_5() {
        if (mntmNewMenuItem_5 == null) {
        	mntmNewMenuItem_5 = new JMenuItem("성적 입력");
        	mntmNewMenuItem_5.addActionListener(new ActionListener() {
        	    public void actionPerformed(ActionEvent e) {
        	        if(si==null) {
        	        si = new ScoreInput(MyInterMain.this);
        	        desktopPane.add(si);
        	        desktopPane.updateUI();
        	        si.toFront();
        	        }
        	    }
        	});
        }
        return mntmNewMenuItem_5;
    }
    public JMenuItem getMntmNewMenuItem_6() {
        if (mntmNewMenuItem_6 == null) {
        	mntmNewMenuItem_6 = new JMenuItem("성적 조회");
        	mntmNewMenuItem_6.addActionListener(new ActionListener() {
        	    public void actionPerformed(ActionEvent e) {
        	        if(ss==null) {
        	        ss = new ScoreSearch(MyInterMain.this);
                    desktopPane.add(ss);
                    desktopPane.updateUI();
                    ss.toFront();
        	        }
        	    }
        	});
        }
        return mntmNewMenuItem_6;
    }
    public JMenuItem getMntmNewMenuItem_7() {
        if (mntmNewMenuItem_7 == null) {
        	mntmNewMenuItem_7 = new JMenuItem("SelectBox");
        	mntmNewMenuItem_7.addActionListener(new ActionListener() {
        	    public void actionPerformed(ActionEvent e) {
        	        if(sb==null) {
        	            sb = new SelectBox(MyInterMain.this);
        	            desktopPane.add(sb);
        	            desktopPane.updateUI();
        	            sb.toFront();
        	        }
        	    }
        	});
        }
        return mntmNewMenuItem_7;
    }
    public JMenuItem getMntmNewMenuItem_8() {
        if (mntmNewMenuItem_8 == null) {
        	mntmNewMenuItem_8 = new JMenuItem("회원가입(DB)");
        	mntmNewMenuItem_8.addActionListener(new ActionListener() {
        	    public void actionPerformed(ActionEvent e) {
        	       if(midb==null) {
        	           midb = new MemberInputDB(MyInterMain.this);
        	           desktopPane.add(midb);
        	           desktopPane.updateUI();
        	           midb.toFront();
        	       }
        	    }
        	});
        }
        return mntmNewMenuItem_8;
    }
    public JMenuItem getMntmNewMenuItem_9() {
        if (mntmNewMenuItem_9 == null) {
        	mntmNewMenuItem_9 = new JMenuItem("회원조회(DB)");
        	mntmNewMenuItem_9.addActionListener(new ActionListener() {
        	    public void actionPerformed(ActionEvent e) {
        	        if(msdb==null) {
        	            msdb = new MemberSearchDB(MyInterMain.this);
        	            desktopPane.add(msdb);
        	            desktopPane.updateUI();
        	            msdb.toFront();
        	        }
        	    }
        	});
        }
        return mntmNewMenuItem_9;
    }
}