<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%
    double rand = Math.random() * 10.0;
%>

<html>
    <head>
        <script>
            function validateForm()
            {
                <%--var rand = <%=rand%>--%>
                <%--alert(rand);--%>

                var username, password, reenteredPassword, email;

                username = document.querySelector("input[name=username]");
                password = document.querySelector("input[name=password]");
                reenteredPassword = document.querySelector("input[name=reenteredPassword]");
                email = document.querySelector("input[name=email]");

                console.log(username.value, password.value, email.value, reenteredPassword.value);

                if(username.value === "")
                {
                    alert("User Name should not be blank.");
                    username.focus();
                    return false;
                }
                if(password.value === "")
                {
                    alert("Password should not be blank");
                    password.focus();
                    return false;
                }
                if (password.value !== reenteredPassword.value) {
                    alert("Passwords have to match");
                    reenteredPassword.focus();
                    return false;
                }
                if(email.value === "")
                {
                    alert("Email should not be blank..");
                    email.focus();
                    return false;
                }
                if(reenteredPassword.value === "")
                {
                    alert("Re entered Password should not be blank");
                    //document.form.reenteredPassword.focus();
                    return false;
                }
                if (!(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(email.value))) {
                    alert("Wrong email format");
                    //document.form.email.focus();
                    return false;
                }

                return true;
            }
        </script>
        <style>
            body {
                background-color: #F3EBF6;
                font-family: 'Ubuntu', sans-serif;
            }
            h2{
                padding-top: 20px;
                color: #8C55AA;
                font-family: 'Ubuntu', sans-serif;
                font-weight: bold;
                font-size: 23px;
            }
            p {
                color: #8C55AA;
                font-family: 'Ubuntu', sans-serif;
                font-weight: bold;
            }
            a {
                text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
                color: #270802;
                text-decoration: none
            }
            .signup {
                background-color: #FFFFFF;
                width: 400px;
                height: 600px;
                margin: 1em auto;
                border-radius: 1.5em;
                box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
            }

            #username, #password, #email {
                width: 76%;
                color: rgb(38, 50, 56);
                font-weight: 700;
                font-size: 14px;
                letter-spacing: 1px;
                background: rgba(136, 126, 126, 0.04);
                padding: 10px 20px;
                border: none;
                border-radius: 20px;
                outline: none;
                box-sizing: border-box;
                margin-left: 46px;
                text-align: center;
                margin-bottom: 27px;
                font-family: 'Ubuntu', sans-serif;
            }

            #exter {
                width: 76%;
                color: rgb(38, 50, 56);
                font-weight: 700;
                font-size: 14px;
                letter-spacing: 1px;
                background: rgba(136, 126, 126, 0.04);
                padding: 10px 20px;
                border-radius: 20px;
                outline: none;
                box-sizing: border-box;
                border: 2px solid rgba(0, 0, 0, 0.02);
                margin-left: 46px;
                text-align: center;
                margin-bottom: 27px;
                font-family: 'Ubuntu', sans-serif;
            }
            #buttons {
                cursor: pointer;
                border-radius: 5em;
                color: #fff;
                background: linear-gradient(to right, #9C27B0, #E040FB);
                border: 0;
                padding: 10px 30px;
                font-family: 'Ubuntu', sans-serif;
                margin-left: 20%;
                margin-right: 20%;
                font-size: 13px;
                box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
            }
        </style>
        <title>Signup</title>
    </head>
    <body>
    <div class="signup">
        <h2 align="center">Signup Form</h2>
        <html:form action="/submitSignup" onsubmit="validateForm()">

            <div id="username">
                <p>Username</p>
                <html:text property="username"/>
            </div>

            <div id="password">
                <p>Password</p>
                <html:text property="password"/>
            </div>
            <div id="password">
                <p>Re-enter Password</p>
                <html:text property="reenteredPassword"/>
            </div>
            <div id="email">
                <p>Enter Email</p>
                <html:text property="email"/>
            </div>

            <div align="center">
                <div style="width: 50%; float:left">
                    <html:submit styleId="buttons">Submit</html:submit>
                </div>
                <div style="width: 50%; float:right">
                    <html:reset  styleId="buttons">Reset</html:reset>
                </div>
            </div>

        </html:form>
    </div>
    </body>
</html>