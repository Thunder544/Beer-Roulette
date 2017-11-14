<!DOCTYPE html>
<html>

<head>
	<title>BEER ROULETTE!</title>
	<link rel="stylesheet" type="text/css" href="static/default.css">
</head>

<body>
<div class="wrapper">
	<div align="center">
			<h1 align="center" style="color: #404040">Beer Roulette?</h1>
			<p></p>
	</div>
	<u><h2 align="center">Added Beers</h2></u>
	<p></p>
	<div align="center">
%for i in range(len(beers)):
	<ul>
	{{beers[i]}}
	</ul>
%end
	</div>
	<div align="center">
			<form action="/add" method="post">
			<p class="text-info text-center">Enter beer here!
			<input type="text" name="beer">
			<input type="submit" value="Add Beer">
			</p>
			</form>
			<form action ="/pick" method="post">
			<p class="text-info text-center">PICK!
			<input type="submit" value="Pick Beer">
			</p>
			</form>
			<form action="/remove" method="post">
			<input type="submit" value="Remove Last Beer">
			</form>
	</div>
	<div align="center">
	<u><h2>Chosen Beers</h2></u>
	<p></p>
%for i in range(len(consumed)):

	<ul>
	{{consumed[i]}}
	</ul>
%end
	</div>
</div>
</body>
</html>
