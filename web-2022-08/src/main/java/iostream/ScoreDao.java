package iostream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.List;
import java.util.Vector;

public class ScoreDao implements ScoreInterface{
    String fileName = "score.obj";
    List<ScoreVo> list = new Vector<ScoreVo>();
    
    public ScoreDao() {
        list = read();
    }
    

    @Override
    public void write(ScoreVo vo) {
        try {
        FileOutputStream fos = new FileOutputStream(fileName);
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        list.add(vo);
        oos.writeObject(list); 
        oos.flush();
        oos.close();
        fos.close();
        
        }catch(Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public List<ScoreVo> read() {
        try {
            //score.obj파일의 유무 체크
            File f = new File(fileName);
            if(f.exists()) {
            FileInputStream fis = new FileInputStream(fileName);
            ObjectInputStream ois = new ObjectInputStream(fis);
            list = (List<ScoreVo>)ois.readObject();
            
            ois.close(); 
            fis.close();
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    @Override
    public void modify(ScoreVo vo) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void delete(int serial) {
        // TODO Auto-generated method stub
        
    }

}
