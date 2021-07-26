package kowshid.dao;

import java.sql.*;

public class LoginDAO {
    public ResultSet findUser (String username) throws Exception {
        //System.out.println("jdbc connection initialization");
        Class.forName("com.mysql.jdbc.Driver");
        final String queryString = "SELECT username, password FROM users WHERE username = ?";
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsloginproj", "root", "");
        ResultSet resultSet = null;

        try {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(queryString);
                preparedStatement.setString(1, username);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next()) {
//                    connection.close();
                    // the right way to do it will be to create a User class and return the user instance
                    // instead of the resultset directly. Otherwise connection cannot be closed.
                    return resultSet;
                }
            } catch (SQLException exception) {
                System.out.println("SQL statement is not executed!" + exception);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
//        finally {
//            connection.close();
//        }
        return null;
    }
}
