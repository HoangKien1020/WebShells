Folder for secure shell by token

How to use `secureshell.php` change X-TOKEN with token in `secureshell.php`, you can change your token with any string,it should be hash 512 as my code.
```
GET /shell.php?cmd=whoami HTTP/1.1
Host: xxx
Content-Length: 2
X-TOKEN: 9ebc314e6dacf0a6ab1c08c444b3deb50338b188a70cad862a6482d1ae0e5be2
```
