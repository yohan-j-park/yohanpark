package iostream;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.List;
import java.util.Vector;

public class MemberDao {
    
    public String fileName = "member.obj";
    List<Data> list = new Vector<Data>();   //
    ObjectOutputStream oos;
    ObjectInputStream ois;
    public MemberDao() {
        this.list = read();
    }
    
    public void write(Data d){
        try {
            FileOutputStream fos = new FileOutputStream(fileName);
            oos = new ObjectOutputStream(fos);
            list.add(d);
            oos.writeObject(list);
            oos.flush();
            oos.close();
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public List<Data> read(){ 
        try {
            FileInputStream fis = new FileInputStream(fileName);
            ois = new ObjectInputStream(fis);
            list = (List<Data>)ois.readObject();
            ois.close();
            fis.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void modify(){}
    public void delete(){}
    public void view(){}
    
}
