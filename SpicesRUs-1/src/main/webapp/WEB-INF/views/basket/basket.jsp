
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Spices R Us</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/recipe_page.css">
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400&display=swap"
	rel="stylesheet" />
</head>

<style>

.box{

	border: 3px solid black;

}
.listItem{
	
	padding: 15px;
	


}
.h2{

	font-size: 40px;
	


}

.h3{

	font-size: 40px;
	
}

.h4{

	font-weight: bold;
	
}	

.pageButton{

	background-color: #999999;
  	border: 3px solid black;
  	padding: 10px 20px;
  	text-align: center;
  	display: inline-block;
  	font-size: 18px;
}

.spacing{
	padding:15px;

}

.show-modal {
  font-size: 2rem;
  font-weight: 600;
  padding: 1.75rem 3.5rem;
  margin: 5rem 2rem;
  border: none;
  background-color: #fff;
  color: #444;
  border-radius: 10rem;
  cursor: pointer;
}

.close-modal {
  position: absolute;
  top: 1.2rem;
  right: 2rem;
  font-size: 5rem;
  color: #333;
  cursor: pointer;
  border: none;
  background: none;
}

h1 {
  font-size: 2.5rem;
  margin-bottom: 2rem;
}

p {
  font-size: 1.8rem;
}

/* -------------------------- */
/* CLASSES TO MAKE MODAL WORK */
.hidden {
  display: none;
}

.modal {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 70%;

  background-color: white;
  padding: 6rem;
  border-radius: 5px;
  box-shadow: 0 3rem 5rem rgba(0, 0, 0, 0.3);
  z-index: 10;
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  
  z-index: 5;
}


</style>
<body>
	<div>
		<ul class="nav">
			<div id="logo">
				<a href="/"> <img height="70px"
					src="${pageContext.request.contextPath}/images/SpicesRUs_logo.png" />
				</a>
			</div>
			<li><a href="/about">About Us</a></li>
			<li><a href="/spices"
				style="text-decoration: underline rgb(68, 68, 68);">Spices</a></li>
			<li><a href="/recipes">Recipes</a></li>
			<li><a href="#">Discussion Forum</a></li>
			<sec:authorize access="hasRole('MEMBER')">
      			<li><a href="/account">My Account</a>
    			<li><a href="/logout">Sign Out</a>
    		</sec:authorize>
	  		<sec:authorize access="!hasRole('MEMBER')">
      			<li><a href="/login-form">Sign-in</a></li>
    		</sec:authorize>
			<li><a href="/basket">Basket</a></li>
		</ul>

		<div class="banner">
			<img class="banner-image"
				src="${pageContext.request.contextPath}/images/spices_background.jpg" />
		</div>

		<!-- Top info section -->

		<div class="top_section">
		
			<div class="left_section" style="right: 300px;">
			
			
		
				<div  class="pageButton" >
					<p style="display:inline-block text-align: center;"><h1> BasketTotal = £${basket.basketTotalValue} </h1> </p>
					<!-- <a style="right:150px" href="/checkout"> <h1> Checkout</h1> </a> -->
					<button class="show-modal">Checkout</button>
				</div>
				
				
				<div  class="left_section">
				
					<form>
  						<label style="font-size: 35px;"for="username"> Promo Code: </label><br>
  				
  						<input type="text" id="username" name="username" style=" display: block; width: 160px; height: 30px; float:left;" ><br>
  						
  						<div class="spacing">
				
						</div>
				
  						<a class="pageButton" href="/checkPromo"> <h1> Submit</h1> </a>
  						
					</form>	
				
				
				
				</div>
				
			

			</div>
			
			
			<!-- Hidden Checkout -->
			
			<div class="modal hidden">
      <button class="close-modal">&times;</button>
      <h1>Checkout Confirmation</h1>
      <p>
        Please enter payment details <br />
      </p>
      <form:form action="/createCheckout"
      modelAttribute="checkout">
      
      <form:label path="name">Full Name: </form:label><br>
      <form:input path="name"/><br><br>
      
      <form:label path="ccNumber">Full Credit Card Number: </form:label><br>
  		<form:input path="ccNumber"/><br><br>
  		
  		<form:label path="postCode">Postcode: </form:label><br>
  		<form:input path="postCode"/><br><br>
  		<form:hidden path="totalValue" value="${basket.basketTotalValue}" />
  		<input type="submit" value="Submit"/>
  		</form:form>
    </div>
    <div class="overlay hidden"></div>
			
			<div class="right_section">
				<h1 class="basket">Basket</h1>
				
				<ul>
				
					<c:forEach items="${basket.items}" var="bask" varStatus="loop">
					
				
						<div class="left_section">
								<img style="width:206px;height:230px;object-fit:cover;"  src="${bask.spice.image}">
						</div>
					
						<div class = "right_section">
						
									
							<li class="listItem">
							
								<div class = "box">
								
									<a href="/spices/${bask.spice.name}"> <h2> ${bask.spice.name} </h2> </a>
									<h4>Size: ${bask.size}</h4>
									<h4>Amount: ${bask.quantity}</h4>
									<h4> Price: ${bask.price}</h4>
									<a href="/basket/removeItem/${loop.index}"> <h3> Remove </h3> </a>			
					
								</div>
										
							</li>
						</div>
				
					</c:forEach>
					
				
				</ul>
				
				<div class="right_section">
					<a class="pageButton" style=" display: block; float:left;" href="/emptybasket"> <h1> Empty Basket</h1> </a>
				</div>
				
				
				
				

			</div>
			
			
			
	
		</div>
<script> 

'use strict';

const modal = document.querySelector('.modal');
const overlay = document.querySelector('.overlay');
const btnCloseModal = document.querySelector('.close-modal');
const btnsOpenModal = document.querySelectorAll('.show-modal');

const openModal = function () {
  modal.classList.remove('hidden');
  overlay.classList.remove('hidden');
};

const closeModal = function () {
  modal.classList.add('hidden');
  overlay.classList.add('hidden');
};

for (let i = 0; i < btnsOpenModal.length; i++)
  btnsOpenModal[i].addEventListener('click', openModal);

btnCloseModal.addEventListener('click', closeModal);


document.addEventListener('keydown', function (e) {


  if (e.key === 'Escape' && !modal.classList.contains('hidden')) {
    closeModal();
  }
});


</script>
</body>
</html>


