	function changeImage(imagename,imagesrc)
	{
		if (ver == "n2") return false;
		document.images[imagename].src=imagesrc.src;
		return true;
	}
	
	bName = navigator.appName;
    bVer = parseInt(navigator.appVersion);

	if      (bName == "Netscape" && bVer >= 3) ver = "n3";
        else if (bName == "Netscape" && bVer == 2) ver = "n2";
        else if (bName == "Microsoft Internet Explorer" && bVer >= 3) ver = "n3";
	else if (bName == "Microsoft Internet Explorer" && bVer < 3) ver = "n2";
	if (ver != "n2") {
		
		buttonoffa = new Image();
		buttonoffa.src = "/images/survivalkids/SurvivalKidsPageon_04.jpg";
		buttonona = new Image ();
		buttonona.src = "/images/survivalkids/SurvivalKidsPage_04.jpg";
		
		buttonoffb = new Image();
		buttonoffb.src = "/images/survivalkids/SurvivalKidsPageon_07.jpg";
		buttononb = new Image ();
		buttononb.src = "/images/survivalkids/SurvivalKidsPage_07.jpg";
		
		buttonoffc = new Image();
		buttonoffc.src = "/images/survivalkids/SurvivalKidsPageon_09.jpg";
		buttononc = new Image ();
		buttononc.src = "/images/survivalkids/SurvivalKidsPage_09.jpg";

		buttonoffd = new Image();
		buttonoffd.src = "/images/survivalkids/SurvivalKidsPageon_11.jpg";
		buttonond = new Image ();
		buttonond.src = "/images/survivalkids/SurvivalKidsPage_11.jpg";
		
	
	} else {
		buttonoff = "";
		buttonon = "";
	
	}


