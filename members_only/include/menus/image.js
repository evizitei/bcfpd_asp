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
		buttonoffa.src = "/images/top_template/left_navigation/aboutoff.gif";
		buttonona = new Image ();
		buttonona.src = "/images/top_template/left_navigation/abouton.gif";
		
		buttonoffb = new Image();
		buttonoffb.src = "/images/top_template/left_navigation/servicesoff.gif";
		buttononb = new Image ();
		buttononb.src = "/images/top_template/left_navigation/serviceson.gif";
		
		buttonoffc = new Image();
		buttonoffc.src = "/images/top_template/left_navigation/kidsoff.gif";
		buttononc = new Image ();
		buttononc.src = "/images/top_template/left_navigation/kidson.gif";
		
		buttonoffd = new Image();
		buttonoffd.src = "/images/top_template/left_navigation/task1off.gif";
		buttonond = new Image ();
		buttonond.src = "/images/top_template/left_navigation/task1on.gif";
		
		buttonoffe = new Image();
		buttonoffe.src = "/images/top_template/left_navigation/wildlandoff.gif";
		buttonone = new Image ();
		buttonone.src = "/images/top_template/left_navigation/wildlandon.gif";
		
		buttonofff = new Image();
		buttonofff.src = "/images/top_template/left_navigation/perservoff.gif";
		buttononf = new Image ();
		buttononf.src = "/images/top_template/left_navigation/perservon.gif";
		
		buttonoffg = new Image();
		buttonoffg.src = "/images/top_template/left_navigation/emrg_prepoff.gif";
		buttonong = new Image ();
		buttonong.src = "/images/top_template/left_navigation/emrg_prepon.gif";
	
		buttonoffh = new Image();
		buttonoffh.src = "/images/top_template/left_navigation/TrainingInteriorOFF.gif";
		buttononh = new Image ();
		buttononh.src = "/images/top_template/left_navigation/TrainingInteriorON.gif";
		
	} else {
		buttonoff = "";
		buttonon = "";
	
	}


