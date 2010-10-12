
//	
	var Animate = true;
	var SpreadRate = 10;
	var DelayRate = 20;
	var Portion;

	var useragent = navigator.userAgent;
	var BrowserName = navigator.appName;
	var BrowserVersion = parseInt(navigator.appVersion);

	function Display(id, x, y) {
		if ((BrowserName == "Netscape") && (BrowserVersion < 5)) {
			document.layers[id].visibility = "show";
			document.layers[id].top = y;
			document.layers[id].left = x;			
		}
		else if ((BrowserName == "Netscape") && (BrowserVersion >= 5)) {
				var CurrentMenu = document.getElementById(id);
				CurrentMenu.style.left = x;
				CurrentMenu.style.top = y;
				CurrentMenu.style.display = "inline";

		}
		else{
			if ((BrowserName == "Microsoft Internet Explorer") && (BrowserVersion >= 4)) {
				if (useragent.indexOf("Mac") != -1) {
					document.all('Support').style.display = "none";
					document.all('Facilities').style.display = "none";
					document.all('Specialty').style.display = "none";
					document.all('Suppression').style.display = "none";
					document.all('Prevention').style.display = "none";
					if(id != "") {
						document.all(id).style.left = (x - 12);
						document.all(id).style.top = (y - 19);			
						document.all(id).style.display = "block";
					}
				}
				else {
					if(id != "") {
						var CurrentMenu = document.all(id);
						//alert(CurrentMenu.id);
				
						if (CurrentMenu == AnimatedMenu) {
							window.event.cancelBubble = true;
							return false;
						}

				
						if (AnimatedMenu != null){
							AnimatedMenu.style.display = "none";
						}
						else{
							alert("null");
						}

				
						window.event.cancelBubble = true;


						if( x < 0) {
							x = document.body.clientWidth + x;
						}
		
						//alert(CurrentMenu.id);
						CurrentMenu.style.left = x;
						CurrentMenu.style.top = y;
						AnimatedMenu = CurrentMenu;

						if (Animate) {
							CurrentMenu.style.clip = "rect(0 0 0 0)";
							CurrentMenu.style.display = "block";
							Portion = SpreadRate;
							window.setTimeout("showMenu()", DelayRate);
						}
						else {
							AnimatedMenu.style.display = "";
						}
					}
				}
			}
		}
	}

	function showMenu() {
		AnimatedMenu.style.clip = "rect(0 "+ Portion + "% " + Portion + "% 0)"
		Portion += SpreadRate;
		Portion<=100?window.setTimeout("showMenu()",DelayRate):null	
	}

	function Hide(id){
		if ((BrowserName == "Netscape") && (BrowserVersion < 5)) {
			document.layers[id].visibility = "hide";
		}
		else if ((BrowserName == "Netscape") && (BrowserVersion >= 5)) {
				var CurrentMenu = document.getElementById(id);
				CurrentMenu.style.display = "none";

		}
		else{
			if ((BrowserName == "Microsoft Internet Explorer") && (BrowserVersion >= 4)) {
				if (useragent.indexOf("Mac") != -1) {
					//alert(document.all(id).style.display);
					document.all(id).style.display = "none";
					//alert(document.all(id).style.display);
				}
				else {				
					AnimatedMenu.style.display = "none";
					AnimatedMenu = StartMenu;
					window.event.cancelBubble = true;
				}
			}
		}
	}

	function keepMenu(){
		window.event.cancelBubble = true;
	}
	
	if (useragent.indexOf("Mac") == -1) {
		document.onmouseover = Hide; 
	}
	else{
		document.onmouseover = Display(''); 
	}
