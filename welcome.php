<?php
session_start();

?>

<html>
<head>
</head>
<body>

<?php

$message="";
         if(count($_POST)>0)
{
	$conn = mysqli_connect("localhost","root","","network");
          
	$result = mysqli_query($conn,"SELECT * FROM login WHERE username='" . $_POST['username'] . "' and password = '". $_POST['password']."'");
	$count  = mysqli_num_rows($result);
	if($count==0) {
                $_SESSION['login'] =false;
		$message = "Invalid Username or Password!";
	} else {
                $_SESSION['login'] = true;
		$message = "You are successfully logged in!";
                 
                   print_r($messag);
	}
echo $message;


if(!$_SESSION['login']){
   header("location:signup.php");
   exit();
}
else if(isset($_SESSION['login'])&& $_SESSION['login']==true)
{exec("/var/www/html/script.sh ");
}

}

?>
<div id="radio buttons">
<input type="radio" name="packets" value="male" onclick="location.href='tcp.php'"> TCP/IP<br>
  <input type="radio" name="packets" value="female" onclick="location.href='arp.php'">ARP<br>
  <input type="radio" name="packets" value="other" onclick="location.href='udp.php'"> UDP<br>
</div>
<div id="logout">

<a href="logout.php">Log Out </a>
</div>

</body>
</html>
