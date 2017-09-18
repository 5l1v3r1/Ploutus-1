    function resetFields(form1) {
        $(':input', form1).each(function () {
            var type = this.type;
            var tag = this.tagName.toLowerCase(); 
            
            // normalize case
            // to reset the value attr of text inputs,
            // password inputs, fileUpload and textareas
            if (type == 'text' || type == 'password' || tag == 'textarea' || type == 'file')
                this.value = "";
            // checkboxes and radios need to have their checked state cleared                
            else if (type == 'checkbox' || type == 'radio')
                this.checked = false;
            // select elements need to have their 'selectedIndex' property set to -1
            // (this works for both single and multiple select elements)
            else if (tag == 'select')
                this.selectedIndex = 0;
        });
    }

