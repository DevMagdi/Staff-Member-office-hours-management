<%-- 
    Document   : login
    Created on : Jan 19, 2021, 1:32:16 PM
    Author     : access
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
<title>Login Page</title>
<script src="https://www.google.com/recaptcha/api.js"></script>
</head>
<body class="mt-10">
    <div class="m-auto text-center mt-5" style="margin: 10px 0 0 10px; width: 400px">
        
            <form action="LoginServlet" method="post"class="mt-5 border px-4 py-5" style="padding: 10px;">
                <h3>Member Login</h3>
                <table class="w-100">
                    <tbody>
                        <tr>

                        </tr>
                         <tr>
                            <td><input type="text" placeholder="Your ID"
                                name="id" class="form-control mt-2" /> <span
                                id="usernameErrorMsg" class="text-danger"></span></td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td><input type="text" placeholder="Password" name="password"
                                class="form-control mt-2" /> <span id="nameErrorMsg"
                                class="text-danger"></span></td>
                        </tr>
                        <tr></tr>

                    </tbody>
                <tr></tr>
            </table><br><br>
            <div class="g-recaptcha"
                 data-sitekey="6Ldb4jIaAAAAAFF_zNHth-qV38Kqm60E-uZptJjd"></div>
            <br> <input type="submit" class="btn btn-primary" value="Login">
        </form>
    </div>
</body>
<script type="text/javascript">
 
    $(document).ready(function() {$("#mail").live("blur",function(e) {
                                                $('#msg').hide();
                                                if ($('#mail').val() == null || $('#mail').val() == "") {
                                                    $('#msg').show();
                                                    $("#msg").html("Email is required field.").css("color", "red");
                                                }
             
            messages: {
                mail: {
                    required: "Please enter email",
                    mail: "Please enter a valid email address"
                },
                 
                password: "Please enter password"
            }
        });
 
    });
</script>
</html>

