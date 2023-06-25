$(function(){
    $("form[name='forma']").validate({
        rules:{
            ime:{
                required:true,
                minlength:2,
                maxlength:32
            },
            prez:{
                required:true,
                minlength:2,
                maxlength:32
            },
            korisnicko:{
                required:true,
                minlength:5
            },
            lozinka:{
                minlength:5,
                required:true
            },
            lozinka2:{
                equalTo:"#lozinka",
                required:true
            }
        },
        messages:{
            ime:{
                required: "Ime je obavezno",
                minlength: "Ime mora imati najmanje 2 slova",
                maxlength : "Ime mora imati manje od 32 slova"
            },
            prez:{
                required: "Prezime je obavezno",
                minlength: "Prezime mora imati najmanje 2 slova",
                maxlength : "Prezime mora imati manje od 32 slova"
            },
            korisnicko:{
                required: "Korisničko ime je obavezno",
                minlength: "Korisničko ime mora imati najmanje 5 znakova"
            },
            lozinka:{
                required: "Lozinka je obavezna",
                minlength: "Lozinka mora imati najmanje 5 znakova"
            },
            lozinka2:{
                required: "Ponovljena lozinka je obavezna",
                equalTo: "Ponovljena lozinka mora biti jednaka ko prva lozinka"
            }
        },
        errorPlacement: function(error, element){
            if(element.attr("name") == "ime"){
                $("#imeSpan").html(error);
            }
            if(element.attr("name") == "prez"){
                $("#prezSpan").html(error);
            }
            if(element.attr("name") == "korisnicko"){
                $("#korisnickoSpan").html(error);
            }
            if(element.attr("name") == "lozinka"){
                $("#lozinkaSpan").html(error);
            }
            if(element.attr("name") == "lozinka2"){
                $("#lozinka2Span").html(error);
            }
        },
        submitHangler: function(form){
            form.submit();
        }
    })
})