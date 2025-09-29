package model1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import jakarta.servlet.http.HttpSession;

public class User {
	
	private int id;
    private String name;
    private String email;
    private String password;
    private String mobile;
    private String role;

    // Default constructor
    public User() {}

    // Parameterized constructor
    public User(int id, String name, String email, String password,String mobile, String role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.role = role;
    }

    // Getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
	    
	

//	private Connection con;
//	HttpSession se;
//	public User(HttpSession session) {
//	try {
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb", "root", "tiger");
//		se=session;
//	}
//	catch(ClassNotFoundException | SQLException e ) {
//		e.printStackTrace();
//	}
//
//}
//	public  String log(String email,String password) {
//		String status="",id="";
//		String uname="";
//		String Mail="";
//		String query="SELECT * FROM USERS WHERE email='"+email+"' AND PASSWORD='"+password+"' ;";
//		try {
//		Statement st=null;
//		ResultSet rs=null;
//		st=con.createStatement();
//		rs=st.executeQuery(query);
//		boolean b=rs.next();
//		if(b==true) {
//			id=rs.getString("id");
//			Mail=rs.getString("email");
//			se.setAttribute("id", id);
//			
//			status="success";
//			
//		}
//		else {
//			status="failure";
//		}
//		
//		}
//		catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return status;
//	}
//}

