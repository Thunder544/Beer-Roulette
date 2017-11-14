<!DOCTYPE html>
<html>

<head>
        <title>BEER ROULETTE!</title>
        <link rel="stylesheet" type="text/css" href="static/default.css">
		<script>
			var beerAry = [];
			var pickedAry = [];
			function addBeer(){
				var id = beerAry.length;
				var beer = document.getElementById("beer").value;
				beerAry.push(String(beer));
				list = document.createElement("LI");
				list.setAttribute("id", "list"+String(id));
				beer = beerAry[id];
				id++;
				text = document.createTextNode(String(beer));
				list.appendChild(text);
				document.getElementById("roulette").appendChild(list);
				printBeers();
			}
			
			function printBeers(){
				var len = beerAry.length;
				//var pickedLen = pickedAry.length;
				var list, beer, text, node;
				if(len > 0){
					for(i = 0; i < len; i++)
					{
						node = document.getElementById("list"+String(i));
						node.parentNode.removeChild(node);
					}
				}
				
				for(i = 0; i < len; i++)
				{
					list = document.createElement("LI");
					list.setAttribute("id", "list"+String(i));
					beer = beerAry[i];
					text = document.createTextNode(String(beer));
					list.appendChild(text);
					
					document.getElementById("roulette").appendChild(list);
				}
				
			}
			
			function pickBeer(){
				var rndVal = beerAry[Math.floor(Math.random() * beerAry.length) % beerAry.length];
				var index = beerAry.indexOf(rndVal);
				var len = beerAry.length;
				var node;
				var i = 0;
				pickedAry.push(String(beerAry[index]));
				if(len > 0){
					node = document.getElementById("list"+String(index));
					node.parentNode.removeChild(node);
					for(i = index+1; i < len; i++)
					{
						node = document.getElementById("list"+String(i));
						node.setAttribute("id", "list"+String(i-1));
					}
					
					var list = document.createElement("LI");
					list.setAttribute("id", "picked"+String(i));
					var text = document.createTextNode(String(rndVal));
					list.appendChild(text);
					document.getElementById("picked").appendChild(list);
				}
				if(index > -1){
					beerAry.splice(index,1);
				}
				
				printBeers();
				i++;
			}
			
			function removeLast(){
				var len = beerAry.length;
				if(len > 0){
					node = document.getElementById("list"+String(len-1));
					node.parentNode.removeChild(node);
				}
				if(len > -1){
					beerAry.splice(len-1,1);
				}
				printBeers();
			}
		</script>
		
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
				<ul style="list-style-type: none;" id="roulette">
				</ul>
        </div>
        <div align="center">
                        
                        <p class="text-info text-center">Enter beer here!
                        <input type="text" id="beer">
						
                        <input type="button" onclick="addBeer()" value="Submit" />
						</p>
                        
                        <p class="text-info text-center">PICK!
                        <input type="button" onclick="pickBeer()" value="Pick Beer">
                        </p>
                        
                        <input type="button" onclick="removeLast()" value="Remove Last Beer">
        </div>
        <div align="center">
        <u><h2>Chosen Beers</h2></u>
        <p></p>
				<ul style="list-style-type: none;" id="picked">
				</ul>
        </div>
</div>
</body>
</html>
