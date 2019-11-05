<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="Result" Theme="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource 
        ID="ResultsDataSource" 
        ConnectionString="<% $ConnectionStrings:BusBooking %>" 
        runat="server"
        SelectCommand="select s.Id as Id,Company,DepartureTime,ArrivalTime,Duration,Price,s.Seats as Seats,s.Jdate as Jdate,Source,Destination from buses b inner join Seats s on b.BusID=s.BusID where Jdate=@doj and Source=@source and Destination=@destination"
    >
        <SelectParameters>
            <asp:Parameter Name="doj" />
            <asp:Parameter Name="source" />
            <asp:Parameter Name="destination" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="width:100%;display:flex;justify-content:center;margin-top:10%;border-radius:5%">
        <asp:GridView
            runat="server"
            ID="ResultGridView" 
            DataSourceID="ResultsDataSource" 
            AutoGenerateColumns="False"  
            AllowSorting="True"
            OnRowCommand="ResultsGridView_RowCommand"
            CellPadding="2"
            BorderColor="Tan"
            BorderWidth="1px" BackColor="LightGoldenrodYellow" ForeColor="Black" GridLines="None"
            >
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="Id" ItemStyle-CssClass="hiddenCol" HeaderStyle-CssClass="hiddenCol">
<HeaderStyle CssClass="hiddenCol"></HeaderStyle>

<ItemStyle CssClass="hiddenCol"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-BackColor="#263238" HeaderStyle-ForeColor="#FFFFFF" HeaderText="Company" DataField="Company" ReadOnly="true" >
<HeaderStyle BackColor="#263238" ForeColor="White"></HeaderStyle>
                </asp:BoundField>
                <asp:TemplateField SortExpression="DepartureTime" HeaderText="Departure" HeaderStyle-BackColor="#263238" HeaderStyle-ForeColor="#FFFFFF">
                    <ItemTemplate>
                        <b><%#Eval("DepartureTime") %></b><br />
                        <%#Eval("Source") %>
                    </ItemTemplate>

<HeaderStyle BackColor="#263238" ForeColor="White"></HeaderStyle>
                </asp:TemplateField>
                 <asp:TemplateField SortExpression="ArrivalTime" HeaderText="Arrival" HeaderStyle-BackColor="#263238" HeaderStyle-ForeColor="#FFFFFF">
                    <ItemTemplate>
                        <b><%#Eval("ArrivalTime") %></b><br />
                        <%#Eval("Destination") %>
                    </ItemTemplate>

<HeaderStyle BackColor="#263238" ForeColor="White"></HeaderStyle>
                </asp:TemplateField>
                <asp:BoundField HeaderStyle-BackColor="#263238" HeaderStyle-ForeColor="#FFFFFF" HeaderText="Duration" DataField="Duration" ReadOnly="true">
<HeaderStyle BackColor="#263238" ForeColor="White"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-BackColor="#263238" HeaderStyle-ForeColor="#FFFFFF" HeaderText="Seats Left" DataField="Seats" ReadOnly="true">
<HeaderStyle BackColor="#263238" ForeColor="White"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-BackColor="#263238" HeaderStyle-ForeColor="#FFFFFF" HeaderText="Price" DataField="Price" ReadOnly="true">
<HeaderStyle BackColor="#263238" ForeColor="White"></HeaderStyle>
                </asp:BoundField>
                <asp:ButtonField HeaderStyle-BackColor="#263238" HeaderStyle-ForeColor="#FFFFFF" ButtonType="Button" CommandName="Book" HeaderText="" Text="Book" ControlStyle-BackColor="#4285F4" ControlStyle-BorderStyle="None" ControlStyle-Width="80px" ControlStyle-Height="40px" ControlStyle-Font-Names="Google Sans Bold" ControlStyle-CssClass="round">
<ControlStyle BackColor="#4285F4" BorderStyle="None" CssClass="round" Font-Names="Google Sans Bold" Height="40px" Width="80px"></ControlStyle>

<HeaderStyle BackColor="#263238" ForeColor="White"></HeaderStyle>
                </asp:ButtonField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </div>
    <br />
</asp:Content>

