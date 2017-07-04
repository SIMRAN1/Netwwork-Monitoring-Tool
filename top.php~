<?php
session_start();
$_SESSION['login']=true;
?>
<html>
<html>
<head>
<link href="fourth.css" rel="stylesheet" type="text/css" >
<title>
top
</title>
</head>
<body>
TOP 5 MACHINES 
<div id="logout">

<a href="logout.php">Log Out </a>
</div>
<div id="back">
<a href="welcome.php">Back</a>
</div>
<form action="" method="post">
<select name="taskOption">
  <option value="all" <?= $_REQUEST["taskOption"]=="all"?" selected='selected'":"" ?>>all</option>
  <option value="total" <?= $_REQUEST["taskOption"]=="total"?" selected='selected'":"" ?>>total_packets</option>
  <option value="source_ip" <?= $_REQUEST["taskOption"]=="source_ip"?" selected='selected'":"" ?>>source_ip</option>
  
  
</select>
 <input type="submit" name="submit" value="Go"/>
</form>
</body>
<?php
   $con=mysqli_connect("localhost","root","","dump");
   // Check connection
   if(mysqli_connect_errno()) {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }

   $result = mysqli_query($con,"SELECT * FROM top");
   if(isset($_POST['taskOption']))
{
  $selectOption = $_POST['taskOption'];
 echo $_POST['taskOption'];
}
else
{$selectOption="all";
}
if($selectOption=="all")
{
   echo "<table border='1'>
      <tr>
         <th>Total packets</th>
         <th>SourceIp</th>
         
      </tr>";

   while($row = mysqli_fetch_array($result)) {
      echo "<tr>";
      echo "<td>" . $row['total'] . "</td>";
      echo "<td>" . $row['source_ip'] . "</td>";
     
      echo "</tr>";
   }
   echo "</table>";
}
else
{echo "<table border='1'>
      <tr>
         <th>$selectOption</th>
         
      </tr>";

   while($row = mysqli_fetch_array($result)) {
      echo "<tr>";
      echo "<td>" . $row[$selectOption] . "</td>";
      
      echo "</tr>";
   }
   echo "</table>";
}
   mysqli_close($con);
?>
</html>
