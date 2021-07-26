package kowshid.action;

import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kowshid.form.*;
import kowshid.dao.LoginDAO;

import java.sql.ResultSet;

public class LoginAction extends Action{
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        LoginForm loginForm = (LoginForm) form;
        String currentUsername = loginForm.getUsername();
        String currentPassword = loginForm.getPassword();

        LoginDAO loginDAO = new LoginDAO();
        ResultSet resultSet = loginDAO.findUser(currentUsername);

        if (resultSet == null) {
            System.out.println("returning failure from login");
            return mapping.findForward("userNotFound");
        }

        if (!resultSet.getString("password").equals(currentPassword)) {
            System.out.println("Wrong password");
            return mapping.findForward("failure");
        }

//        System.out.println("DAO Username = " + resultSet.getString("username"));
//        System.out.println("DAO Password = " + resultSet.getString("password"));

//        System.out.println("Username = " + currentUsername);
//        System.out.println("Password = " + currentPassword);

//        int indexOfUser = SignupAction.usernames.indexOf(currentUsername);
//        if(indexOfUser == -1) {
//            System.out.println("returning failure from login");
//            return mapping.findForward("userNotFound");
//        }
//        int indexOfPass = SignupAction.passwords.indexOf(currentPassword);
//        if(indexOfPass != indexOfUser) {
//            System.out.println("returning failure from login");
//            return mapping.findForward("failure");
//        }
        else {
            System.out.println("returning success from login");
            return mapping.findForward("success");
        }
    }
}