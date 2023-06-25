<!DOCTYPE html>
<html>
    <head>
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
            if(isset($_GET['kateg'])){
                $kategorija = $_GET['kateg'];
            }
            session_start();
        ?>
        <title><?php echo $kategorija; ?></title>
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
                    <h2><?php echo $kategorija; ?></h2>
                </div>

                <?php
                    ispisiKategoriju($kategorija);
                ?>
            </article>
        </content>

        <?php
            function ispisiKategoriju($kategorija){
                $dbc = mysqli_connect("localhost","root","","projektni") or die("Greška pri spajanju na bazu.".mysqli_connect_errno());

                $sql = "SELECT * FROM vijesti WHERE kategorija = '$kategorija' ORDER BY datum desc, id desc";
    
                $result = mysqli_query($dbc, $sql) or die("Greška pri slanju upita na bazu.");
    
                if($result){
                    while($row = mysqli_fetch_array($result)){
                        echo "<a class='clanakButton' href='clanak.php?id=".$row['id']."'><div class='sadrzaj'>
                        <div class='slika'>
                            <img src='slike/".$row['slika']."' alt='' width='100%'>
                        </div>
                        <div class='tekst'>
                            <h3>".$row['naslov']."</h3>
                            <pre width='width:100%;overflow:auto'>".$row['uvod']."</pre>
                        </div>
                    </div></a>";
                    }
                }
            }
        ?>

        <div id="footer"></div>
    </body>
</html>