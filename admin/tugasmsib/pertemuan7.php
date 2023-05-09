<?php
// Abstract class Bentuk2D sebagai induk kelas
abstract class Bentuk2D {
    abstract public function luasBidang();
    abstract public function kelilingBidang();
}

// Class Lingkaran sebagai turunan dari Bentuk2D
class Lingkaran extends Bentuk2D {
    public $jari2;

    public function namaBidang() {
        return "Lingkaran";
    }

    public function luasBidang() {
        return 3.14 * $this->jari2 * $this->jari2;
    }

    public function kelilingBidang() {
        return 2 * 3.14 * $this->jari2;
    }
}

// Class PersegiPanjang sebagai turunan dari Bentuk2D
class PersegiPanjang extends Bentuk2D {
    public $panjang;
    public $lebar;

    public function namaBidang() {
        return "Persegi Panjang";
    }

    public function luasBidang() {
        return $this->panjang * $this->lebar;
    }

    public function kelilingBidang() {
        return 2 * ($this->panjang + $this->lebar);
    }
}

// Class Segitiga sebagai turunan dari Bentuk2D
class Segitiga extends Bentuk2D {
    public $alas;
    public $tinggi;

    public function namaBidang() {
        return "Segitiga";
    }

    public function luasBidang() {
        return 0.5 * $this->alas * $this->tinggi;
    }

    public function kelilingBidang() {
        return "Tidak bisa dihitung karena segitiga tidak memiliki sisi yang sama";
    }
}

// Membuat objek-objek dari class keturunan
$lingkaran = new Lingkaran();
$lingkaran->jari2 = 8;

$persegiPanjang = new PersegiPanjang();
$persegiPanjang->panjang = 5;
$persegiPanjang->lebar = 10;

$segitiga = new Segitiga();
$segitiga->alas = 4;
$segitiga->tinggi = 6;

// Mencetak hasil dari setiap objek ke dalam tabel HTML
echo "<table border='1'align='center'>
        <tr bgcolor='gren'>
            <th>Nama Bidang</th>
            <th>Jari-jari/Alas</th>
            <th>Tinggi</th>
            <th>Luas</th>
            <th>Keliling</th>
        </tr>
        <tr bgcolor='yellow'>
            <td>".$lingkaran->namaBidang()."</td>
            <td>".$lingkaran->jari2."</td>
            <td>-</td>
            <td>".$lingkaran->luasBidang()."</td>
            <td>".$lingkaran->kelilingBidang()."</td>
        </tr>
        <tr bgcolor='chocolate'>
            <td>".$persegiPanjang->namaBidang()."</td>
            <td>".$persegiPanjang->panjang."</td>
            <td>".$persegiPanjang->lebar."</td>
            <td>".$persegiPanjang->luasBidang()."</td>
            <td>".$persegiPanjang->kelilingBidang()."</td>
        </tr>
        <tr bgcolor='blue'>
            <td>".$segitiga->namaBidang()."</td>
            <td>".$segitiga->alas."</td>
            <td>".$segitiga->tinggi."</td>
            <td>".$segitiga->luasBidang()."</td>
            <td>".$segitiga->kelilingBidang()."</td>
        </tr>
        </table>";
?>