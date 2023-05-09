<?php

class Pesanan {
    private $koneksi;
    public function __construct(){
        global $dbh; //instance object koneksi.php
        $this->koneksi = $dbh;

}
public function dataPesanan(){
    $sql = "SELECT * FROM pesanan";
    $ps = $this->koneksi->prepare($sql);
    $ps->execute();
    $rs = $ps->fetchAll();
    return $rs; 
}

public function getPesanan($id){
    $sql = "SELECT * FROM pesanan";
    $ps = $this->koneksi->prepare($sql);
    $ps->execute([$id]);
    $rs = $ps->fetch();
    return $rs
}

public function simpan($data){
    $sql = "INSERT INTO pesanan(id, tanggal, total, pelanggan_id, ket)
    VALUES (?,?,?,?,?)";
    $ps = $this->koneksi->prepare($sql);
    $ps->execute($data);
}

}

?>