<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Signup for BidsRush!</title>
        <link rel="stylesheet" href="./css/startpage.css">
        <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="./img/favicon.ico" type="image/x-icon">            
        <% session.removeAttribute("active_tab"); %>
    </head>
    <body>
        
        
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
            <img src="./img/logo/logo_350x150.png" class="logo" alt="Logo 350x150"/>
        </div>
        <div class="form">
        <div id="signup">   
                    <form id="myForm" action="RegistrationServlet" method="post" name="register_form">

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
                            <input type="text" placeholder="Email" name="email" id="emailInput" required/>

                        </div>
                        <input type="hidden" name="hiddenInput" id="hiddenInput" value="your_value_here">
                        <div class="top-row">
                            <div class="field-wrap">
                                <input type="text" placeholder="Hostel" name="loc" required/>

                            </div>

                            <div class="field-wrap">
                                <input type="text" placeholder="Room Number" name="country" required/>

                            </div>
                        </div>

                        <div class="top-row">
                            <div class="field-wrap">
                                <input type="text" placeholder="Phone" name="phone" required/>

                            </div>

                            <div class="field-wrap">
                                <input type="text" placeholder="Bits ID" name="tin" required/>

                            </div>
                        </div>
                        <button type="submit" class="button button-block"/>Register Now!</button>

                    </form>

                </div>
        </div>    
            
    </body>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script>
        
      // document.addEventListener('DOMContentLoaded', disableAndSetEmail);  
        
        let params = {};

let regex = /([^&=]+)=([^&]*)/g,m;

while(m = regex.exec(location.href)){
    params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
}

if(Object.keys(params).length>0){
    localStorage.setItem('authInfo',JSON.stringify(params));
}

window.history.pushState({},document.title,"/"+"signup.jsp");

let info = JSON.parse(localStorage.getItem('authInfo'));
console.log(JSON.parse(localStorage.getItem('authInfo')));
console.log(info['access_token']);
console.log(info['expires_in']);

console.log(info);
fetch("https://www.googleapis.com/oauth2/v3/userinfo", {
    headers: {
        "Authorization": "Bearer" + info['access_token']
    }
})
.then((response) => {
    if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
    }
    return response.json();
})
.then((info) => {
    console.log(info);
    
    var emailInput = document.getElementById('emailInput');
     emailInput.value = info.email; // Replace with your desired value
     emailInput.disabled = true; // Disable the input field
     document.getElementById("hiddenInput").value = info.email;
})
.catch((error) => {
    console.log('Fetch Error:', error);
});
emailInput.value = info.email;
//function disableAndSetEmail() {
 //       var emailInput = document.getElementById('emailInput');
   //     emailInput.value = info.email; // Replace with your desired value
   //     emailInput.disabled = true; // Disable the input field
   // }

   
function logout(){
    //alert("hello")
    fetch("https://oauth2.googleapis.com/revoke?token=" + info['access_token'],{
        method: 'POST',
        headers:{
            'Content-type' : 'application/x-www-form-urlencoded'
        }
    }) 
    .then((data)=>{
        location.href = "http://localhost:8080/startpage.jsp"
    })
}
    </script>
    
</html>
