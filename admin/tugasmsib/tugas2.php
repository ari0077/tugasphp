<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1> bangun datar jajargenjang</h1>

    <form method="post">
        <table>
            <tr>
                <td>panjang<</td>
                <td>
                    <input type="text" name="panjang" require>
                </td>
            </tr>
            <tr>
                <td>tinggi</td>
                <td>
                    <input type="text" name="tinggi" require>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="submit" value="hitung">
                </td>
            </tr>
        </table>
    </form>
    <?php


    if(isset($_POST['submit'])){
        $panjang = $_POST['panjang'];
        $tinggi = $_POST['tinggi'];

        $luasjajargenjang = $panjang * $tinggi;
        echo 'hasil perhitungan luas jajargenjang';
        echo '<br> diketahui : ';
        echo '<br>  panjang : '.$panjang;
        echo '<br> tinggi :'.$tinggi;

        echo '<br> maka luasnya : '.$luasjajargenjang;
    }

?>
    
</body>
</html>