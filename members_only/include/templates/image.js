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
		buttonoffa.src = "/images/members/MEMBERaboutoff.gif";
		buttonona = new Image ();
		buttonona.src = "/images/members/MEMBERabouton.gif";
		
		buttonoffb = new Image();
		buttonoffb.src = "/images/members/MEMBERservicesoff.gif";
		buttononb = new Image ();
		buttononb.src = "/images/members/MEMBERserviceson.gif";
		
		buttonoffc = new Image();
		buttonoffc.src = "/images/members/MEMBERkidsoff.gif";
		buttononc = new Image ();
		buttononc.src = "/images/members/MEMBERkidson.gif";
		
		buttonoffd = new Image();
		buttonoffd.src = "/images/members/MEMBERtaskoff.gif";
		buttonond = new Image ();
		buttonond.src = "/images/members/MEMBERtaskon.gif";
		
		buttonoffe = new Image();
		buttonoffe.src = "/images/members/MEMBERwildlandoff.gif";
		buttonone = new Image ();
		buttonone.src = "/images/members/MEMBERwildlandon.gif";
		
		buttonofff = new Image();
		buttonofff.src = "/images/members/MEMBERperservoff.gif";
		buttononf = new Image ();
		buttononf.src = "/images/members/MEMBERperservon.gif";
		
		buttonoffg = new Image();
		buttonoffg.src = "/images/members/MEMBERemergprepOFF.gif";
		buttonong = new Image ();
		buttonong.src = "/images/members/MEMBERemergprepON.gif";
	
		buttonoffh = new Image();
		buttonoffh.src = "/images/members/TrainingOFF.gif";
		buttononh = new Image ();
		buttononh.src = "/images/members/TrainingON.gif";
		
	} else {
		buttonoff = "";
		buttonon = "";
	
	}


