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
        <script src="forma.js"></script>
        <style>
            .link[title^="administracija"]{
                border-bottom: 4px solid var(--primary);
                transition: var(--tran);
            }
        </style>
        <?php
            session_start();
            if(isset($_SESSION['razina'])){
                if($_SESSION['razina'] == 0){
                    echo "<script>alert('Ne posjedujete administratorska prava.')</script>";
                    echo "<script>location.replace('index.php')</script>";
                }
            }else{
                echo "<script>alert('Ne posjedujete administratorska prava.')</script>";
                echo "<script>location.replace('index.php')</script>";
            }
        ?>
    </head>
    <body>
        <div id="header"></div>

        <content>
            <article>
                <div class="naslovSekcija">
                    <h2>Vijesti</h2>

                </div>
                <table class="adminTablica">
                    <?php
                        ispisiVijesti("sport");
                    ?>
                </table>
            </article>
        </content>

        <?php
            function ispisiVijesti($kategorija){
                $dbc = mysqli_connect("localhost","root","","projektni") or die("Greška pri spajanju na bazu.".mysqli_connect_errno());

                $sql = "SELECT * FROM vijesti ORDER BY datum desc, id desc";
    
                $result = mysqli_query($dbc, $sql) or die("Greška pri slanju upita na bazu.");
    
                if($result){
                    echo "<form action='administracija.php' method='post' name='forma'>";
                    while($row = mysqli_fetch_array($result)){
                        echo "<tr class='adminVijest'>
                                <td class='slika'>
                                    <img src='slike/".$row['slika']."' alt='' width='70%'>
                                </td>
                                <td>
                                    <h3>".$row['naslov']."</h3>
                                    <p>Kategorija: ".$row['kategorija']."</p>
                                    <p>".date("d.m.Y", strtotime($row['datum']))."</p>
                                </td>
                                <td style='text-align:center;'>
                                    <button name='id' type='submit' value='".$row['id']."'><i class='fa-regular fa-pen-to-square'></i> Uredi</button>
                                </td>
                            </tr>";
                    }
                    echo "</form>";
                }
            }
        ?>

        <?php
            if(isset($_POST['id'])){
                $id = $_POST['id'];
                $_SESSION['id'] = $id;
                echo "<script>location.replace('administrator.php')</script>";
            }
        ?>


        <div id="footer"></div>
    </body>
</html>