package gui;

import java.awt.EventQueue;

import javax.swing.JInternalFrame;

public class MemberInput extends JInternalFrame {

   /**
    * Launch the application.
    */
   public static void main(String[] args) {
      EventQueue.invokeLater(new Runnable() {
         public void run() {
            try {
               MemberInput frame = new MemberInput();
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
   public MemberInput() {
      super("회원가입", true, true, true, true);
      setBounds(100, 100, 450, 300);
      setVisible(true);

   }

}