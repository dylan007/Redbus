<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ThankYou.aspx.cs" Inherits="ThankYou"  Theme="login"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;display:flex;justify-content:center;margin-top:5%;">
    <asp:Panel ID="Panel1" runat="server" Height="50%" EnableTheming="false" HorizontalAlign="Center">
    <div style="text-align:center"><h2>eTicket</h2></div><br />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br /><br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br /><br />
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <br /><br />
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label><br /><br />
    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label><br /><br />
    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label><br /><br />
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label><br /><br />
    <asp:Button ID="Book" runat="server" Text="Book another" OnClick="Book_Click" EnableTheming="true" CssClass="textClass"/>
    </asp:Panel>
    </div>
</asp:Content>

