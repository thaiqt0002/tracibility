<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AssignBatch.aspx.cs" Inherits="TracibilitySN.AssignBatch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
                <script>
                if (window.history.replaceState) {
                    window.history.replaceState(null, null, window.location.href);
                }
                </script>
                <script type="text/javascript">
                    $(function () {
                        $('#<%=DropSelectOrder.ClientID %>').chosen();
                    })
                </script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#<%=GridView1.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
                    });
                </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md">
            <div class="card-header" style="text-align:center;color:whitesmoke;background-color:lightslategray"><center><h4>ASSIGN BATCH TO ORDER (<i>Phase 0</i>)</h4></center></div></div></div>
    <div class="row">
        <div class="col-md">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card" style="background-color:cadetblue">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label><b style="color:white">Select Order Number :</b></label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:DropDownList ID="DropSelectOrder" Font-Bold="true" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropSelectOrder_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                                                </div>
                                            </div>
                                            <br /><hr /><br />
                                            <label><b style="color:white">Search Serial No :</b></label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:TextBox ID="TxtSearch" CssClass="form-control" Font-Bold="true" runat="server" OnTextChanged="TxtSearch_TextChanged"></asp:TextBox>
                                                </div>
                                                <br />
                                                <asp:Button ID="Btnsearch" class="btn btn-lg btn-block btn-primary" runat="server" Text="Search" />
                                            </div>
                                        </div>
                                        <div class="col-md">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:ListBox ID="ListBox1" SelectionMode="Multiple" CssClass="form-control"  runat="server"  Font-Size = 'X-Large' Rows = '24' ForeColors = 'Tomato'></asp:ListBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <center>
                                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-primary" runat="server" Text=">>>" OnClick="Button1_Click" />
                                <br /><br /><br />
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="<<<" OnClick="Button2_Click" />
                            </center>
                        </div>
                        <div class="col-md">
                            <div class="card" style="background-color:cadetblue">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:ListBox ID="ListBox2" SelectionMode="Multiple" CssClass="form-control"  runat="server"  Font-Size = 'X-Large' Rows = '24' ForeColors = 'Tomato'></asp:ListBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md">
                                            <label><b style="color:white">Select Batch Number :</b></label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:TextBox ID="TxtBatch" CssClass="form-control"  runat="server"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label2" runat="server" ForeColor="Yellow"></asp:Label>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <asp:Button ID="BtnUpdate" class="btn btn-lg btn-block btn-primary" runat="server" Text="Assign Batch" OnClick="BtnUpdate_Click" />
                                                </div>
                                                <div class="col-md">
                                                    <asp:Button ID="Btndel" class="btn btn-lg btn-block btn-danger" runat="server" Text="Unassign Batch" OnClick="Btndel_Click" />
                                                </div>
                                            </div>
                                            <br /><br />
                                            <div class="card">
                                                <div class="card-body">
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                                                        <Columns>
                                                            <asp:CommandField ShowSelectButton="True">
                                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                                            </asp:CommandField>
                                                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID">
                                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Order" HeaderText="Order" SortExpression="Order">
                                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SerialSN" HeaderText="SerialSN" SortExpression="SerialSN">
                                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="BatchNo" HeaderText="BatchNo" SortExpression="BatchNo">
                                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status">
                                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

                                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

                                                        <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                                                        <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                                                        <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                                                        <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                                                        <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                                                        <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SNcon %>' SelectCommand="SELECT * FROM V_AssignBatch order by ModifyDate Desc"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
