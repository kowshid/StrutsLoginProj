<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<html>
    <head>
        <script>
            function validateForm()
            {
                var username, password;

                username = document.querySelector("input[name=username]");
                password = document.querySelector("input[name=password]");

                console.log(username.value, password.value);

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
                return true;
            }
        </script>
<%--        <link rel="stylesheet"  type="text/css" href="../css/styles.css"/>--%>
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
            .login {
                background-color: #FFFFFF;
                width: 400px;
                height: 475px;
                margin: 4em auto;
                border-radius: 1.5em;
                box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
            }
            #username, #password {
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
            #signupInLoginPage {
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
            #action_btn {
                width: 200px;
                margin: 0 auto;
                display: inline;
            }
            #buttons {
                cursor: pointer;
                border-radius: 5em;
                color: #fff;
                background: linear-gradient(to right, #9C27B0, #E040FB);
                border: 0;
                padding: 10px 30px;
                font-family: 'Ubuntu', sans-serif;
                margin: 1%;
                font-size: 13px;
                box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
            }
        </style>
        <title>Login</title>
    </head>
    <body>
    <div class="login">
        <h2 align="center">Login Form</h2>
        <html:form action="/submitLogin"> <%--onsubmit="validateForm()"--%>
<%--            <div style="color:red">--%>
<%--                <html:errors/>--%>
<%--            </div>--%>

            <div id="username">
                <p>Username<br></p>
                <html:text property="username"/>
            </div>

            <div id="password">
                <p>Password<br></p>
                <html:text property="password"/>
            </div>

<%--            <div id="buttons" align="center">--%>
<%--                <html:submit>Submit</html:submit>--%>
<%--                <html:reset>Reset</html:reset>--%>
<%--            </div>--%>

        <div id="action_btn" align="center">
            <div>
                <html:submit styleId="buttons">Submit</html:submit>
            </div>
            <div>
                <html:reset styleId="buttons">Reset</html:reset>
            </div>
        </div>
        </html:form>

        <div id="signupInLoginPage">
            Don't have account?<br>
            <html:link action="/signup">Click here to Signup
            </html:link>
        </div>
    </div>
    </body>
</html>