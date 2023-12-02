<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>BidsRush - Welcome!</title>
        <link rel="stylesheet" href="./css/startpage.css">
        <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="./img/favicon.ico" type="image/x-icon">            
        <% session.removeAttribute("active_tab"); %>
    </head>
    <body>
        <%
            if ((session.getAttribute("user_type") != null) && !(session.getAttribute("user_type").equals("visitor"))) {
                response.sendRedirect("homepage");
            }
        %>

        <%  if (session.getAttribute("error") != null) {
                if (session.getAttribute("error").equals("uname")) { %>
        <script type="text/javascript"> alert("This username doesn't exist. Please try again!");</script>            
        <%      } else if (session.getAttribute("error").equals("pwd")) { %>
        <script type="text/javascript"> alert("Wrong password. Please try again!");</script>            
        <%      } else if (session.getAttribute("error").equals("used_uname")) { %>
        <script type="text/javascript"> alert("Username already taken!");</script>                 
        <%      } else if (session.getAttribute("error").equals("wrong_pwd")) { %>
        <script type="text/javascript"> alert("Passwords don't match. Please try again!");</script>            
        <% }
                session.removeAttribute("error");
            }%>

        <div class="fadeIn first">
            <img src="./img/logo/logo1.png" class="logo" alt="Logo 350x150"/>
        </div>
        <div class="form">
            
           <div class="tab-content">
                <div id="login">    
                    <form action="LoginServlet" method="post">

                        <div class="field-wrap">
                            <input type="text" placeholder="Username" name="usr" required/>
                        </div>

                        <div class="field-wrap">

                            <input type="password" placeholder="Password" name="pwd" required/>
                        </div>
                        <button class="button button-block" type="submit"/>Log In!</button>
                    </form>
                </div>

                <div id="signup">   
                    <form action="RegistrationServlet" method="post" name="register_form">

                        <div class="field-wrap">
                            <input type="text" placeholder="Username" name="uname" required/>

                        </div>

                        <div class="top-row">
                            <div class="field-wrap">
                                <input type="text" placeholder="First Name" name="fname" required/>

                            </div>

                            <div class="field-wrap">
                                <input type="text" placeholder="Last Name" name="lname" required/>

                            </div>
                        </div>

                        <div class="top-row">
                            <div class="field-wrap">
                                <input type="password" placeholder="Password" name="pwd1" required/>

                            </div>

                            <div class="field-wrap">
                                <input type="password" placeholder="Repeat Password" name="pwd2" required/>

                            </div>
                        </div>

                        <div class="field-wrap">
                            <input type="text" placeholder="Email" name="email" required/>

                        </div>

                        <div class="top-row">
                            <div class="field-wrap">
                                <input type="text" placeholder="Location" name="loc" required/>

                            </div>

                            <div class="field-wrap">
                                <input type="text" placeholder="Country" name="country" required/>

                            </div>
                        </div>

                        <div class="top-row">
                            <div class="field-wrap">
                                <input type="text" placeholder="Phone" name="phone" required/>

                            </div>

                            <div class="field-wrap">
                                <input type="text" placeholder="T.I.N." name="tin" required/>

                            </div>
                        </div>
                        <button type="submit" class="button button-block"/>LET'S SHOP!</button>

                    </form>

                </div>
            </div> 
            <form >
                <!-- <input type="hidden" name="registration_flag" value="Y"><br> -->
                <button onclick="signIn()" class="visitor" type="button"/>New here? Sign up now</button>
            </form>
            <form action="LoginServlet" method="post">
                <input type="hidden" name="visitor_flag" value="Y"><br>
                <button class="visitor" type="submit"/>Just a visitor? Click here!</button>
            </form>
        </div>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script>
               function signIn(){

    let outh2Endpoint = "https://accounts.google.com/o/oauth2/v2/auth"

    let form = document.createElement('form')
    form.setAttribute('method','GET')
    form.setAttribute('action',outh2Endpoint)

    let params = {
        "client_id" : "583718560148-aftfkjit2vhdbrv8e8mfebn01khkefn7.apps.googleusercontent.com",
        "redirect_uri": "http://localhost:8080/signup.jsp",
        "response_type" : "token",
        "scope": "https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email",
        "include_granted_scopes" : 'true',
        "state" : 'pass-through-value'
    };

    for(var p in params){
        let input = document.createElement('input');
        input.setAttribute('type','hidden');
        input.setAttribute('name',p);
        input.setAttribute('value',params[p]);
        form.appendChild(input)
    }

    document.body.appendChild(form);

    form.submit();
}
                    
        </script>
    </body>
</html>