// JScript File


// Declaring valid date character, minimum year and maximum year
var dtCh= "/";
var minYear=1800;
var maxYear=2300;

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

function isDate(dtStr){

	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	//if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
	if (strYear.length != 4 || year==0){
		alert("Please enter a valid 4 digit year")
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
return true
}

function isDatewithminmax(dtStr,minYear,maxYear){
   // alert("Inside isDt()");
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
return true
}

//function ValidateForm(){
//	var dt=document.frmSample.txtDate
//	if (isDate(dt.value)==false){
//		dt.focus()
//		return false
//	}
//    return true
// }

function Datecompare(dtStr,minDate,maxDate){
 var start = new Date (minDate);
	var end = new Date (maxDate);
	var dt = new Date (dtStr);
	
        if (dt<start) 
        { 
        alert ("The date that you have entered is outside of the eligible birth date range.  "+ minDate +" - "+ maxDate);
        //return false
        }
        else if (dt>end) 
        {
         alert ("The date that you have entered is outside of the eligible birth date range.  "+ minDate +" - "+ maxDate);
        //return false
        }
        return true
}


function IsNumeric(sText)
{
   var ValidChars = "0123456789.";
   var IsNumber=true;
   var Char;

 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
         alert("Please enter a valid numeic value")
         IsNumber = false;
         }
      }
   return IsNumber;
   
   }



//========= function to trim spaces in beginning and end of string =========
   function trimWhiteSpace(str)
   {
       while(str.charAt(0) == (" ") )
          {  str = str.substring(1);
          }
          while(str.charAt(str.length-1) == " " )
          {  str = str.substring(0,str.length-1);
          }
          return str;
   }
   


///phone check

function checkPhone(ph)
     {
        var txtUPhNo=ph;
        
        if(trimWhiteSpace(txtUPhNo)== "")
        {
            return true;
        }
       
        if(trimWhiteSpace(txtUPhNo).length > 12)
        {
            alert("Phone Number entered should be 12 characters in length including hyphen.");
           
            return false;
        }
        
        if(trimWhiteSpace(txtUPhNo).length < 10)
        {
            alert("Phone Number entered should be 10 digits in length excluding hyphen.");
            
            return false; 
        }
          
        if(trimWhiteSpace(txtUPhNo).length == 10)
        {
            if(isNaN(trimWhiteSpace(txtUPhNo))==true)
            {
                alert("Phone number entered should be in numeric and nnn-nnn-nnnn format.");
                
                return false;
            }
             
        }
       
        if(trimWhiteSpace(txtUPhNo).length == 11)
        {
            alert("Phone Number entered should be either 10 (without hyphen) or 12 characterts (with hyphen).");
            
            return false; 
        }
       
        if(trimWhiteSpace(txtUPhNo).length == 12)
        {
            var regEx=(/^[1-9]\d{2}-\d{3}-\d{4}$/);       
            if (txtUPhNo.search(regEx)==-1) //if match failed
            {
                alert("Please enter a valid Phone Number in nnn-nnn-nnnn format.");
                
                return false;
            }
        }
        return true;
     }
     
     function IsDigit(sText)
{
   var ValidChars = "0123456789";
   var IsNumber=true;
   var Char;

 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
         alert("Please enter a valid Digit")
         IsNumber = false;
         }
      }
   return IsNumber;
   
   }
   //date function allow 99 also
   function isDatewithminmax99(dtStr,minYear,maxYear){
   // alert("Inside isDt()");
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
	    if(month!=99)
	    {
		alert("Please enter a valid month")
		return false
		}
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		if(day!=99)
		{
		alert("Please enter a valid day")
		return false
		}
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
return true
}