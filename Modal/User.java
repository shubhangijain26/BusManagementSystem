
package Modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="login")
public class User {
    
    private String userType;
    private String uname;
    
    @Id
    private String pwd;
    
    public User(){}
    
    public User(String uname,String pwd,String userType)
    {
        this.uname = uname;
        this.pwd=pwd;
        this.userType=userType;
    }
    
    
    public void setUname(String uname){
        this.uname=uname;
    }
    
    public String getUname()
    {
        return uname;
    }
    
    public void setPwd(String pwd)
    {
        this.pwd=pwd;
    }
    
    public String getPwd()
    {
        return pwd;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
    
    
    
}
