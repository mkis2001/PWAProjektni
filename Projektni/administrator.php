<!DOCTYPE html>
<html>
    <head>
        <title>Administracija</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="icon" type="image/x-icon" href="slike/favicon.ico">
        <script src="https://kit.fontawesome.com/b05e340512.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="jquery-1.11.0.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script> 
            $(function(){
              $("#header").load("header.php");
              $("#footer").load("footer.html");
            });
        </script>
        <script src="forma.js"></script>
        <style>
            .link[title^="administracija"]{
                border-bottom: 4px solid var(--primary);
                transition: var(--tran);
            }
        </style>
        <?php 
            session_start();
            $id = $_SESSION['id'];
            $prikazuj;
            $kategorija;
            $naslov;
            $slika;
            $uvod;
            $tekst;
            $gumb;
            $dbc = mysqli_connect("localhost", "root","", "projektni") or die("Greška pri spajanju na bazu.".mysqli_connect_errno());

            $sql = "SELECT prikazuj, kategorija, naslov, slika, uvod, tekst FROM vijesti WHERE id = ?";

            $stmt = mysqli_stmt_init($dbc);

            if(mysqli_stmt_prepare($stmt, $sql)){
                mysqli_stmt_bind_param($stmt,'i', $id);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_store_result($stmt);
            }
            mysqli_stmt_bind_result($stmt, $prikazuj, $kategorija, $naslov, $slika, $uvod, $tekst);
            mysqli_stmt_fetch($stmt);
        ?>
    </head>
    <body>
        <div id="header"></div>

        <content>
        <article>
            <div class="naslovSekcija"><h2>Unos</h2></div>
                <div class="sadrzajArticle" style="align-items: center;">
                    <form action="administrator.php" method="post" name="forma" class="forma">
                        
                        <label for="naslov">Naslov</label>
                        <input type="text" id="naslov" name="naslov" value="<?php echo $naslov; ?>">
                        <span id="naslovSpan"></span>
                        <div class="hrDiv"></div>

                        <label for="uvod">Sažetak</label>
                        <textarea rows="4" cols="50" name="uvod" id="uvod"><?php echo $uvod; ?></textarea>
                        <span id="uvodSpan"></span>
                        <div class="hrDiv"></div>

                        <label for="clanak">Članak</label>
                        <textarea rows="8" cols="50" name="clanak" id="clanak"><?php echo $tekst; ?></textarea>
                        <span id="clanakSpan"></span>
                        <div class="hrDiv"></div>

                        <label for="kategorija">Kategorija</label>
                        <select name="kategorija" id="kategorija" name="kategorija">
                            <option value="" disabled selected>--Odaberi kategoriju--</option>
                            <option value="sport" <?php 
                                if($kategorija == "sport"){
                                    echo "selected";
                                }
                            ?>>Sport</option>
                            <option value="politika" <?php 
                                if($kategorija == "politika"){
                                    echo "selected";
                                }
                            ?>>Politika</option>
                        </select>
                        <span id="kategorijaSpan"></span>
                        <div class="hrDiv"></div>

                        <label for="slika">Slika</label>
                        <input type="file" name="slika" id="slika">
                        <span id="slikaSpan"></span>
                        <div class="hrDiv"></div>

                        <div>
                            <label for="check">Prikaži sadržaj na stranici: </label>
                            <input type="checkbox" name="check"
                                <?php
                                    if($prikazuj == 1){
                                        echo "checked";
                                    }
                                ?>
                            >
                        </div>
                        <div class="hrDiv"></div>
                        <div>
                        <button type="submit" value="unesi" id="unesi" name="gumb">Unesi</button>
                        <button name="gumb" value="odustani" class="ponisti" formnovalidate="formnovalidate">Odustani</button>
                        <button name="gumb" id="obrisi" value="obrisi" class="ponisti" formnovalidate="formnovalidate"><i class="fa-regular fa-trash-can"></i></button>
                        </div>
                    </form>
                </div>
            </article>
        </content>
        <script src="forma.js"></script>
        <script>
            document.getElementById("obrisi").onclick = function(event){
                if(!confirm("Želite li obrisati članak?")){
                    event.preventDefault();
                }
            }
        </script>
        <?php
            if(isset($_POST['gumb'])){
                $gumb = $_POST['gumb'];
                if($gumb == 'obrisi'){
                    $query = "DELETE FROM vijesti WHERE id = '".$id."'";
                    $result = mysqli_query($dbc, $query);
                    mysqli_close($dbc);
                    echo "<script>location.replace('index.php')</script>";
                }else if($gumb == 'odustani'){
                    echo "<script>location.replace('administracija.php')</script>";
                }else if($gumb == 'unesi'){
                    if(isset($_POST['check'])){
                        $prikazuj = 1;
                    }else{
                        $prikazuj = 0;
                    }
                    $slika = $_POST['slika'];
                    $naslov = $_POST['naslov'];
                    $kategorija = $_POST['kategorija'];
                    $uvod = $_POST['uvod'];
                    $tekst = $_POST['clanak'];
                    $query = "UPDATE vijesti SET prikazuj = '$prikazuj', kategorija = '$kategorija', naslov = '$naslov', slika = '$slika', uvod = '$uvod', tekst = '$tekst' WHERE id = '$id'";
                    $result = mysqli_query($dbc, $query) or die("Greška pri slanju upita na bazu!");
                    mysqli_close($dbc);
                    echo "<script>location.replace('index.php')</script>";
                }
            }
        ?>

        <div id="footer"></div>
    </body>
</html>