<?php
session_start();

?>
<html>
<head>
<link href="second.css" rel="stylesheet" type="text/css" >
<title>
signup
</title>
</head>
<body>
<h1>CREATE A NEW ACCOUNT</h1>
<div class="form">
<form action="welcome.php" method="post" >
	

USERNAME:<input type="text" name="username" placeholder="USERNAME" required><br><br>
PASSWORD:<input type="password" name="password" placeholder="PASSWORD" required><br><br>



<input type='submit' >



</form>

</div>
<div>
<?php
if(!$_SESSION['login']&&isset($_SESSION['login'])){
   echo "invalid user";
   session_unset();
session_destroy(); 
}
?>
</div>


</body>

</html>

