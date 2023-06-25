<!DOCTYPE html>
<html>
    <head>
        <title>Članak</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="icon" type="image/x-icon" href="slike/favicon.ico">
        <script src="https://kit.fontawesome.com/b05e340512.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="jquery-1.11.0.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script src="forma.js"></script>
        <script> 
            $(function(){
              $("#header").load("header.php");
              $("#footer").load("footer.html");
            });
        </script>
        <?php
            if(isset($_GET['id'])){
                $id = $_GET['id'];
                $dbc = mysqli_connect("localhost", "root","", "projektni") or die("Greška pri spajanju na bazu.".mysqli_connect_errno());

                $sql = "SELECT kategorija, naslov, datum, slika, uvod, tekst FROM vijesti WHERE id = ?";

                $stmt = mysqli_stmt_init($dbc);

                if(mysqli_stmt_prepare($stmt, $sql)){
                    mysqli_stmt_bind_param($stmt,'i', $id);
                    mysqli_stmt_execute($stmt);
                    mysqli_stmt_store_result($stmt);
                }
                mysqli_stmt_bind_result($stmt, $kategorija, $naslov, $datum, $slika, $uvod, $tekst);
                mysqli_stmt_fetch($stmt);

                session_start();
                $_SESSION['id'] = $id;
            }
        ?>
        <style>
            .link[title^='<?php echo $kategorija;?>']{
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
                    <h2><?php echo $kategorija;?></h2>
                </div>
                <div class="sadrzajArticle">
                    <div class="tekst"><h3><?php echo $naslov;?></h3></div>
                    <div class="datum"><?php echo date("d.m.Y", strtotime($datum));?></div>
                    <div class="slika">
                        <img src="slike/<?php echo $slika;?>" alt="nogomet" width="100%">
                    </div>
                    <div class="tekst">
                        <p class="uvod">
                            <?php echo $uvod;?>
                        </p>
                        <pre><?php echo $tekst ?></pre>
                    </div>
                </div>
            </article>
        </content>

        <div id="footer"></div>
    </body>
</html>