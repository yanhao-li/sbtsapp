<!-- This file displays the login form-->
<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
    <!-- The jsp:useBean action tag is used to locate or instantiate a bean class. If bean object of the Bean class is already created, it doesn't create the bean depending on the scope. But if object of bean is not created, it instantiates the bean. -->
    <jsp:useBean id="shared" scope="session" class="sbtsapp.Shared" />

<!-- Javascript form to check for invalid characters-->
<script>
    //create a function to validate the username and password, avoid the injected script.
    function ValidateForm(form) {

    //Get the values from the user input, login is the name of the form
    var Email = document.login.email.value;
    var Password = document.login.password.value;

    //Checks that alphanumerics are entered for email and password
    var enumeric = Email.search(/\w+/);
    var pnumeric = Password.search(/\w/);
    if (enumeric != 0) {
        alert('You have entered an invalid character for email');
        document.login.email.focus();
        return false;
    }

    if (pnumeric != 0) {
        alert('You have entered an invalid character for password');
        document.login.password.focus();
        return false;
    }
    return true;
    }
</script>
</head>
                            <jsp:getProperty name="shared" property="message"/>  <!--retrieves the error message from the shared bean -->
                            <jsp:getProperty name="shared" property="error"/>  <!--retrieves the error data from the shared bean -->
                            <jsp:setProperty name="shared" property="message" value=""/><!-- empty error message from the shared bean -->
                            <jsp:setProperty name="shared" property="error" value=""/> <!-- empty error data from the shared bean -->

 <!-- Change Background color-->
<body class="login-page">
    <div class="container-fluid">
        <div class="main">
            <h1 align = "center" style="color: #fff; padding-bottom: 20px;">SBTS</h1>
            <!-- Form to retrieve user input and send it to the Login servlet, by set action = "Login" -->
            <form  Method="POST" name = "login" onSubmit= "return ValidateForm(this);" action= "Login" class="login-panel">
                <div class="form-group">
                    <input type="text" id= "Email" name="Email" required="required" class="form-control" placeholder="Email (withought @kean.edu)">
                </div>
                <div class="form-group">
                    <input type="password" id= "Password" name="Password" required="required" class="form-control" placeholder="Password">
                </div>
                <input type="submit" value="Submit" name= "Submit" class="btn btn-primary" style="width: 100%; margin-top: 20px;">
            </form>
        </div>
        <div class="footer">
            <img  align = "center" src= "resource/images/logo.png" alt = "Kean Logo" width="50px" style="float: right; margin-top: 5px;">
            <p style="float: left; margin: 0;">
                Kean University <br>
                Department of Computer Science<br>
                CPS 4931: Distributed Systems <br>
                Prof. Stewart-Gardiner
            </p>
        </div>
    </div>
</body>
</html>
