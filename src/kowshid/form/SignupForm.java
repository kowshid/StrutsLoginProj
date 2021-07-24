package kowshid.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class SignupForm extends ActionForm {

    String username;
    String password;
    String reenteredPassword;
    String email;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getReenteredPassword() {
        return reenteredPassword;
    }

    public void setReenteredPassword(String reenteredPassword) {
        this.reenteredPassword = reenteredPassword;
    }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

        ActionErrors errors = new ActionErrors();

        if(this.getUsername() == null || this.getUsername().length() < 1) {
            errors.add("username",
                    new ActionMessage("Username required"));
        }

        if(this.getPassword() == null || getPassword().length() < 1) {
            errors.add("password",
                    new ActionMessage("Password required"));
        }

        if(this.getReenteredPassword() == null || this.getReenteredPassword().length() < 1) {
            errors.add("reenteredPassword",
                    new ActionMessage("Password required"));
        }

        if(this.getEmail() == null || getEmail().length() < 3) {
            errors.add("email",
                    new ActionMessage("Email is required"));
        }

        return errors;
    }

    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        username = "";
        password = "";
        reenteredPassword = "";
        email = "";
    }
}