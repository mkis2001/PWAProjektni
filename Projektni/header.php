<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="https://kit.fontawesome.com/b05e340512.js" crossorigin="anonymous"></script>
    <?php
        session_start();
    ?>
</head>

<header>
    <nav>
        <img src="slike/naslov.svg" alt="">
            <div class="linkovi">
                <div class="link" title="home">
                    <a href="index.php">Home</a>
                </div>
                
                <div class="link" title="sport">
                    <a href="kategorija.php?kateg=sport" >Sport</a>
                </div>
                <div class="link" title="politika">
                    <a href="kategorija.php?kateg=politika" >Politika</a>
                </div>
                
                <?php 
                    if(isset($_SESSION['razina'])){
                        if($_SESSION['razina'] > 0){
                            echo "<div class='link' title='administracija'>";
                            echo "<a href='administracija.php'>Administracija</a></div>";
                        }
                    }
                ?>
                <div class="link" title="unos">
                    <a href="unos.html">Unos</a>
                </div>
                <div class="link" title="prijava">
                    <span><i  id="prijava" class="fa-regular fa-user"></i></span>
                    <?php if(isset($_SESSION['korisnicko'])){
                        echo "<p>".$_SESSION['korisnicko']."</p>";
                    }?>
                    <div id="prijavaContent">
                        <?php if(isset($_SESSION['korisnicko'])){
                            echo "<a href='odjava.php'>Odjava</a>";
                        }else{
                            echo "<a href='login.php'>Prijava</a><br>
                            <a href='registracija.php'>Registracija</a>";
                        }
                        ?>
                        
                    </div>
                    <script src="ikonaDropdown.js"></script>
                </div>
            </div>
        </nav>
</header>