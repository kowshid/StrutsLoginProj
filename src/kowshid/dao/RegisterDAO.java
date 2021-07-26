package kowshid.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class RegisterDAO {
    public void insertData(String username, String password, String email) throws Exception {
        //System.out.println("jdbc connection initialization");
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsloginproj", "root", "");

        try {
            try {
                Statement statement = connection.createStatement();
                int value = statement.executeUpdate("INSERT INTO users(username, password, email) "
                        + "VALUES('"
                        + username + "', '"
                        + password + "', '"
                        + email + "')"
                );
                System.out.println("1 row affected \n" + value);
            } catch (SQLException exception) {
                System.out.println("SQL statement is not executed!" + exception);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
