<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Theme="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;height:100%;display:flex;justify-content:center;margin-top:5%;">
        <asp:Panel ID="Panel1" HorizontalAlign="Justify" runat="server">
            <div style="text-align:center;">
                <div style="text-align:center">
                    <asp:Label ID="Label1" runat="server" Text="Name: "></asp:Label>
                    <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Name" runat="server" ErrorMessage="Please Enter Your Name"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </div>
            <div style="text-align:center">
                <asp:Label ID="Label2" runat="server" Text="Username: "></asp:Label>
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>&nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="UserName" runat="server" ErrorMessage="Please enter the username"></asp:RequiredFieldValidator>
                <br />
                <br />
            </div>
            <div style="text-align:center">
                <asp:Label ID="Label3" runat="server" Text="Password: "></asp:Label>
                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Password" runat="server" ErrorMessage="Please enter the password"></asp:RequiredFieldValidator>   
                <br />
                <br />
            </div>
            <div style="text-align:center">
                <asp:Label ID="Label4" runat="server" Text="Email ID: "></asp:Label>
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Email" runat="server" ErrorMessage="Please enter your Email ID"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Email" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid Email ID"></asp:RegularExpressionValidator>
                <br />
            </div>
            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>

