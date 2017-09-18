$(function () {
    if (typeof ValidatorUpdateDisplay != 'undefined') {
        var originalValidatorUpdateDisplay = ValidatorUpdateDisplay;

        ValidatorUpdateDisplay = function (val) {
            if (val.isvalid) {
                $("#" + val.controltovalidate).css("border", "1px solid green");
            }

            originalValidatorUpdateDisplay(val);
        }
    }
});
$(function () {
    if (typeof ValidatorUpdateDisplay != 'undefined') {
        var originalValidatorUpdateDisplay = ValidatorUpdateDisplay;

        ValidatorUpdateDisplay = function (val) {           
            if (!val.isvalid) {
                $("#" + val.controltovalidate).css("border", "1px solid red");
            }

            originalValidatorUpdateDisplay(val);
        }
    }
});
