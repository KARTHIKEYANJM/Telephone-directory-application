<%@page import="java.util.ArrayList"%>
<%@page import="mypack.Userdetails"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>PhoneBook</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	width: 900px;
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


.hm-gradient {
    background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);
    background: #EFE19A;
        background: -webkit-linear-gradient(to left, #F17B81, #E9A12F);
	background: linear-gradient(to left, #F17B81, #E9A12F);
}
.darken-grey-text {
    color: #2E2E2E;
}
.input-group.md-form.form-sm.form-2 input {
    border: 1px solid #DDDDDD;
    border-top-left-radius: 0.25rem;
    border-bottom-left-radius: 0.25rem;
}
.input-group.md-form.form-sm.form-2 input.purple-border {
    border: 1px solid #DDDDDD;
}
.input-group.md-form.form-sm.form-2 input[type=text]:focus:not([readonly]).purple-border {
    border: 1px solid #DDDDDD;
    box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
}
.form-2 .input-group-addon {
    border: 1px solid #DDDDDD;
}
.danger-text {
    color: #ff3547; 
}  
.success-text {
    color: #00C851; 
}
.table-bordered.red-border, .table-bordered.red-border th, .table-bordered.red-border td {
    border: 1px solid #ff3547!important;
}        
.table.table-bordered th {
    text-align: center;
}

  </style>

</head>

<body class="hm-gradient">
    
    <main>
        
        <!--MDB Tables-->
        <div class="container mt-4">
            
            <div class="card mb-4">
                <div class="card-body">
                    <!-- Grid row -->
                    <div class="row">
                        <!-- Grid column -->
                        <div class="col-md-12">
                            <h2 class="pt-3 pb-4 text-center font-bold font-up danger-text"><b>Phonebook Directory</b></h2>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                    <%
                                List<Userdetails> list = (ArrayList<Userdetails>)request.getAttribute("Output_data");%>
                    <table class="table table-bordered red-border text-center">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>First Name</th>
                                <th>last Name</th>
                                <th>Phone Number</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>Pincode</th>
                            </tr>
                        </thead>
                        <%
                                Userdetails ud = new Userdetails();
                                
                            if(list!=null){
                                for(int i=0;i<list.size();i++) {
                                    ud = list.get(i);%>
                        <tbody>
                            
                                    <tr>
                                <th scope="row"><%=i+1%></th>
                                <td><%=ud.getFirstname()%></td>
                                <td><%=ud.getLastname()%></td>
                                <td><%=ud.getPhoneNumber()%></td>
                                <td><%=ud.getAddress()%></td>
                                <td><%=ud.getCity()%></td>
                                <td><%=ud.getPin()%></td>
                            </tr>
                               
                                <%}
                            }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>      
    </main>  
</body>
</html>

