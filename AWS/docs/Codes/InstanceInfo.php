<?php
if ($_GET['run']) {
  # This code will run if ?run=true is set. 
  echo("<pre><H1>Your Instance Info:</pre></H1>");
  $output = shell_exec("wget -q -O - http://169.254.169.254/latest/meta-data/instance-id");
  echo "Instance Id: <pre>$output</pre>\n"; 
  $output2 = shell_exec("wget -q -O - http://169.254.169.254/latest/meta-data/placement/availability-zone");
  echo "Availability Zone: <pre>$output2</pre>";
}
if ($_Get['clear']) {
  ob_end_clean();
}
?>

<!-- This link will add ?run=true to your URL, myfilename.php?run=true -->
<a href="?run=true">Get Instance Info !! </a> <br><br> 
<a href="?clear=true">Clean !! </a>






