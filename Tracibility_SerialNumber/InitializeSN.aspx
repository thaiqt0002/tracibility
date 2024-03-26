<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InitializeSN.aspx.cs" Inherits="TracibilitySN.InitializeSN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        </script>
        <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=GridView1.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
        </script>
        <script type="text/javascript">
            $(function () {
                $('#<%=DropOrder.ClientID %>').chosen();
            })
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md">
            <div class ="card-header" style ="text-align:center;color:whitesmoke;background-color:lightslategray"><center><h4><b>Initialize Serial Number (Phase 0)</b></h4></center></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md">
            <div class="card">
                <div class="card-body">
                    <div class="row" style="background-color:cornsilk">
                        <div class="col-md-3">
                            <label><b style="color: #FF0000">User ID :</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TxtUsID" CssClass="form-control" Font-Bold="true" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label><b style="color: #FF0000">User Name :</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TxtUsName" CssClass="form-control" Font-Bold="true" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label><b style="color: #FF0000">Order Creation Date:</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TxtOrDate" CssClass="form-control" Font-Bold="true" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label><b style="color: #FF0000">Schedules Finish:</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TxtSchedule" CssClass="form-control" Font-Bold="true" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row" style="background-color:cornsilk">
                       <div class="col-md-3">
                            <label><b style="color: #FF0000">Material ID :</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TxtMaterial" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>  
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label><b style="color: #FF0000">Material Description :</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TxtMaterialDesc" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>  
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label><b style="color: #FF0000">Cost Ctr :</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TxtCost" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <div class="row" style="background-color:cornsilk">
                        <div class="col-md-3">
                            <label><b style="color: #FF0000">Select Order No :</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:DropDownList class="col-md" Font-Bold="true" ID="DropOrder" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropStageCode_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label><b style="color: #FF0000">Input Quantity (Create SN) :</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TxtinputQuant" CssClass="form-control" Font-Bold="true" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Label ID="Lblinputquant" ForeColor="Red" runat="server"></asp:Label>
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md">
                                    <asp:Button ID="BtnAdd" class="btn btn-lg btn-block btn-success" runat="server" Font-Bold="true" Text="Generate Serial Number" OnClick="BtnAdd_Click" />                               
                                </div>
                            </div> 
                        </div>
                        <div class="col-md-3">
                            <label><b style="color: #FF0000">Total Quantity Order:</b></label>
                            &nbsp;<div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TxtQuantity" CssClass="form-control" Font-Bold="true" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md">
                                    <asp:Button ID="BtnUpdate" class="btn btn-lg btn-block btn-warning" runat="server" Font-Bold="true" Text="Update Status SN" OnClick="BtnUpdate_Click" />     
                                </div>
                                <div class="col-md-4"></div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label><b style="color: #FF0000">Location:</b></label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="Txtlocation" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                   </div>
                   <hr />
                   <div class="row" id="rowupdate" runat="server" style="background-color:bisque">
                       <div class="col-md-3">
                           <label><b style="color: #FF0000">Order No</b></label>
                           <div class="form-group">
                               <div class="input-group">
                                   <asp:TextBox ID="TxtOrderSN" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                               </div>
                           </div>
                       </div>
                       <div class="col-md-3">
                           <label><b style="color: #FF0000">Serial Number</b></label>
                           <div class="form-group">
                               <div class="input-group">
                                   <asp:TextBox ID="TxtSN" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                               </div>
                           </div>
                       </div>
                       <div class="col-md-3">
                           <label><b style="color: #FF0000">Status</b></label>
                           <div class="form-group">
                               <div class="input-group">
                                   <asp:DropDownList ID="DropStatus" CssClass="form-control" Font-Bold="true" runat="server">
                                       <asp:ListItem>Active</asp:ListItem>
                                       <asp:ListItem>Inactive</asp:ListItem>
                                   </asp:DropDownList>
                               </div>
                           </div>
                       </div>
                       <div class="col-md-3">
                           <label><b style="color: #FF0000">Create Date</b></label>
                           <div class="form-group">
                               <div class="input-group">
                                   <asp:TextBox ID="TxtMDate" CssClass="form-control" Font-Bold="true" ReadOnly="true" runat="server"></asp:TextBox>
                               </div>
                           </div>
                       </div>
                   </div>
                   <br />
                   <div class="card-body">
                       <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                           <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                           <Columns>
                               <asp:CommandField ShowSelectButton="True">
                                   <ItemStyle Font-Bold="True"></ItemStyle>
                               </asp:CommandField>
                               <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False">
                                   <ControlStyle Font-Bold="True" />
                                   <ItemStyle Font-Bold="True" />
                               </asp:BoundField>
                               <asp:BoundField DataField="UsID" HeaderText="UsID" SortExpression="UsID">
                                   <ControlStyle Font-Bold="True" />
                                   <ItemStyle Font-Bold="True" />
                               </asp:BoundField>
                               <asp:BoundField DataField="Order" HeaderText="Order" SortExpression="Order">
                                   <ItemStyle Font-Bold="True" />
                               </asp:BoundField>
                               <asp:BoundField DataField="SerialSN" HeaderText="SerialSN" SortExpression="SerialSN">
                                   <ItemStyle Font-Bold="True" />
                               </asp:BoundField>
                               <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status">
                               <ItemStyle Font-Bold="True" />
                               </asp:BoundField>
                               <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" DataFormatString="{0:MM-dd-yyyy hh:mm tt}">
                               <ItemStyle Font-Bold="True" />
                               </asp:BoundField>
                               <asp:BoundField DataField="ModifyDate" HeaderText="ModifyDate" SortExpression="ModifyDate">
                                   <ItemStyle Font-Bold="True"></ItemStyle>
                               </asp:BoundField>
                           </Columns>
                           <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                           <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                           <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                           <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                           <RowStyle BackColor="#EFF3FB"></RowStyle>

                           <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                           <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                           <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                           <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                           <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                       </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SNcon %>' SelectCommand="SELECT * from V_Initialize_SN Order by CreateDate DESC"></asp:SqlDataSource>
                   </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
