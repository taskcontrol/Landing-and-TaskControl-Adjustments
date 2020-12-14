

   <style>
        * {
            margin: 0;
            padding: 0;
        }
        .banner-cookie {
            display: flex;
            background: #f4f4f4;
            width: 100%;
            padding: 15px;
            box-sizing: border-box;
            box-shadow: 0 -3px 7px #606060;
            position: fixed;
            bottom: 0;
            left: 0;
            align-items: center;
            justify-content: center;
            z-index: 999999999;
        }
        .banner-cookie .aceptar-cookie {
            background: #056ccb;
            border: 0;
            font-size: 16px; 
            color: #fff;
            padding: 7px 10px;
            border-radius: 15px;
            margin: 0 20px;
            cursor: pointer;
        }
        .banner-cookie .close-cookie {
            background: transparent;
            border: 0;
            font-size: 18px;
            color: #606060;
            cursor: pointer;
        }
    </style>

    <?php if (!isset($_COOKIE["allow_cookie"])) { ?>
        <div class="banner-cookie">
            <div>Utilizamos cookies para mejorar su experiencia de navegación - <a href="#">Obtenga más información</a>. 
            Si sigue navegando en este sitio implica que usted acepta nuestro uso de las cookies.</div>
            <div>
                <button class="aceptar-cookie">ACEPTAR</button>
            </div>
            <div>
                <button class="close-cookie">X</button>
            </div>
            <div class="php-cookie"></div>
        </div>
    <?php } ?>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>

        $(document).ready(function(){

            $(".close-cookie").click(function(){
                $(".banner-cookie").remove();
            });

            $(".aceptar-cookie").click(function(){
                $(".banner-cookie").remove();
                $.post( "set-cookie.php", function( data ) {
                });
            });

        });

    </script>
