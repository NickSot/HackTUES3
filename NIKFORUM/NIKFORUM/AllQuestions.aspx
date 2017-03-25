﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllQuestions.aspx.cs" Inherits="NIKFORUM.AllQuestions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
body {
    background-color: #66b53ff;
}

/* Style the tab */
div#divHeader {
    overflow: hidden;
    border: none;
    background-color: #333;
}
/* Style the buttons inside the tab */
div#divHeaderInner {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
		color: white;
}

#lBtnRegister
{
    text-decoration: none;    
}

#lbtnLogin
{
    text-decoration: none;    
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: red;
}


.tab2 {
	float: right;
}
/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
		
}
/*fhgdggggg */
input[type=text], input[type=password] {
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
buttonn {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}
buttonn:hover {
    opacity: 0.8;
}
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}
img.avatar {
    width: 20%;
    border-radius: 10%;
}
.container {
    padding: 16px;
}
span.psw {
    float: right;
    padding-top: 16px;
}

.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto;
    border: 1px solid #888;
    width: 80%;
}
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}
.animate {
    -webkit-animation: animatezoom 1s;
    animation: animatezoom 1s
}
@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}

@font-face { font-family: Prime Regular; src: url('Prime Regular.otf'); }
h2 {
font-family: Prime Regular
}
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
            height: 32px;
        }
        .style4
        {
            width: 73px;
            height: 32px;
        }
        .style5
        {
            height: 32px;
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
        .style24
        {
            width: 20px;
            height: 13px;
        }
        .style25
        {
            width: 73px;
            height: 13px;
        }
        .style26
        {
            height: 13px;
        }
    </style>
</head>
<body bgcolor="#0099ff">
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
    <br/>
    <form id="form1" runat="server">
    <div style="height: 38px">
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    </div>
    <div id="divHeader">
        <div id="divHeader1" 
            
            
            style="position: relative; text-align: right; height: 88px; width:1200px; display: inline-block; top: 0px; left: 0px;">
            <div id="divHeaderInner" 
                style="background-color: inherit; position: relative; height: 51px; width:110px; border-radius:15px; display: inline-block; top: 4px; left: 1203px;">
                <asp:LinkButton ID="lBtnRegister" runat="server" onclick="lBtnRegister_Click" 
                    ForeColor="#66FFFF">Register</asp:LinkButton>
                <br />
                <asp:Label ID="lblLogin" runat="server"></asp:Label>
                <br />
                <asp:LinkButton ID="lbtnLogin" runat="server" onclick="lbtnLogin_Click" 
                    onclientclick="return showLogin();" ForeColor="#66FFFF">Login</asp:LinkButton>
                <br />
                <br />
        </div>
        </div>
      
    </div>
    &nbsp;&nbsp;
    <center>
    <asp:Image ID="Image1" runat="server" 
        ImageUrl="https://scontent-fra3-1.xx.fbcdn.net/v/t34.0-12/17505987_1254411984634706_1292581433_n.png?oh=1d2ac0e6af7f8bfe662589b1c5a6960d&amp;oe=58D990C2" style="height: 219px; width: 422px;"/></center>
    <br/>
    <center><b><h2>Wire is a social service that facilitates the exchange of experience and information between different programmers. It is very easy to use!</h2>
        <p>&nbsp;</p>
        <p>
                    <asp:Button ID="newQuestion" runat="server" Height="48px" 
                        onclick="newQuestion_Click" Text="Submit question!" 
                Width="142px" />
                </p>
        </b></center>
    
    <div id="divLogin" style="height: 100%; width: 100%; position: fixed; text-align: center; z-index: 10000; opacity: 0.8; display: none;">
        <div style="background-color: #333; position: relative; top: -50%; height: 250px; width:300px; border-radius:15px; display: inline-block;">
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
                    <td class="style24">
                    </td>
                    <td class="style25">
                    </td>
                    <td class="style26">
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                    </td>
                    <td class="style10">
                        <asp:Label ID="Label1" runat="server" ForeColor="White" Text="username"></asp:Label>
                    </td>
                    <td class="style11">
                        <asp:TextBox ID="TxtUser" runat="server" Height="21px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                    </td>
                    <td class="style7">
                        <asp:Label ID="Label2" runat="server" ForeColor="White" Text="password"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="TxtPass" runat="server" TextMode="Password" Height="21px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Button ID="btnClose" runat="server" Text="Close" 
                            onclientclick="hideLogin();" onclick="hideLogin()" />
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
    <div  id="divPost" 
        style="position: relative; width: 1024; height: 500px; top: 33px; left: -11px;">
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
                        DataSourceID="SqlQuestions" Width="1218px" 
                        onselectedindexchanged="GridQuestions_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Id">
                            <ItemStyle Width="1px" Font-Size="1pt" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Newest 5 questions">
                                <ItemTemplate>
                                    <table style="width: 1233px;">
                                        <tr>
                                            <td class="style13">
                                                &nbsp;</td>
                                            <td class="style23">
                                                <span>From: <%# Eval("SubjectNick") %>, Date: <%# Eval("SubjectDate") %></span>
                                            </td>
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
                                                <%# Eval("PostSubject")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="LBtnAnswer" runat="server" ForeColor="LightGreen" style="text-decoration: none">View or answer the question</asp:LinkButton>
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
