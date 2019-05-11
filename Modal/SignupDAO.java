
package Modal;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class SignupDAO {
    
    public void save(User u)
    {
        
        Configuration cf = null;
        SessionFactory sf= null;
        Session session = null;

      try
      {
       cf = new Configuration();
       cf.configure("cfgpackage/hibernate.cfg.xml");
       sf=cf.buildSessionFactory();
       session = sf.openSession();
       
       Transaction tx = session.beginTransaction();
       session.save(u);
       tx.commit();
        
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
      
      finally{
          session.close();
          sf.close();
      }
    }
}
