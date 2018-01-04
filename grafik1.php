<html>
<head>
<title>Penjualan Barang</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
</head>
<body>
 
<?php
    $host = 'localhost';
    $user = 'root';
    $pass = '';
    $db = 'dtmin';

    $conn = mysql_connect($host, $user, $pass);
    mysql_select_db($db, $conn);

// Buat Variabel untuk tahun dan namaorganisasi untuk menampilkan data berdasarkan kriteria
 
    // ser get year
    $year = isset($_GET['year']);
    $year = !empty($_GET['year']) ? $_GET['year'] : 2015;

    $categories = array('Nama Barang');

// data series tampilan di grafik
 
    $data_series = array('Milo', 'Rosta', 'Sinar Dunia');
    $data_series2 = array('b1', 'b2', 'b3');
	
    // set sereis
    $series = array();

    // set series
    foreach ($data_series as $key=>$val) {
        array_push($series, array(
            'name'=>$val,
            'data'=>array()
        ));
    }

    // tampilkan data dari tabel seniman dengan %like artinya setiap kata yang ada didalam array diatas yaitu jaranan, kuda lumping, tari akan di select
 
    foreach ($data_series2 as $key=>$val) {
        $perintah = "SELECT kode_dimensi FROM tabel_dimensi WHERE tahun = '$year' ";
		$x=mysql_query($perintah);
		$y=mysql_fetch_row($x);
		$sql = "SELECT SUM(total_penjualan) AS result FROM fact_tabel_penjualan WHERE kode_barang = '$val' AND kode_dimensi = '$y[0]'";
        
        $rs = mysql_query($sql);
        $row = mysql_fetch_array($rs);

        $result = $row['result'];

        array_push($series[$key]['data'], (int) $result);
    }
?>
<div class="col-md-5">
<form method="get" class="form-inline">
    <select name="year" class="form-control">
        <option value="">- pilih tahun -</option>

// Untuk Action pilih berdasarkan tahun
 
        <?php
            foreach (range(2015, date('Y')) as $key=>$val) {
                echo '<option value="'.$val.'">'.$val.'</option>';
            }
        ?>
    </select>
    <button class="btn btn-theme">CEK TAHUN</button>
</form>
</div>
<div id="contoh" style="width: 100%; height: 450px;">
<script type="text/javascript">

// Tampilkan grafik berdasarkan variabel year dan category 
 
$('#contoh').highcharts({
    chart: {
        type: 'column'
    },
    title: {
        text: 'PENJUALAN BARANG BERDASARKAN TAHUN'
    },
    subtitle: {
        text: '<?php echo $year; ?>'
    },
    xAxis: {
        categories: <?php echo json_encode($categories); ?>,
        labels: {
            rotation: 0,
            align: 'center'
        }
    },
    series: <?php echo json_encode($series); ?>
});
</script>
</div>
</body>
</html>
