<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1> bangun datar persegi</h1>

    <form method="post">
        <table>
            <tr>
                <td>sisi 1<</td>
                <td>
                    <input type="text" name="sisi1" require>
                </td>
            </tr>
            <tr>
                <td>sisi 2</td>
                <td>
                    <input type="text" name="sisi2" require>
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
        $sisi1 = $_POST['sisi1'];
        $sisi2 = $_POST['sisi2'];

        $luaspersegi = $sisi1 * $sisi2;
        echo 'hasil perhitungan luas persegi';
        echo '<br> diketahui : ';
        echo '<br>  sisi pertama : '.$sisi1;
        echo '<br> sisi kedua :'.$sisi2;

        echo '<br> maka luasnya : '.$luaspersegi;
    }

?>
    
</body>
</html>