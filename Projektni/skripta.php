<!DOCTYPE html>
<html>
    <head>
        <title>Skripta</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="icon" type="image/x-icon" href="slike/favicon.ico">
        <script type="text/javascript" src="jquery-1.11.0.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script src="prijava.js"></script>
        <script> 
            $(function(){
              $("#header").load("header.php");
              $("#footer").load("footer.html");
            });
        </script>
        <?php
            session_start();
            $naslov = $_POST['naslov'];
            $kategorija = $_POST['kategorija'];
            $datum = date("d.m.Y");
            $slika = $_POST['slika'];
            $uvod = $_POST['uvod'];
            $clanak = $_POST['clanak'];
            if(isset($_POST['check'])){
                $prikazuj = 1;
            }else{
                $prikazuj = 0;
            }
        ?>
        <style>
            .link[title^="<?php echo $kategorija?>"]{
                border-bottom: 4px solid var(--primary);
                transition: var(--tran);
            }
        </style>
    </head>
    <body>
        <div id="header"></div>

        <content>
            <article>
                <div class="naslovSekcija">
                    <h2><?php echo $kategorija ?></h2>
                </div>
                <div class="sadrzajArticle">
                    <div class="tekst"><h3><?php echo $naslov ?></h3></div>
                    <div class="datum"><?php echo $datum ?></div>
                    <div class="slika">
                        <img src="slike/<?php echo $slika ?>" alt="Slika" width="100%">
                    </div>
                    <div class="tekst">
                        <p class="uvod">
                            <?php echo $uvod ?>
                        </p>
                        <pre><?php echo $clanak ?></pre>
                    </div>
                </div>
            </article>
        </content>

        <?php
            $dbc = mysqli_connect("localhost","root","","projektni") or die("Greška pri spajanju na bazu.".mysqli_connect_errno());

            $sql = "INSERT INTO vijesti (prikazuj, kategorija, naslov, datum, slika, uvod, tekst) VALUES(?,?,?,?,?,?,?)";

            $stmt = mysqli_stmt_init($dbc);

            $datum = date("Y-m-d");

            if(mysqli_stmt_prepare($stmt, $sql)){
                mysqli_stmt_bind_param($stmt, "issssss",$prikazuj, $kategorija, $naslov, $datum, $slika, $uvod, $clanak);
                mysqli_stmt_execute($stmt);
            }

            mysqli_close($dbc);

            if(isset($_GET['sport'])){
                session_start();
                $_SESSION['kategorija'] = 'sport';
                header("location: kategorija.php");
            }

            if(isset($_GET['politika'])){
                session_start();
                $_SESSION['kategorija'] = 'politika';
                header("location: kategorija.php");
            }
        ?>

        <div id="footer"></div>
    </body>
</html>