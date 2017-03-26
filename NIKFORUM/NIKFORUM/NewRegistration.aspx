<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRegistration.aspx.cs" Inherits="NIKFORUM.NewRegistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body 
        {
            background: url(http://i.imgur.com/FZ4seLw.jpg) no-repeat center center fixed; 
        }
    #btnRegister {
        border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0 1px 0;
            cursor: pointer;
    }
    #btnRegister:hover {
        opacity: 0.8;
    }
    #btnHome {
        border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            cursor: pointer;
            height: 50px;
    }
    #btnHome:hover {
        opacity: 0.8;
    }
        .style2
        {
            width: 167px;
        }
        .style4
        {
            width: 175px;
        }
        .style5
        {
            width: 305px;
        }
        .style6
        {
            width: 8px;
        }
    </style>
</head>
<body>
    <script type="text/javascript">
    </script>
    <form id="form1" runat="server">
    <div>
    </div>
    <div style="height: 38px">
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    </div>
    <div id="divHeader" style="height: 80px; width: 100%; position: fixed; text-align: center; z-index: 10000; opacity: 0.8;">
        <div id="divHeader1" style="position: relative; text-align: right; height: 80px; width:1200px; display: inline-block;">
        </div>
      
    </div>
    <div id="divRegister" style="height: 100%; width: 100%; position: relative; top: 120px; text-align: center; z-index: 10000; opacity: 0.8;">
        <div style="background-color: #333; position: relative; top: 25%; height: 250px; width:400px; border-radius:15px; display: inline-block;">
            <table style="width: 100%; height: 281px;">
                <tr>
                    <td class="style6">
                    </td>
                    <td class="style4">
                    </td>
                    <td class="style5">
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                    </td>
                    <td class="style4">
                        <asp:Label ID="lblNick" runat="server" ForeColor="White" Text="username"></asp:Label>
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TxtUser" runat="server" Width="180px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                    </td>
                    <td class="style10">
                        <asp:Label ID="lblEmail" runat="server" Text="email" ForeColor="White"></asp:Label>
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TxtEmail" runat="server" Width="180px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                    </td>
                    <td class="style7">
                        <asp:Label ID="lblPass" runat="server" Text="password" ForeColor="White"></asp:Label>
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TxtPass" runat="server" Width="180px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style7">
                        <asp:Label ID="lblPassConf" runat="server" Text="confirm password" 
                            ForeColor="White"></asp:Label>
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TxtPassConf" runat="server" Width="180px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Button ID="btnHome" runat="server" Text="Close" onclick="btnHome_Click" />
                    </td>
                    <td class="style5">
                        <asp:Button ID="btnRegister" runat="server" Height="50px" style="margin-left: 0px" 
                            Text="Register" Width="112px" onclick="btnRegister_Click" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2" colspan="2">
                        <asp:Label ID="lblErrRegister" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
