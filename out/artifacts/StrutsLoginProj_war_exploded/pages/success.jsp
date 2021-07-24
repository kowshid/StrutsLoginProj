<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<html>
    <head>
        <title>Success</title>
    </head>

    <body>
        <div style="padding:4px">
            <h2 style="color: green"><bean:write name="loginForm" property="username" /> Logged in Successfully</h2>
        </div>

        <a href="signup.do">
            Signup Page
        </a><br><br>

        <a href="login.do">
            Login Page
        </a>
    </body>
</html>