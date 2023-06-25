$(function(){
    $("form[name='forma']").validate({
        rules:{
            naslov:{
                required:true,
                minlength:5,
                maxlength:30
            },
            uvod:{
                required:true,
                minlength:10,
                maxlength:100
            },
            clanak:{
                required:true
            },
            slika:{
                required:true
            },
            kategorija:{
                required:true
            }
        },
        messages:{
            naslov:{
                required: "Naslov je obavezan",
                minlength: "Naslov mora imati najmanje 5 znakova",
                maxlength : "Naslov mora imati manje od 30 znakova"
            },
            uvod:{
                required: "Uvod je obavezan",
                minlength: "Uvod mora imati najmanje 10 znakova",
                maxlength : "Uvod mora imati manje od 100 znakova"
            },
            clanak:{
                required: "Clanak je obavezan"
            },
            slika:{
                required: "Slika je obavezna"
            },
            kategorija:{
                required: "Kategorija je obavezna"
            }
        },
        errorPlacement: function(error, element){
            if(element.attr("name") == "naslov"){
                $("#naslovSpan").html(error);
            }
            if(element.attr("name") == "uvod"){
                $("#uvodSpan").html(error);
            }
            if(element.attr("name") == "clanak"){
                $("#clanakSpan").html(error);
            }
            if(element.attr("name") == "slika"){
                $("#slikaSpan").html(error);
            }
            if(element.attr("name") == "kategorija"){
                $("#kategorijaSpan").html(error);
            }
        },
        submitHangler: function(form){
            form.submit();
        }
    })
})