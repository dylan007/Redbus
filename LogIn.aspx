<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Theme="login" Inherits="LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;height:100%;display:flex;justify-content:center;margin-top:5%;">
    <asp:Panel ID="LoginPanel" runat="server">
        <div style="text-align:center;">
            <div style="text-align:center">
                <asp:Label ID="Label1" runat="server" Text="UserName: "></asp:Label>
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="Please enter your username"></asp:RequiredFieldValidator>
                <br /><br />
            </div>
            <div style="text-align:center">
                <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
                <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>   
                <br /><br />
            </div>
            <div style="text-align:center">
                <asp:CheckBox ID="RememberMe" runat="server" Text="Keep me signed in"/><br />
            </div>
            <div style="text-align:center;margin-top:2%;display:inline-block">
                <asp:Button ID="Login_button" runat="server" Text="Login" OnClick="Button1_Click" CssClass="round" Font-Names="Google Sans Bold"/>
                <br />
                <br />
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Register.aspx" runat="server" Width="90px" Height="40px" BackColor="#4285F4" CssClass="link2">
                    <div style="height:100%;padding-top:14%">
                        Register
                    </div>
                </asp:HyperLink>        
            </div>
        </div>
    </asp:Panel><br />
    </div>
    <asp:Label ID="Label3" runat="server" Text=" "></asp:Label>
</asp:Content>

