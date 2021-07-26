package kowshid.action;

import kowshid.dao.LoginDAO;
import kowshid.form.SignupForm;
import kowshid.dao.RegisterDAO;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;

public class SignupAction extends Action {
//    public static List<String> usernames = new ArrayList<String>();
//    public static List<String> passwords = new ArrayList<String>();
//    public static List<String> emails = new ArrayList<String>();

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        SignupForm signupForm = (SignupForm) form;
        String username = signupForm.getUsername();
        String email = signupForm.getEmail();
        String password = signupForm.getPassword();

        LoginDAO loginDAO = new LoginDAO();
        ResultSet resultSet = loginDAO.findUser(username);
        if (resultSet == null) {
            RegisterDAO dao = new RegisterDAO();
            dao.insertData(username, password, email);
            System.out.println("returning success from signup");

            return mapping.findForward("success");
        }
        //System.out.println("Username = " + signupForm.getUsername());
        //System.out.println("Password = " + signupForm.getPassword());

//        if(usernames.contains(username) || emails.contains(email)) {
//            System.out.println("Username Or Email Exists");
//            return mapping.findForward("failure");
//        }

//        usernames.add(username);
//        passwords.add(signupForm.getPassword());
//        emails.add(email);
//
//        System.out.println(usernames);
//        System.out.println(passwords);
//        System.out.println(emails);
        else {
            System.out.println("Username Or Email Exists");
            return mapping.findForward("failure");
        }
    }
}
