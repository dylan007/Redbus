<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Query.aspx.cs" Inherits="Query" Theme="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;display:flex;justify-content:center;margin-top:10%;">
        <div style="text-align:center">
            <div style="text-align:center">
            <asp:Label ID="Source_Label" runat="server" Text="Source: "></asp:Label>
            <asp:TextBox ID="Source" runat="server" BorderColor="#e0e0e0" BorderStyle="Solid" BorderWidth="2px" CssClass="textClass"></asp:TextBox>
            </div>
            <div style="text-align:center">
            <asp:RequiredFieldValidator ControlToValidate="Source" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the source"></asp:RequiredFieldValidator>
            <br /><br />
            <asp:Label ID="Destination_Label" runat="server" Text="Destination: "></asp:Label>
            <asp:TextBox ID="Destination" runat="server" CssClass="textClass"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="Destination" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter the destination"></asp:RequiredFieldValidator>
            <br /><br />
            <div style="text-align:center">
            <asp:Label ID="DOJ_Label" runat="server" Text="Date Of Journey: "></asp:Label>
            <asp:TextBox ID="DOJ" runat="server" TextMode="Date" CssClass="textClass"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ControlToValidate="DOJ" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter the date of departure"></asp:RequiredFieldValidator>
            <br /><br />
            <asp:Button ID="FindButton" CssClass="round" runat="server" Text="Find" OnClick="FindButton_Click" BackColor="#4285F4" BorderStyle="None" Width="90px" Height="40px"/>
        </div>
    </div>
</asp:Content>

