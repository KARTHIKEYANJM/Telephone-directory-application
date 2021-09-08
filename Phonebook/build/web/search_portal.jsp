<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>PhoneBook</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">-->
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>-->
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
  background-color: #00F200;
  color: white;
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
        &nbsp;Search Portal&nbsp;
    </span>
</div>
    <%
        String msg = null;
        if(request.getAttribute("Message")!=null){
            msg = (String)request.getAttribute("Message");
        }
        if(msg!=null){
        %>
        <div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%out.println(msg);%></strong>             
</div>
        <% }%>
<ul class="cards">
  <li class="card">
    <div class="card__inner">
      <h2>First Name</h2>
      <div class="card__buttons">
        <a href="user_search_fname.jsp"><h1>Search</h1></a>
      </div>
    </div>
    <h3 class="card__tagline">Search by a person's first name</h3>
    <span><i class="fa fa-address-card" aria-hidden="true"></i> </span>
  </li>
  <li class="card">
    <div class="card__inner">
      <h2>Last Name</h2>
      <div class="card__buttons">
        <a href="user_search_lname.jsp"><h1>Search</h1></a>
      </div>
    </div>
    <h3 class="card__tagline">Search by a person's last name</h3>
    <span><i class="fa fa-address-card" aria-hidden="true"></i> </span>
  </li>
  <li class="card">
    <div class="card__inner">
      <h2>Phone Number</h2>
      <div class="card__buttons">
        <a href="user_search_phno.jsp"><h1>Search</h1></a>
      </div>
    </div>
    <h3 class="card__tagline">Search by a person's phone number</h3>
    <span><i class="fa fa-address-card" aria-hidden="true"></i> </span>
  </li>
  <li class="card">
    <div class="card__inner">
      <h2>Address</h2>
      <div class="card__buttons">
        <a href="user_search_addr.jsp"><h1>Search</h1></a>
      </div>
    </div>
    <h3 class="card__tagline">Search by a person's address</h3>
    <span><i class="fa fa-address-card" aria-hidden="true"></i> </span>
  </li>
  <li class="card">
    <div class="card__inner">
      <h2>City</h2>
      <div class="card__buttons">
        <a href="user_search_city.jsp"><h1>Search</h1></a>
      </div>
    </div>
    <h3 class="card__tagline">Search by a person's city</h3>
    <span><i class="fa fa-address-card" aria-hidden="true"></i> </span>
  </li>
  <li class="card">
    <div class="card__inner">
      <h2>Pin Code</h2>
      <div class="card__buttons">
        <a href="user_search_pin.jsp"><h1>Search</h1></a>
      </div>
    </div>
    <h3 class="card__tagline">Search by a person's pincode</h3>
    <span><i class="fa fa-address-card" aria-hidden="true"></i> </span>
  </li>
  
</ul>
    <br><br>
    <div class="button" id="button">
        <form action="logout" method="post">
            <button type="submit">Home</button>
        </form>
  </div>

</body>
</html>


