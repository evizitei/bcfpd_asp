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
		buttonoffa.src = "/images/front_page/homeaboutoff.gif";
		buttonona = new Image ();
		buttonona.src = "/images/front_page/homeabouton.gif";
		
		buttonoffb = new Image();
		buttonoffb.src = "/images/front_page/homeservicesoff.gif";
		buttononb = new Image ();
		buttononb.src = "/images/front_page/homeserviceson.gif";
		
		buttonoffc = new Image();
		buttonoffc.src = "/images/front_page/homekidsoff.gif";
		buttononc = new Image ();
		buttononc.src = "/images/front_page/homekidson.gif";
		
		buttonoffd = new Image();
		buttonoffd.src = "/images/front_page/hometask1off.gif";
		buttonond = new Image ();
		buttonond.src = "/images/front_page/hometask1on.gif";
		
		buttonoffe = new Image();
		buttonoffe.src = "/images/front_page/homewildlandoff.gif";
		buttonone = new Image ();
		buttonone.src = "/images/front_page/homewildlandon.gif";
		
		buttonofff = new Image();
		buttonofff.src = "/images/front_page/homeperservoff.gif";
		buttononf = new Image ();
		buttononf.src = "/images/front_page/homeperservon.gif";
		
		buttonoffg = new Image();
		buttonoffg.src = "/images/front_page/homejoinoff.gif";
		buttonong = new Image ();
		buttonong.src = "/images/front_page/homejoinon.gif";
		
		buttonoffh = new Image();
		buttonoffh.src = "/images/front_page/EmrgPrepOFF.gif";
		buttononh = new Image ();
		buttononh.src = "/images/front_page/EmrgPrepON.gif";

		buttonoffi = new Image();
		buttonoffi.src = "/images/front_page/Training-OFF.gif";
		buttononi = new Image ();
		buttononi.src = "/images/front_page/Training-ON.gif";

		
	} else {
		buttonoff = "";
		buttonon = "";
	
	}


