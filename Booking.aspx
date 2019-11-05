<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Booking" Theme="login"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;display:flex;justify-content:center;margin-top:10%;">
        <div style="text-align:center">
            <div style="text-align:center">
                <asp:Label ID="Label2" runat="server" Text="Source: "></asp:Label>
                <asp:TextBox ID="Source" runat="server" Enabled="false"></asp:TextBox><br /><br />
            </div>
            <div style="text-align:center">
                <asp:Label ID="Label3" runat="server" Text="Destination: "></asp:Label>
                <asp:TextBox ID="Destination" runat="server" Enabled="false"></asp:TextBox><br /><br />
            </div>
            <div style="text-align:center">
                <asp:Label ID="Label4" runat="server" Text="Date of Journey: "></asp:Label>
                <asp:TextBox ID="DOJ" runat="server" Enabled="false"></asp:TextBox><br /><br />
            </div>
            <div style="text-align:center">    
                <asp:Label ID="Label5" runat="server" Text="Departure Time: "></asp:Label>
                <asp:TextBox ID="DepartureTime" runat="server" Enabled="false"></asp:TextBox><br /><br />
            </div>
            <div style="text-align:center">
                <asp:Label ID="Label7" runat="server" Enabled="false" Text="Arrival Time: "></asp:Label>
                <asp:TextBox ID="ArrivalTime" runat="server" Enabled="false"></asp:TextBox><br /><br />
            </div>
                <asp:Label ID="Label6" runat="server" Text="Price: "></asp:Label>
                <asp:TextBox ID="Price" runat="server" Enabled="false"></asp:TextBox><br /><br />
            <div style="text-align:center">
                <asp:Label ID="Label1" runat="server" Text="Number of Seats: "></asp:Label>
                <asp:TextBox ID="Seats" runat="server" AutoPostBack="true" OnTextChanged="Seats_TextChanged"></asp:TextBox><br /><br />
                <asp:Label ID="Check" runat="server" Text=""></asp:Label>
            </div>
    Total Cost: 
    <asp:Label ID="TotalCost" runat="server" Text="1"></asp:Label>
    <br /><br />
    <asp:Button ID="Book" runat="server" Text="Book" OnClick="Book_Click" />
    <br /><br />
            </div>
    </div>
</asp:Content>

