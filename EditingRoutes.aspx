﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditingRoutes.aspx.cs" Inherits="EditingRoutes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<% $ConnectionStrings:BusBooking %>" runat="server"
       UpdateCommand="Update buses set Company=@Company, Source=@Source, Destination=@Destination, DepartureTime=@DepartureTime,ArrivalTime=@ArrivalTime,Duration=@Duration,Seats=@Seats,Price=@Price where BusID=@BusID"
       SelectCommand="Select * from buses" 
        DeleteCommand ="Delete from buses where BusID=@BusID"
          ></asp:SqlDataSource>
    <asp:Label ID="Message" runat="server" Text=""></asp:Label>
    <div style="text-align:center;margin-top:5%">
        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Create.aspx" runat="server" Width="130px" Height="40px" BackColor="#4285F4" CssClass="link1">Create</asp:HyperLink>        
    </div>
    <div style="width:100%;display:flex;justify-content:center;margin-top:5%;border-radius:5%">
    <asp:GridView ID="GridView1" ShowHeader="true" DataSourceID="SqlDataSource1" DataKeyNames="BusID" AllowSorting="true" AutoGenerateColumns="false" AutoGenerateDeleteButton="true" AutoGenerateEditButton="true" runat="server"
        CellPadding="10"
        CellSpacing="10"
        BorderColor="#e0e0e0"
        BorderWidth="3"
        
        >
        <Columns>
            <asp:BoundField HeaderText="BusID" DataField="BusID" ReadOnly="true" />
            <asp:TemplateField HeaderText="Company">
                <ItemTemplate>
                    <%#Eval("Company") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Company" Text='<%#Bind("Company") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="Company" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the company"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Source">
                <ItemTemplate >
                    <%#Eval("Source") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Source_text" Text='<%#Bind("Source") %>' runat="server"></asp:TextBox>
                    <asp:CustomValidator ControlToValidate="Source_text" OnServerValidate="validate_city" ID="CustomValidator1" runat="server" ErrorMessage="Please enter a valid City!"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ControlToValidate="Source_text" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter the field"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="DepartureTime" SortExpression="DepartureTime">
                 <ItemTemplate>
                    <%#Eval("DepartureTime") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="DepartureTime" TextMode="Time" Text='<%#Bind("DepartureTime") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="DepartureTime" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter the time"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Destination">
                <ItemTemplate>
                    <%#Eval("Destination") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Destination" Text='<%#Bind("Destination") %>' runat="server"></asp:TextBox>
                    <asp:CustomValidator ControlToValidate="Destination" OnServerValidate="validate_city" ID="CustomValidator2" runat="server" ErrorMessage="Please enter a valid City!"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ControlToValidate="Destination" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter the city"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="ArrivalTime" SortExpression="ArrivalTime">
                 <ItemTemplate>
                    <%#Eval("ArrivalTime") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="ArrivalTime" TextMode="Time" Text='<%#Bind("ArrivalTime") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="ArrivalTime" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter the time"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                <ItemTemplate>
                    <%#Eval("Duration") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Duration" Text='<%#Bind("Duration") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="Duration" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter the duration"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Seats Available">
                <ItemTemplate>
                    <%#Eval("Seats") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Seats" Text='<%#Bind("Seats") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="Seats" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter the duration"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                <ItemTemplate>
                    <%#Eval("Price") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="Price" Text='<%#Bind("Price") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="Price" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter the company"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
          
        </Columns>
    </asp:GridView>
        </div>
    <br /><br />
</asp:Content>

