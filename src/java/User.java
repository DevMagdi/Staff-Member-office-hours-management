
public class User {
    
    protected String mail;
    protected String phone;
    protected int id;
    protected String password;
 
    public User() {
    }
 
    public User(int id) {
        this.id = id;
    }
 
    public User(String mail, String phone, int id, String password) {
        this(mail, phone, password);
        this.id = id;
    }
   
    public User(String mail, String phone, String password) {
      this.mail = mail;
      this.phone = phone;
      this.password = password;
  }
 
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
 
    public String getMail() {
        return mail;
    }
 
    public void setMail(String mail) {
        this.mail = mail;
    }
 
    public String getPhone() {
        return phone;
    }
 
    public void setPhone(String phone) {
        this.phone = phone;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
}