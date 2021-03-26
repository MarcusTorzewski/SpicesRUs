
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<li><a href="/spices">Spices</a></li>
			<li><a href="/recipes"
				style="text-decoration: underline rgb(68, 68, 68);">Recipes</a></li>
			<li><a href="#">Discussion Forum</a></li>
			<li><a href="#">Sign-in</a></li>
			<li><a href="#">Basket</a></li>
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
					<a style="right:150px" href="/checkout"> <h1> Checkout</h1> </a>
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

</body>
</html>


