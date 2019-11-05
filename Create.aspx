<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Create" Theme="login"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Message" runat="server" Text=""></asp:Label>
    <div style="width:100%;display:flex;justify-content:center;margin-top:5%;">
    <asp:Panel ID="Panel1" runat="server" EnableTheming="false">
        <div style="text-align:center">
            <div style="text-align:center">
                <asp:Label ID="Label1" runat="server" Text="Source: "></asp:Label>
                <asp:TextBox ID="Source" runat="server" EnableTheming="true"></asp:TextBox><br />
            </div>
            <br /><br />
            <div style="text-align:center">
                <asp:Label ID="Label2" runat="server" Text="Destination: "></asp:Label>
                <asp:TextBox ID="Destination" runat="server" EnableTheming="true"></asp:TextBox><br />
            </div>
            <br /><br />
            <div style="text-align:center">
                <asp:Label ID="Label3" runat="server" Text="Company: "></asp:Label>
                <asp:TextBox ID="Company" runat="server" EnableTheming="true"></asp:TextBox><br />
            </div>
            <br /><br />
            <div style="text-align:center">
                <asp:Label ID="Label4" runat="server" Text="Departure Time: "></asp:Label>
                <asp:TextBox ID="DepartureTime" TextMode="Time" runat="server" EnableTheming="true"></asp:TextBox><br />
            </div>
            <br /><br />
            <div style="text-align:center">
                <asp:Label ID="Label8" runat="server" Text="Arrival Time: "></asp:Label>
                <asp:TextBox ID="ArrivalTime" TextMode="Time" runat="server" EnableTheming="true"></asp:TextBox><br />
            </div>
            <br /><br />
            <div style="text-align:center">
                <asp:Label ID="Label5" runat="server" Text="Duration"></asp:Label>
                <asp:TextBox ID="Duration" runat="server" EnableTheming="true"></asp:TextBox><br />
            </div>
            <br /><br />
            <div style="text-align:center">
                <asp:Label ID="Label6" runat="server" Text="Price"></asp:Label>
                <asp:TextBox ID="Price" runat="server" EnableTheming="true"></asp:TextBox><br />
            </div>
            <br /><br />
            <div style="text-align:center">
                <asp:Label ID="Label7" runat="server" Text="Seats"></asp:Label>
                <asp:TextBox ID="Seats" runat="server" EnableTheming="true"></asp:TextBox><br />
            </div>
            <br /><br />
        <asp:Button ID="Create_button" runat="server" Text="Create" OnClick="Create_button_Click" CssClass="round" EnableTheming="true" Font-Names="Google Sans Bold"/>
        
        </div>
    </asp:Panel>
    </div>
</asp:Content>

