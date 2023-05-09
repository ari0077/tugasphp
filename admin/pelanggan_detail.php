<?php

$id = $_REQUEST['id'];
$model = new pelanggan();
$pesanan = $model->getPelanggan($id);

?>

<div>
    <h3>
        <?= $pelanggan['kode'] ?>
    </h3>
</div>