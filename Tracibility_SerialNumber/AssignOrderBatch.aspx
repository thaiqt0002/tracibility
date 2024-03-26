<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AssignOrderBatch.aspx.cs" Inherits="TracibilitySN.AssignOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <script>
                if (window.history.replaceState) {
                    window.history.replaceState(null, null, window.location.href);
                }
            </script>
            <script type="text/javascript">
            $(function () {
                $('#<%=DropOrder.ClientID %>').chosen();
            })
            </script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#<%=GridBatch.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
            </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row"><div class="col-md"><div class="card" style="background-color:burlywood;color:brown;text-align:center;height:2rem"><center><h3>ASSIGN ORDER</h3></center></div></div></div>
    <br />
    <div class ="row">
        <div class="col-md">
            <div class="card">
                <div class ="card-body">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md">
                                    <label><b style="color: #FF0000">Select Order Number :</b></label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:DropDownList ID="DropOrder" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropOrder_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                            <hr />
                            <br />
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-3">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" runat="server" Font-Bold="true" Text="Assign Order" OnClick="Button3_Click" />
                                </div>
                                <div class="col-md-3">
                                    <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Font-Bold="true" Text="Delete Batch No" OnClick="Button4_Click" />
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class ="col-md">
                                    <asp:GridView ID="GridBatch" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:CommandField>
                                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" SortExpression="OrderNo">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="BatchNo" HeaderText="BatchNo" SortExpression="BatchNo">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="FinishDate" HeaderText="FinishDate" DataFormatString="{0:d}" SortExpression="FinishDate">
                                                <ItemStyle Font-Bold="True"></ItemStyle>
                                            </asp:BoundField>
                                        </Columns>

                                        <EditRowStyle BackColor="#999999"></EditRowStyle>

                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SNcon %>' SelectCommand="SELECT * FROM [BatchOrder]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class ="col-md">
                            <center>
                                <br><br><br><br><br>
                                <asp:ImageButton ID="ImageButton1"  ImageUrl="imgs/down-arrow (1).png" Width="100px" runat="server" OnClick="ImageButton1_Click" />
                                <br /> <br /> <br />
                                <asp:ImageButton ID="ImageButton2" ImageUrl="imgs/up-arrow (2).png" Width="100px" runat="server" OnClick="ImageButton2_Click" />
                            </center>
                        </div>
                        <div class="col-md-6">
                            <div class ="row">
                                <div class="col-md-6">
                                    <label><b style="color: #FF0000">Input Batch Number :</b></label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="TxtBatch" CssClass="form-control" Font-Bold="true" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label><b style="color: #FF0000">Finish Date :</b></label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBox1" CssClass="form-control" Font-Bold="true"  runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:ListBox ID="ListBox1" CssClass="form-control" runat="server" Font-Size = 'X-Large' Rows = '19'
                                    ForeColors = 'Tomato' Width = '500'>
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
