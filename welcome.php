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
		$message = "Invalid Username or Password!";
	} else {
		$message = "You are successfully logged in!";
	}
echo $message;
}
?>


</body>
</html>
