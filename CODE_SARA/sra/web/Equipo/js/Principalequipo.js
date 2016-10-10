$(document).on('ready',function(){
    console.log("Vivo??EquipoPrincipal");
    
    
    $("ul:li ").click(
                function () {
                    alert($(this).val());
                }
        );
    $("seleciona li").on('click',function(){
        var j= this.val();
        alert("s"+j);
    });
});

