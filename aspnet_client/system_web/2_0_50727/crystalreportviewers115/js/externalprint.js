
var objectTag = "<OBJECT ID=\"CrystalPrintControl\" CLASSID=\"CLSID:19529B56-E206-4f0b-B44E-97B5F4861E6A\" CODEBASE=\"";
objectTag += window.dialogArguments.codebase;
objectTag += "#Version=";
objectTag += IE_PRINT_CONTROL_PRODUCTVERSION;
objectTag += "\" VIEWASTEXT>";

if (window.dialogArguments.lcid) {
    objectTag +="<PARAM NAME=\"LocaleID\" VALUE=\"";
    objectTag += window.dialogArguments.lcid;
    objectTag += "\">";
}

if (window.dialogArguments.url) {
    objectTag +="<PARAM NAME=\"URL\" VALUE=\"";
    objectTag += window.dialogArguments.url;
    objectTag += "\">";
}

if (window.dialogArguments.postbackdata) {
    objectTag += "<PARAM NAME=\"PostBackData\" VALUE=\"";
    objectTag += window.dialogArguments.postbackdata;
    objectTag += "\">";
}

if (window.dialogArguments.title) {
    objectTag +="<PARAM NAME=\"Title\" VALUE=\"";
    objectTag += window.dialogArguments.title;
    objectTag += "\">";
}

if (window.dialogArguments.maxpage) {
    objectTag +="<PARAM NAME=\"MaxPageNumber\" VALUE=\"";
    objectTag += window.dialogArguments.maxpage;
    objectTag += "\">";
}

if (window.dialogArguments.paperorientation) {
    objectTag +="<PARAM NAME=\"PageOrientation\" VALUE=\"";
    objectTag += window.dialogArguments.paperorientation;
    objectTag += "\">";
}

if (window.dialogArguments.papersize) {
    objectTag +="<PARAM NAME=\"PaperSize\" VALUE=\"";
    objectTag += window.dialogArguments.papersize;
    objectTag += "\">";
}

if (window.dialogArguments.drivername) {
    objectTag +="<PARAM NAME=\"PrinterDriverName\" VALUE=\"";
    objectTag += window.dialogArguments.drivername;
    objectTag += "\">";
}

if (window.dialogArguments.usedefprinter) {
    objectTag +="<PARAM NAME=\"UseDefaultPrinter\" VALUE=\"";
    objectTag += window.dialogArguments.usedefprinter;
    objectTag += "\">";
}

if (window.dialogArguments.usedefprintersettings) {
    objectTag +="<PARAM NAME=\"UseDefaultPrinterSettings\" VALUE=\"";
    objectTag += window.dialogArguments.usedefprintersettings;
    objectTag += "\">";
}

if (window.dialogArguments.sendpostdataonce) {
    objectTag +="<PARAM NAME=\"SendPostDataOnce\" VALUE=\"";
    objectTag += window.dialogArguments.sendpostdataonce;
    objectTag += "\">";
}

objectTag += "</OBJECT>";

document.writeln(objectTag);
