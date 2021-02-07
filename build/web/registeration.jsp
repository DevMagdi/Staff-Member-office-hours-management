 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
     <html>
    <head>
    <meta charset="ISO-8859-1">
    <title>Registration Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js"></script>
    </head>
    <script>
        function validateForm() {
        if (document.forms["myForm"]["id"].value == "") {
        /* document.getElementById('usernameErrorMsg').innerHTML='Username must be filled out'; */
        alert("id must be filled out")
        document.forms["myForm"]["id"].focus();
        return false;
        } else {
        document.getElementById('idErrorMsg').classList.add('d-none');
        }

        if (document.forms["myForm"]["id"].value.length <= 6) {
        alert("id minium of 6 character")
        document.forms["myForm"]["id"].focus();
        return false;
        } else {
        document.getElementById('idErrorMsg').classList.add('d-none');
        }

        if (document.forms["myForm"]["name"].value == "") {
        alert("Name must be filled out")
        document.forms["myForm"]["name"].focus();
        return false;
        } else {
        document.getElementById('nameErrorMsg').classList.add('d-none');
        }

        if (document.forms["myForm"]["mail"].value == "") {
        alert("Email must be filled out")
        document.forms["myForm"]["mail"].focus();
        return false;
        } else {
        document.getElementById('emailErrorMsg').classList.add('d-none');
         }

                if (document.forms["myForm"]["mobile"].value == "") {
                  alert("Mobile must be filled out")
                    document.forms["myForm"]["mobile"].focus();
                           return false;
                   } else {
                   document.getElementById('mobileErrorMsg').classList.add('d-none');
                  }

                  if (document.forms["myForm"]["mobile"].value.length <= 9) {
                       alert("Mobile must be 10 digit")
                       document.forms["myForm"]["mobile"].focus();
                   return false;
                          } else {
                         document.getElementById('mobileErrorMsg').classList.add('d-none');
                     }

            if (!(/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im
                    .test(+document.forms["myForm"]["mobile"].value))) {
                alert("Mobile number should be numeric only")
                document.forms["myForm"]["mobile"].focus();
                return false;
            }
               }
          </script>



          <body class="mt-10">
    <%
        String login_msg1 = (String) request.getAttribute("ErrorForUserName");
        if (login_msg1 != null)
            out.println("<font color=green size=4px>" + login_msg1 + "</font>");
    %>
    <div class="m-auto text-center mt-5" style="margin: 10px 0 0 10px; width: 400px">
        <form action="registeration" id="signupform" name="myForm" method="post" class="mt-5 border px-4 py-5" onsubmit="return validateForm()" style="padding: 10px;">
            <h3>Member SignUp</h3>
            <table class="w-100">
                <tbody>
                    <tr>
                        <td><input type="text" placeholder="create id"
                            name="id" class="form-control mt-2" /> <span
                            id="usernameErrorMsg" class="text-danger"></span></td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td><input type="text" placeholder="name" name="name"
                            class="form-control mt-2" /> <span id="nameErrorMsg"
                            class="text-danger"></span></td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td><input type="text" placeholder="mail" name="mail"
                            class="form-control mt-2" /> <span id="msg" class="text-danger"></span></td>
                        <!-- <span id="msg"></span> -->
                    </tr>
                    <tr></tr>
                    <tr>
                        <td><input type="text" placeholder="mobile number"
                            name="mobile" class="form-control mt-2" /> <span
                            id="mobileErrorMsg" class="text-danger"></span></td>
                    </tr>
                    <tr></tr>
                    
                    <tr></tr>
                </tbody>
                <tr></tr>
                
            </table><br><br>
            <div class="g-recaptcha"
			data-sitekey="6Ldb4jIaAAAAAFF_zNHth-qV38Kqm60E-uZptJjd"></div><br>
            <button type="submit" name="submit" class="btn btn-primary" onsubmit="validate()">Register</button>
            <button type="reset" name="cancel" class="btn btn-primary">Cancel</button><br>
            <br /> Already Registered? <a href="login.jsp" class="mb-2">Login</a><br>
        </form>
    </div>


    <script type="text/javascript">
        $(document).ready(function validate() {$("#mail").live("blur",function(e) {
                                                $('#msg').hide();
                                                if ($('#mail').val() == null || $('#mail').val() == "") {
                                                    $('#msg').show();
                                                    $("#msg").html("Email is required field.").css("color", "red");
                                                } else {
                                                    $.ajax({
                                                                type : "POST",
                                                                url : "http://localhost:8080/MyWebProject/src/com/myWebProject/UserDetails/Registration",
                                                                data : $('#signupform').serialize(),
                                                                dataType : "html",
                                                                cache : false,
                                                                success : function(msg) {
                                                                    $('#msg').show();
                                                                    $("#msg").html(msg);
                                                                },
                                                                error : function(jqXHR,textStatus,errorThrown) {
                                                                    $('#msg').show();
                                                                    $("#msg").html(textStatus+ " "+ errorThrown);
                                                                }
                                                            });
                                                }
                                            });
                        });
    </script>