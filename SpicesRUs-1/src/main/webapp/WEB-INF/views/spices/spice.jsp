<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>

<script>


	function setMyHref(){

		var selectedSize = document.getElementById("size").value;
		var selectedQuantity = document.getElementById("quantity").value;
		document.getElementById("addHref").href += selectedSize + "/" +selectedQuantity;	

	}

	function calculateOptionPrice(){

		var selectedSize = document.getElementById("size").value;
		var selectedQuantity = document.getElementById("quantity").value;

		var spicePrice= 0;

		var basePrice = 0;
		
		if(selectedSize == "small"){
			spicePrice =  ${spice.basePricePerKG} * selectedQuantity * (${smallPrice}/1000) ;
			basePrice = ${spice.basePricePerKG} * ${smallRatio}
		}
		else if(selectedSize == "medium"){
			spicePrice =  ${spice.basePricePerKG} * selectedQuantity * (${mediumPrice}/1000);
			basePrice = ${spice.basePricePerKG} * ${mediumRatio}
		}
		else if(selectedSize == "large"){
			
			spicePrice = ${spice.basePricePerKG} * selectedQuantity * (${largePrice}/1000) ;
			basePrice = ${spice.basePricePerKG} * ${largeRatio}
		}

		spicePrice = spicePrice.toFixed(2);
		basePrice = basePrice.toFixed(2);
		
		document.getElementById("totalPrice").innerHTML = spicePrice;
		document.getElementById("basePrice").innerHTML = basePrice;

	}

	

</script>
<meta charset="utf-8" />
<title>Spices R Us</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/spice_page.css">
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400&display=swap"
	rel="stylesheet" />
</head>
<body onload="calculateOptionPrice()" onchange="calculateOptionPrice()">




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
				src="${pageContext.request.contextPath}/images/glass_spice.jpg" 
				style="height: auto;"
				
				/>
		</div>

		<div class="top_section">
			<div class="left_section">
				<img style="width: 315px; height: 315px; object-fit: cover;"
					src="${spice.image}">
			</div>
			<div class="right_section">
				<h1 class="spice_heading">${spice.name}</h1>
				
				<p>${spice.description}</p>
				<p style="padding: 10px 0 10px 0;'">${spice.name} originated in
					${spice.region}. ${spice.description}</p>
				<p>${spice.name} pairs well with:</p>
				<ul>
					<c:forEach items="${spice.compliment_spices}" var="compliment">
						<li class="compliment_list_item"><a
							href="/spices/${compliment}">${compliment}</a></li>
					</c:forEach>
		
				</ul>
				<p>Packet Sizes:</p>
				<ul>
				
					<li> <p>Small: ${smallSize}</p> </li>
					<li> <p>Medium: ${mediumSize} </p> </li>
					<li> <p>Large: ${largeSize} </p> </li>
			
				</ul>
				
					
				<h2>Price Per KG: £<span id="basePrice"></span></h2>
				
				

				<div class="basket">
					
						<!-- set action to add to basket in basket controller. -->
					<label for="quantity">Quantity: </label> <input type="number"
						id="quantity" name="quantity" value=1> <label for="size">Size:
					</label> <select id="size" name="size">
						<option selected value="small">small</option>
						<option value="medium">medium</option>
						<option value="large">large</option>
					</select>
					
					<a id="addHref" href="/basket/add/${spice.id}/" onclick="setMyHref()">Add To Basket</a>
				</div>
				
				<h1>Total Price: £<span id="totalPrice"></span></h1>
				
		
				
			</div>
			
		</div>
	</div>

</body>
</html>
