<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DisplayProducts..aspx.cs" Inherits="DisplayProducts_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <p>
    <asp:DropDownList ID="ddlChooseProducts" runat="server" DataSourceID="sqlDisplayProducts" DataTextField="ShortName" DataValueField="CategoryID">
    </asp:DropDownList>
    <br />
    <asp:SqlDataSource ID="sqlDisplayProducts" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" SelectCommand="SELECT [CategoryID], [ShortName] FROM [Categories] ORDER BY [ShortName]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlSecond" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" SelectCommand="SELECT Products.Name, Products.CategoryID, Invoices.InvoiceNumber, Invoices.OrderDate, LineItems.Quantity FROM Products INNER JOIN LineItems ON Products.ProductID = LineItems.ProductID INNER JOIN Invoices ON LineItems.InvoiceNumber = Invoices.InvoiceNumber WHERE (Products.CategoryID = @CategoryID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlChooseProducts" Name="CategoryID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="InvoiceNumber" DataSourceID="SqlSecond" ForeColor="#333333">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" />
            <ItemTemplate>
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                CategoryID:
                <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                <br />
                InvoiceNumber:
                <asp:Label ID="InvoiceNumberLabel" runat="server" Text='<%# Eval("InvoiceNumber") %>' />
                <br />
                OrderDate:
                <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                <br />
                Quantity:
                <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                <br />
<br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
</p>


</asp:Content>

