package gui;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import collection.ListFrame;

import java.awt.BorderLayout;
import javax.swing.JDesktopPane;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class MyInterMain extends JFrame {

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
      
      MemberInput memberinput = new MemberInput();
      memberinput.setLocation(228, 74);
      desktopPane.add(memberinput);
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
      }
      return mnNewMenu;
   }
   public JMenu getMnNewMenu_1() {
      if (mnNewMenu_1 == null) {
         mnNewMenu_1 = new JMenu("성적관리");
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
               JInternalFrame mi = new MemberInput();
               desktopPane.add(mi);
               desktopPane.updateUI();
               mi.toFront();
            }
         });    
      }
      return mntmNewMenuItem;
   }
   public JMenuItem getMntmNewMenuItem_1() {
      if (mntmNewMenuItem_1 == null) {
         mntmNewMenuItem_1 = new JMenuItem("회원조회");
      }
      return mntmNewMenuItem_1;
   }
   public JMenu getMnNewMenu_3() {
      if (mnNewMenu_3 == null) {
         mnNewMenu_3 = new JMenu("Util");
         mnNewMenu_3.add(getMntmNewMenuItem_2());
         mnNewMenu_3.add(getMntmNewMenuItem_3());
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
}