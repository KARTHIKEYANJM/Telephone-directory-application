<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>PhoneBook</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

* {
	box-sizing: border-box;
}

body {
	background: #EFE19A;
        background: -webkit-linear-gradient(to left, #F17B81, #E9A12F);
	background: linear-gradient(to left, #F17B81, #E9A12F);
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
}

.alert {
  padding: 20px;
  background-color: #E11A22;
  color: white;
  border-radius: 10px;
}
.alert1 {
  padding: 20px;
  background-color: #00F200;
  color: white;
  border-radius: 10px;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}

h1 {
	font-weight: bold;
	margin: 0;
}

h2 {
	text-align: center;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}

a {
	color: #333;
	font-size: 14px;
	text-decoration: none;
	margin: 15px 0;
}

button {
	border-radius: 20px;
	border: 1px solid #FF4B2B;
	background-color: #FF4B2B;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
	position: relative;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 480px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@keyframes show {
	0%, 49.99% {
		opacity: 0;
		z-index: 1;
	}
	
	50%, 100% {
		opacity: 1;
		z-index: 5;
	}
}

.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container{
	transform: translateX(-100%);
}

.overlay {
	background: #EFE19A;
        background: -webkit-linear-gradient(to left, #F17B81, #E9A12F);
	background: linear-gradient(to left,#F17B81, #E9A12F);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
  	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
  	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}

.social-container {
	margin: 20px 0;
}

.social-container a {
	border: 1px solid #DDDDDD;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 40px;
	width: 40px;
}

footer {
    background-color: #222;
    color: #fff;
    font-size: 14px;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
}

footer i {
    color: red;
}

footer a {
    color: #3c97bf;
    text-decoration: none;
}
.login-key {
    height: 80px;
    font-size: 70px;
    line-height: 10px;
    background: -webkit-linear-gradient(#27EF9F, #0DB8DE);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
.login-title {
    border-radius: 20px;
    line-height:80px;
    font-size: 40px;
    letter-spacing: 2px;
    font-weight: bold;
    color: #FDF;
    background: -webkit-linear-gradient(#27EF9F, #0DB8DE);
}
.space{
    position: relative;
    left:23px;
}
.vertical-center-one {
  text-shadow: 6px 6px 0px rgba(0,0,0,0.2);
  margin: 0;
  position: relative;
  top: -3%;
  left:-13px;
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}
.vertical-center-two {
  text-shadow: 6px 6px 0px rgba(0,0,0,0.2);
  margin: 0;
  position: relative;
  top:1%;
  -ms-ransform: translateY(-50%);
  transform: translateY(-50%);
}
  </style>

</head>

<body>
    
<div>
    <!--<span style="float:left;" class="login-key">  <i class="fa fa-phone" aria-hidden="true"></i> </span>&ensp;-->
    <span class="login-title">
        &nbsp;PhoneBook&nbsp;
    </span>
</div>

    <h2 class="space">Digital version of Telephone Directory</h2>
    <%
        String msg = null;
        if(request.getAttribute("Warning")!=null){
            msg = (String)request.getAttribute("Warning");
        }
        if(msg!=null){
        %>
        <div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%out.println(msg);%></strong>             
</div>
        <% }%>
        <%
        String msg1 = null;
        if(request.getAttribute("Success")!=null){
            msg1 = (String)request.getAttribute("Success");
        }
        if(msg1!=null){
        %>
        <div class="alert1">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%out.println(msg1);%></strong>             
</div>
        <% }%>
        <%
        String msg3 = null;
        if(request.getAttribute("Logfail")!=null){
            msg3 = (String)request.getAttribute("Logfail");
        }
        if(msg3!=null){
        %>
        <div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%out.println(msg3);%></strong>             
</div>
        <% }%>
    <div class="container" id="container">
	<div class="form-container sign-up-container">
            <form action="user_register" method="get">
			<h1>Create Account</h1>
			<span>------------------------------------------</span>
			<span>Please provide your data for registration</span>
                        <span>------------------------------------------</span>
			<input type="text" placeholder="Name" name="name" />
			<input type="text" placeholder="Username" name="uname"/>
			<input type="password" placeholder="Password" name="pswd"/>
			<button>Sign Up</button>
		</form>
	</div>
        
	<div class="form-container sign-in-container">
            <form action="user_valid_servlet" method="post">
			<h1>Sign in</h1>
			<span>-----------------------------------------</span>
                        <span>Please enter your valid credentials</span>
                        <span>-----------------------------------------</span>
			<input type="text" placeholder="UserName" name="uname"/>
			<input type="password" placeholder="Password" name="pswd"/>
			<a href="admin_login.jsp"><b>Administrative Login?</b></a>
			<button type="submit">Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1 style="text-shadow: 6px 6px 0px rgba(0,0,0,0.2)">Welcome to the Registration Portal</h1>
                                <h4 style='font-family:"Georgia";'>
                                  _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
                                </h4>
				<button class="ghost" id="signIn">Log In and Go :)</button>
			</div>
			<div class="overlay-panel overlay-right">
				
                            <span class="vertical-center-one"><h1>Not a User Yet?</h1></span>
                            <span class="vertical-center-two"><h1>Nothing to worry</h1></span>
                           
                            <h4 style='font-family:"Georgia";'>
                                Registration portal right this way.
                            </h4>
				<button class="ghost" id="signUp">Sign Up - It's Free :)</button>
			</div>
		</div>
	</div>
</div>

<footer>
	<p>
		
	</p>
</footer>

<script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});
    
</script>

</body>
</html>

