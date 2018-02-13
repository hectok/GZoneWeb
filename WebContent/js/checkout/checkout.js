$( document ).ready ( function ()
{
    console.log ( 'ready!' );
    $('[data-toggle="tooltip"]').tooltip();
    var template = $( '#template' ).html ();
    Mustache.parse ( template );
    var rendered = Mustache.render ( template, get_basket () );
    $( '#template' ).html ( rendered );
    if ( $('.basket-body').hasScrollBar () )
    {
        $('.column-titles').addClass('fix-overflow');
        $('.basket-body').niceScroll({autohidemode: false,cursorcolor:"#ffffff",cursorborder:"1px solid #D0D0D0",cursorborderradius: "0",background: "#ffffff"});
    }
    else
    {
        $('.column-titles').removeClass('fix-overflow');
    }

    $('.card-expiration').datepicker({
    format: "mm/yyyy",
    startView: "months",
    minViewMode: "months"
});
});

function get_basket ()
{
    var products =
    [

        { name: "The Witcher 3", additional: "Métete en la piel de un cazarrecompensas marginado que busca a la protagonista...", quantity: 1, unit: "pc", price: 59.99, thumbnail: "/GZoneWeb/images/thewitcher.jpg" },
        { name: "Alien : Isolation", additional: "Descubre el verdadero significado del terror en Alien: Isolation", quantity: 1, unit: "pc", price: 17.00, thumbnail: "/GZoneWeb/images/alien.jpg" },
        { name: "CupHead", additional: "Cuphead es un juego de acción clásico estilo dispara y corre que se centra en combates contra el jefe. ", quantity: 1, unit: "pc", price: 19.99, thumbnail: "/GZoneWeb/images/cuphead.jpg" },

    ]
    return { "products": products, "order_number": "1-23-456789A", "subtotal": 96.98, "taxes": 2.06, "total":99.04, "currency": "&euro;" };
}

(function($) {
    $.fn.hasScrollBar = function() {
        return this.get(0).scrollHeight > this.height();
    }
})(jQuery);
