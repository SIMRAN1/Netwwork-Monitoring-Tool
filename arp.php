<?php
session_start();
$_SESSION['login']=true;
?>
<html>
<html>
<head>
<link href="fourth.css" rel="stylesheet" type="text/css" >
<title>
arp
</title>
</head>
<body>
ARP PACKETS
<div id="logout">

<a href="logout.php">Log Out </a>
</div>
<div id="back">
<a href="welcome.php">Back</a>
</div>
<form action="" method="post">
<select name="taskOption">
  <option value="all" <?= $_REQUEST["taskOption"]=="all"?" selected='selected'":"" ?>>all</option>
  <option value="timestamp" <?= $_REQUEST["taskOption"]=="timestamp"?" selected='selected'":"" ?>>timestamp</option>
  <option value="source_mac" <?= $_REQUEST["taskOption"]=="source_mac"?" selected='selected'":"" ?>>source_mac</option>
  <option value="des_mac" <?= $_REQUEST["taskOption"]=="des_mac"?" selected='selected'":"" ?>>des_mac</option>
  <option value="pointer_length" <?= $_REQUEST["taskOption"]=="pointer_length"?" selected='selected'":"" ?>>pointerlength</option>
  <option value="source_ip" <?= $_REQUEST["taskOption"]=="source_ip"?" selected='selected'":"" ?>>source_ip</option>
  <option value="des_ip" <?= $_REQUEST["taskOption"]=="des_ip"?" selected='selected'":"" ?>>des_ip</option>
  
  
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

   $result = mysqli_query($con,"SELECT * FROM arptable");
   if(isset($_POST['taskOption']))
{
  $selectOption = $_POST['taskOption'];
 echo $_POST['taskOption'];
}
else
{$selectOption = "all";
}
if($selectOption=="all")
{
   echo "<table border='1'>
      <tr>
         <th>Timestamp</th>
         <th>SourceMac</th>
         <th>DesMac</th>
         <th>PointerLength</th>
         <th>SourceIP</th>
         <th>DesIP</th>
         
      </tr>";

   while($row = mysqli_fetch_array($result)) {
      echo "<tr>";
      echo "<td>" . $row['timestamp'] . "</td>";
      echo "<td>" . $row['source_mac'] . "</td>";
      echo "<td>" . $row['des_mac'] . "</td>";
      echo "<td>" . $row['pointer_length'] . "</td>";
      echo "<td>" . $row['source_ip'] . "</td>";
      echo "<td>" . $row['des_ip'] . "</td>";
      
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
