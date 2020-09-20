<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Plz</title>
<link rel="icon" type="image/png" href="/favicon.png" />
<style>
body, html {
  height: 100%;
  margin: 0;
  font: 400 15px/1.8 "Lato", sans-serif;
  color: #777;
}

.bgimg-1, .bgimg-2, .bgimg-3 {
  position: relative;
  opacity: 0.65;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

}
.bgimg-1 {
  background-image: url("/subpew.jpg");
  height: 100%;
}

.caption {
  position: absolute;
  left: 0;
  top: 40%;
  width: 100%;
  text-align: center;
  color: #000;
}

.caption span.border {
  background-color: #111;
  color: #fff;
  padding: 18px;
  font-size: 25px;
  letter-spacing: 10px;
}

h3 {
  letter-spacing: 5px;
  text-transform: uppercase;
  font: 20px "Lato", sans-serif;
  color: #111;
}
.borderinfo{
  letter-spacing: 2px !important;
}
.tit{
  color: yellow !important;}
</style>

</head>
<body>
<?php
if (!empty($_SERVER["HTTP_CLIENT_IP"]))
{
//check for ip from share internet
$ip = $_SERVER["HTTP_CLIENT_IP"];
}
elseif (!empty($_SERVER["HTTP_X_FORWARDED_FOR"]))
{
// Check for the Proxy User
$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
}
else
{
$ip = $_SERVER["REMOTE_ADDR"];
}
//echo $ip;
?>
<div class="bgimg-1">
  <div class="caption">
    <span class="border tit">SUBSCRIBE</span><br>
    <span class="border tit">TO <a href="https://www.youtube.com/user/pewdiepie" style="text-decoration:none; color:red">IMPACT</a> !</span><br><br>
    <span class="border tit">IP: <?php echo $ip;?></span><br>
    <span class="border tit">Thank You ◉ ͟ʖ◉</span><br>
  </div>
</div>
</body>
</html>
		