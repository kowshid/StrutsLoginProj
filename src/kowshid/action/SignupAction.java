package kowshid.action;

import kowshid.form.SignupForm;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class SignupAction extends Action {
    public static List<String> usernames = new ArrayList<String>();
    public static List<String> passwords = new ArrayList<String>();
    public static List<String> emails = new ArrayList<String>();

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        SignupForm signupForm = (SignupForm) form;
        String currentUsername = signupForm.getUsername();
        String currentEmail = signupForm.getEmail();

        //System.out.println("Username = " + signupForm.getUsername());
        //System.out.println("Password = " + signupForm.getPassword());

        if(usernames.contains(currentUsername) || emails.contains(currentEmail)) {
            System.out.println("Username Or Email Exists");
            return mapping.findForward("failure");
        }

        usernames.add(currentUsername);
        passwords.add(signupForm.getPassword());
        emails.add(currentEmail);

        System.out.println(usernames);
        System.out.println(passwords);
        System.out.println(emails);
        System.out.println("returning success from signup");
        return mapping.findForward("success");
    }
}
