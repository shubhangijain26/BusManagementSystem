
package Modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="busDetails")
public class BusAdd {
    
    @Id
    private String busID;
    
    private String licenceNo;
    private String color;
    
   public BusAdd(){}

    BusAdd(String busID,String licenceNo,String color)
    {
        this.busID = busID;
        this.licenceNo = licenceNo;
         this.color = color;
    }
    public String getBusID() {
        return busID;
    }

    public void setBusID(String busID) {
        this.busID = busID;
    }

    public String getLicenceNo() {
        return licenceNo;
    }

    public void setLicenceNo(String licenceNo) {
        this.licenceNo = licenceNo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    
}
