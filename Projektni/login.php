<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
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
            <article id="login">
                <div class="naslovSekcija"><h2>Prijava</h2></div>
                    <div class="sadrzajArticle" style="align-items: center;">
                        <form action="login.php" method="post" name="forma" class="forma">

                            <label for="clanak">Korisničko ime</label>
                            <input type="text" id="korisnicko" name="korisnicko">
                            <span id="korisnickoSpan"></span>
                            <div class="hrDiv"></div>

                            <label for="lozinka">Lozinka</label>
                            <input type="password" id="lozinka" name="lozinka">
                            <span id="lozinkaSpan"></span>
                            <div class="hrDiv"></div>
                            
                            <button type="submit" value="Prijava" id="unesi">Prijava</button>
                        </div>
                    </form>
                </div>
            </article>
        </content>

        <?php
            if(isset($_POST['korisnicko']) && isset($_POST['lozinka'])){
                $korisnicko = $_POST['korisnicko'];
                $pass = $_POST['lozinka'];

                $dbc = mysqli_connect("localhost", "root", "", "projektni") or die("Greška pri spajanju na bazu".mysqli_connect_errno());

                if(provjera($dbc, $korisnicko, $pass)){
                    $query = "SELECT razina FROM korisnik WHERE korisnicko = ?";
                    $stmt = mysqli_stmt_init($dbc);
                    if(mysqli_stmt_prepare($stmt, $query)){
                        mysqli_stmt_bind_param($stmt, "s", $korisnicko);
                        mysqli_stmt_execute($stmt);
                        mysqli_stmt_store_result($stmt);
                    }
                    mysqli_stmt_bind_result($stmt, $rez);
                    mysqli_stmt_fetch($stmt);
                    session_start();
                    $_SESSION['razina'] = $rez;
                    $_SESSION['korisnicko'] = $korisnicko;
                    if($rez == 0){
                        echo "<script>alert('$korisnicko ne posjedujete administratorska prava.')</script>";
                    }
                    echo "<script>location.replace('index.php')</script>";
                }
            }

            function provjera($dbc, $korisnicko, $pass){
                $query = "SELECT lozinka FROM korisnik WHERE korisnicko = ?";
                $stmt = mysqli_stmt_init($dbc);
                if(mysqli_stmt_prepare($stmt, $query)){
                    mysqli_stmt_bind_param($stmt, "s", $korisnicko);
                    mysqli_stmt_execute($stmt);
                    mysqli_stmt_store_result($stmt);
                }
                mysqli_stmt_bind_result($stmt, $rez);
                mysqli_stmt_fetch($stmt);
                if($rez != NULL){
                    if(password_verify($pass, $rez)){
                        return true;
                    }else{
                        echo "<script> document.getElementById('lozinkaSpan').innerHTML = 'Pogrešna lozinka'</script>";
                        return false;
                    }
                }else{
                    echo "<script> document.getElementById('korisnickoSpan').innerHTML = 'Korisnik ne postoji'</script>";
                    return false;
                }
            }
        ?>


        <div id="footer"></div>
    </body>
</html>