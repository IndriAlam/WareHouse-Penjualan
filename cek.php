<?php
error_reporting(E_ALL ^ E_DEPRECATED);
	ini_set("display_errors", 0);
	$host = 'localhost';
    $user = 'root';
    $pass = '';
    $db = 'dtmin';

    $conn = mysql_connect($host, $user, $pass);
    mysql_select_db($db, $conn);

	$email = $_POST['email'];
	$pass  = $_POST['password'];

	$login=mysql_query("SELECT * FROM admin WHERE email='$email' AND password='$pass'");
	$ketemu=mysql_num_rows($login);
	$r=mysql_fetch_array($login);

	// Apabila email dan password ditemukan
	if ($ketemu > 0){
		session_start();
		$_SESSION[user]     = $r[nama];
		$_SESSION[passuser]     = $r[password];
		
		//$_SESSION[leveluser]    = $r[level];
		
		$_SESSION[login] = 1;

		echo "<script language=Javascript>
				window.alert('Login Berhasil');
				javascript:document.location='menu1.php';
			</script>";
	  //header('location:user2.php');
	}
	else{
	  echo "<script language=Javascript>
				window.alert('Login Gagal');
				javascript:document.location='masuk.html';
			</script>";
	}
?>
