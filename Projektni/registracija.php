<!DOCTYPE html>
<html>
    <head>
        <title>Registracija</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="icon" type="image/x-icon" href="slike/favicon.ico">
        <script src="https://kit.fontawesome.com/b05e340512.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="jquery-1.11.0.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script src="prijava.js"></script>
        <?php
            session_start();
        ?>
        <script> 
            $(function(){
              $("#header").load("header.php");
              $("#footer").load("footer.html");
            });
        </script>
        <style>
            .link[title^="prijava"]{
                border-bottom: 4px solid var(--primary);
                transition: var(--tran);
            }
        </style>
    </head>
    <body>
        <div id="header"></div>

        <content>
            <article>
                <div class="naslovSekcija"><h2>Registracija</h2></div>
                    <div class="sadrzajArticle" style="align-items: center;">
                        <form action="registracija.php" method="post" name="forma" class="forma">
                            
                            <label for="ime">Ime</label>
                            <input type="text" id="ime" name="ime">
                            <span id="imeSpan"></span>
                            <div class="hrDiv"></div>

                            <label for="prezime">Prezime</label>
                            <input type="text" id="prez" name="prez">
                            <span id="prezSpan"></span>
                            <div class="hrDiv"></div>

                            <label for="clanak">Korisničko ime</label>
                            <input type="text" id="korisnicko" name="korisnicko">
                            <span id="korisnickoSpan"></span>
                            <div class="hrDiv"></div>

                            <label for="lozinka">Lozinka</label>
                            <input type="password" id="lozinka" name="lozinka">
                            <span id="lozinkaSpan"></span>
                            <div class="hrDiv"></div>

                            <label for="lozinka2">Ponovljena lozinka</label>
                            <input type="password" id="lozinka2" name="lozinka2">
                            <span id="lozinka2Span"></span>
                            <div class="hrDiv"></div>
                            
                            <button type="submit" value="Registracija" id="unesi">Registracija</button>
                        </div>
                    </form>
                </div>
            </article>
        </content>

        <?php
            if(isset($_POST['ime']) && isset($_POST['prez']) && isset($_POST['korisnicko']) && isset($_POST['lozinka'])){
                $ime = $_POST['ime'];
                $prez = $_POST['prez'];
                $korisnicko = $_POST['korisnicko'];
                $pass = $_POST['lozinka'];

                $dbc = mysqli_connect("localhost", "root", "", "projektni") or die("Greška pri spajanju na bazu".mysqli_connect_errno());

                if(provjera($dbc, $korisnicko)){
                    $sql = "INSERT INTO korisnik (ime, prezime, korisnicko, lozinka) VALUES(?,?,?,?)";
                    $hash = password_hash($pass, CRYPT_BLOWFISH);
                    $stmt = mysqli_stmt_init($dbc);
                    if(mysqli_stmt_prepare($stmt, $sql)){
                        mysqli_stmt_bind_param($stmt, "ssss", $ime, $prez, $korisnicko, $hash);
                        mysqli_stmt_execute($stmt);
                    }
                    echo "<script>location.replace('index.php')</script>";
                }else{
                    echo "<script>alert('Korisnik već postoji!')</script>";
                }
            }

            function provjera($dbc, $korisnicko){
                $query = "SELECT korisnicko FROM korisnik WHERE korisnicko = ?";
                $stmt = mysqli_stmt_init($dbc);
                if(mysqli_stmt_prepare($stmt, $query)){
                    mysqli_stmt_bind_param($stmt, "s", $korisnicko);
                    mysqli_stmt_execute($stmt);
                    mysqli_stmt_store_result($stmt);
                }
                mysqli_stmt_bind_result($stmt, $rez);
                mysqli_stmt_fetch($stmt);
                if($rez != NULL){
                    return false;
                }else{
                    return true;
                }
            }
        ?>


        <div id="footer"></div>
    </body>
</html>