<?php

$output = exec("/bin/bash -c \"date\"");
echo "<pre>$output</pre>";

if (empty($output)){
       header("HTTP/1.1 500 Internal Server Error");
        }

?>
