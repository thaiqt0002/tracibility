<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AssignOrder.aspx.cs" Inherits="TracibilitySN.AssignOrder1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
            </script>
            <script type="text/javascript">
                $(function () {
                    $('#<%=DropDownList1.ClientID %>').chosen();
                    $('#<%=DropDownList2.ClientID %>').chosen();
                    $('#<%=DropDownList3.ClientID %>').chosen();
                    $('#<%=CheckBox1.ClientID %>').prop('indeterminate', true)
                    $('#<%=CheckBox2.ClientID %>').prop('indeterminate', true)
            })
            </script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#<%=GridView1.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
                });
            </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row"><div class="col-md"><div class="card-header" style="background-color:lightslategray;color:white;text-align:center"><center><h4>
        ASSIGN SERIAL NUMBER TO ORDER <i>(Phase 1-2-3)</i>
    </h4></center></div></div></div>
    <div class="row">
        <div class="col-md">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="col-md">
                                <div class="card" style="height:685px;border-color:brown">
                                    <div class="card" style="background-color:gray">
                                         <center>
                                             <button type="button" class="btn btn-primary position-relative">
                                              <b>Phase 0</b>
                                              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                                5+
                                                <span class="visually-hidden">Items in Group</span>
                                              </span>
                                            </button>
                                         </center>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="container">
                                        <label><b style="color:brown">Batch Number :</b></label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                        <br />
                                        <label><b style="color:brown">Order Number :</b></label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:Label ID="Label2" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                        <br />
                                        <label><b style="color:brown">Material ID :</b></label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox ID="TxtMaterial1" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <label><b style="color:brown">Material Description :</b></label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox ID="TxtDESC1" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <label><b style="color:brown">Total Qty Order :</b></label>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox ID="Txttotal1" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card" style="background-color:lightgray">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <asp:CheckBox ID="CheckBox1" AutoPostBack="true" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                            <label><b style="color:brown">Select All</b></label>
                                            <asp:ListBox ID="ListBox1" SelectionMode="Multiple" CssClass="form-control"  runat="server"  Font-Size = 'X-Large' Rows = '18' ForeColors = 'Tomato'></asp:ListBox>                              
                                        </div>
                                        <div class="col-md-2">
                                            <center>
                                                <br /><br /><br /><br /><br /><br /><br />
                                                <asp:ImageButton ID="ImageButton1" src="imgs/right-chevron.png" Width="100px" runat="server" OnClick="ImageButton1_Click" />
                                                <br /><br /><br />
                                                <asp:ImageButton ID="ImageButton2" src="imgs/left-chevron.png" Width="100px" runat="server" OnClick="ImageButton2_Click" />
                                            </center>
                                        </div>
                                        <div class="col-md">
                                            <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox2_CheckedChanged" />
                                            <label><b style="color:brown">Select All</b></label>
                                            <asp:ListBox ID="ListBox2" SelectionMode="Multiple" CssClass="form-control"  runat="server"  Font-Size = 'X-Large' Rows = '18' ForeColors = 'Tomato'></asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                                <div class ="row">
                                    <div class="col-md">
                                        <div class="card" style="border-color:brown;height:685px">
                                              <div class="card" style="background-color:cadetblue">
                                                     <center>
                                                         <button type="button" class="btn btn-primary position-relative">
                                                          <b>Phase 1-2-3</b>
                                                          <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                                            3+
                                                            <span class="visually-hidden">Items in Group</span>
                                                          </span>
                                                        </button>
                                                     </center>
                                                </div>
                                            <br /><br />
                                            <div class="container">
                                                <label><b style="color:brown">Order Number :</b></label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server"></asp:DropDownList>
                                                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                                                    </div>
                                                </div>  
                                                <br />
                                                <label><b style="color:brown">Material ID :</b></label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <asp:TextBox ID="TxtMaterial2" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <br />
                                                <label><b style="color:brown">Material Description :</b></label>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <asp:TextBox ID="TxtDESC2" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>                        
                                            <div class="container">
                                                <hr />
                                                <br /><br />
                                                <center>
                                                    <div class="form-group">
                                                        <asp:Button ID="BtnAssign" class="btn btn-lg btn-primary" runat="server" Text="Assign Order" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Button ID="BtnUnassign" class="btn btn-lg btn-danger" runat="server" Text="Unassign Order" />
                                                    </div>
                                                </center>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="card-body">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
                                        <asp:BoundField DataField="UsID" HeaderText="UsID" SortExpression="UsID"></asp:BoundField>
                                        <asp:BoundField DataField="Order" HeaderText="Order" SortExpression="Order"></asp:BoundField>
                                        <asp:BoundField DataField="SerialSN" HeaderText="SerialSN" SortExpression="SerialSN"></asp:BoundField>
                                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                                        <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate"></asp:BoundField>
                                        <asp:BoundField DataField="ModifyDate" HeaderText="ModifyDate" SortExpression="ModifyDate"></asp:BoundField>
                                        <asp:BoundField DataField="BatchNo" HeaderText="BatchNo" SortExpression="BatchNo"></asp:BoundField>
                                        <asp:BoundField DataField="ModifyUser" HeaderText="ModifyUser" SortExpression="ModifyUser"></asp:BoundField>
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
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SNcon %>' SelectCommand="SELECT * FROM [Initialize_SN]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
</asp:Content>
