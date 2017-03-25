<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NIKFORUM.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 20px;
        }
        .style2
        {
        }
        .style3
        {
            width: 20px;
            height: 44px;
        }
        .style4
        {
            width: 73px;
            height: 44px;
        }
        .style5
        {
            height: 44px;
        }
        .style6
        {
            width: 20px;
            height: 24px;
        }
        .style7
        {
            width: 73px;
            height: 24px;
        }
        .style8
        {
            height: 24px;
        }
        .style9
        {
            width: 20px;
            height: 30px;
        }
        .style10
        {
            width: 73px;
            height: 30px;
        }
        .style11
        {
            height: 30px;
        }
        .style12
        {
            width: 150px;
        }
        .style13
        {
            width: 16px;
        }
        .style20
        {
            width: 101px;
        }
        .style23
        {
            width: 829px;
        }
    </style>
</head>
<body>
    <script type="text/javascript">
        function showLogin() {
            var lbtnLogin = document.getElementById("lbtnLogin").innerText;
            if (lbtnLogin == "Login") {
                document.getElementById("divLogin").style.display = "block";
                //document.getElementById("txtUser").value = "";
                document.getElementById("<%=lblErrLogin.ClientID%>").innerHTML = "";
                return false;
            }
            return true;
        }

        function hideLogin() {
            document.getElementById("btnClose").innerText.style.display = "none";
        }

        function showLoginA() {
            document.getElementById("divLogin").style.display = "block";
        }
    </script>
    <form id="form1" runat="server">
    <div style="height: 38px">
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    </div>
    <div id="divHeader" style="height: 80px; width: 100%; position: fixed; text-align: center; z-index: 10000; opacity: 0.8;">
        <div id="divHeader1" style="position: relative; text-align: right; height: 80px; width:1200px; display: inline-block;">
            <div id="divHeaderInner" style="background-color: white; position: relative; height: 80px; width:150px; border-radius:15px; display: inline-block;">
                <asp:LinkButton ID="lBtnRegister" runat="server" onclick="lBtnRegister_Click">Register</asp:LinkButton>
                <br />
                <asp:Label ID="lblLogin" runat="server"></asp:Label>
                <br />
                <br />
                <asp:LinkButton ID="lbtnLogin" runat="server" onclick="lbtnLogin_Click" 
                    onclientclick="return showLogin();">Login</asp:LinkButton>
                <br />
        </div>
        </div>
      
    </div>
    <div id="divLogin" style="height: 100%; width: 100%; position: fixed; text-align: center; z-index: 10000; opacity: 0.8; display: none;">
        <div style="background-color: blue; position: relative; top: 25%; height: 250px; width:300px; border-radius:15px; display: inline-block;">
            <table style="width: 100%; height: 228px;">
                <tr>
                    <td class="style3">
                    </td>
                    <td class="style4">
                    </td>
                    <td class="style5">
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                    </td>
                    <td class="style4">
                    </td>
                    <td class="style5">
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                    </td>
                    <td class="style10">
                        <asp:Label ID="Label1" runat="server" ForeColor="White" Text="username"></asp:Label>
                    </td>
                    <td class="style11">
                        <asp:TextBox ID="TxtUser" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                    </td>
                    <td class="style7">
                        <asp:Label ID="Label2" runat="server" ForeColor="White" Text="password"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="TxtPass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Button ID="btnClose" runat="server" Text="Close" 
                            onclientclick="hideLogin();" />
                    </td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Height="28px" style="margin-left: 0px" 
                            Text="Login" Width="86px" onclick="btnLogin_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style2" colspan="2">
                        <asp:Label ID="lblErrLogin" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div  id="divPost" style="position: relative; width: 1024; height: 500px; top: 120px;">
        <table style="width: 100%; height: 407px;">
            <tr>
                <td class="style12">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="GridQuestions" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlQuestions" Width="1218px">
                        <Columns>
                            <asp:BoundField DataField="Id">
                            <ItemStyle Width="1px" Font-Size="1pt" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Questions">
                                <ItemTemplate>
                                    <table style="width: 1233px;">
                                        <tr>
                                            <td class="style13">
                                                &nbsp;</td>
                                            <td class="style23">
                                                <span>From: <%# Eval("SubjectNick") %>, Date: <%# Eval("SubjectDate") %></span></td>
                                            <td class="style20">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                &nbsp;</td>
                                            <td class="style23">
                                                ----------------------------</td>
                                            <td class="style20">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                &nbsp;</td>
                                            <td class="style23">
                                                <%# Eval("PostSubject")%></td>
                                            <td>
                                                <asp:LinkButton ID="LBtnAnswer" runat="server">View or answer the question</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                &nbsp;</td>
                                            <td class="style23">
                                                &nbsp;</td>
                                            <td class="style20">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                &nbsp;</td>
                                            <td class="style23">
                                                &nbsp;</td>
                                            <td class="style20">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12">
                    &nbsp;</td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="newQuestion" runat="server" Height="48px" 
                        onclick="newQuestion_Click" Text="Submit question" Width="142px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlQuestions" runat="server"></asp:SqlDataSource>
    </div>
    </form>
    
</body>
</html>
