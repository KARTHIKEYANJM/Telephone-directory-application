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

.search-title {
    border-radius: 20px;
    line-height:80px;
    font-size: 40px;
    letter-spacing: 2px;
    font-weight: bold;
    color: #FDF;
    background: -webkit-linear-gradient(#27EF9F, #0DB8DE);
}

button {
	border-radius: 20px;
	border: 1px solid #1901F0;
	background-color: #1901F0;
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

.cards {
    border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin: 0;
  padding: 0;
  text-align: center;
  
  @media(max-width: 550px) {
    flex-direction: column;
  }
}

.card {
  position: relative;
  width: 31.33333%;
  margin: 1%;
  background: whiteSmoke;
  border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
  
  @media (max-width: 815px) {
    width: 48%;
  }
  
  @media (max-width: 550px) {
    width: 100%;
  }

  &__inner {
    position: relative;
    background: url("https://unsplash.it/400?random") no-repeat;
    background-size: cover;
    overflow: hidden;

    h2 {
      color: white;
      margin: 0;
      padding: 30% 0;
      text-shadow: 1px 1px 3px #000;
      line-height: 18px;
      text-transform: uppercase;
      
      small {
        font-style: italic;
        display: inherit;
      }
    }
  
  }

  &__buttons {
    position: absolute;
    width: 100%;
    transform: translateY(0);
    transition: transform .5s ease;

    a {
      position: relative;
      float: left;
      width: 50%;
      padding: 10px;
      text-decoration: none;
      color: black;
      border-top: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
      
      &:first-child {
        background: #fff;
        border-right: 1px solid #ccc;
      }
      
      &:last-child {
        background: #ffde00;
      }
      
      &:hover {
        color: #ffde00;
        background: #000;
      }
      
    }

  }
  
  &:hover {
    .card__buttons {
      transform: translateY(-38px);
    }
  }

  &__tagline {
    font-size: 1rem;
    font-weight: 100;
  }
  
  &__icons {
    margin: 0 0 50px;
    padding: 0;
    list-style: none;
    
    li {
      display: inline-block;
      padding: 0 10px 10px;
    }
    
    .fa {
      font-size: .8rem;
      
      &:before {
        font-size: 1.2rem;
        display: block;
        padding-bottom: 5px;
      }
    }
    
  }
  
  p {
    position: absolute;
    bottom: 0;
    text-align: center;
    width: 100%;
  }
  
}
  </style>

</head>

<body>
<div>
    <!--<span style="float:left;" class="login-key">  <i class="fa fa-phone" aria-hidden="true"></i> </span>&ensp;-->
    <span class="search-title">
        &nbsp;Admin Portal&nbsp;
    </span><br><br>
</div>

<%
    String welcome = null;
    if(request.getAttribute("Greeting")!=null){
        welcome = (String)request.getAttribute("Greeting");
    }
    if(welcome!=null){
%>
<div class="alert1">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%out.println(welcome);%></strong>             
</div>
  <% }%>
<%
    String delete1 = null;
    if(request.getAttribute("Message1")!=null){
        delete1 = (String)request.getAttribute("Message1");
    }
    if(delete1!=null){
%>
<div class="alert1">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%out.println(delete1);%></strong>             
</div>
  <% }%>  
  
<ul class="cards">
  <li class="card">
    <div class="card__inner">
      <h2>User Addition</h2>
      <div class="card__buttons">
        <a href="admin_insert.jsp"><h1>Go</h1></a>
      </div>
    </div>
    <h3 class="card__tagline">Add a new user to the Database</h3>
    <span><i class="fa fa-address-card" aria-hidden="true"></i> </span>
  </li>
  <li class="card">
    <div class="card__inner">
      <h2>User Deletion</h2>
      <div class="card__buttons">
        <a href="admin_delete.jsp"><h1>Go</h1></a>
      </div>
    </div>
    <h3 class="card__tagline">Delete a user data from Database</h3>
    <span><i class="fa fa-address-card" aria-hidden="true"></i> </span>
  </li>
  <li class="card">
    <div class="card__inner">
      <h2>User Search</h2>
      <div class="card__buttons">
        <a href="search_portal.jsp"><h1>Go</h1></a>
      </div>
    </div>
    <h3 class="card__tagline">Search for a user from Database</h3>
    <span><i class="fa fa-address-card" aria-hidden="true"></i> </span>
  </li>  
</ul>
    <br><br>
    <div class="button" id="button">
        <form action="logout.jsp" method="get">
            <button type="submit">Home</button>
        </form>
  </div>

</body>
</html>



