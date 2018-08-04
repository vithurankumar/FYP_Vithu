<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Admin_Manage_HRM.aspx.cs" Inherits="FYP_Vith.Admin_Manage_HRM" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <!-- Responsive datatable examples -->
    <link href="plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">

        <div class="col-12">
            <div class="card-box table-responsive">
                <h4 class="m-t-0 header-title">Manage Employees</h4>
                <p class="text-muted font-14 m-b-30">
                    This is a panel for the admin to manage the Human Resource Manager, you can add and delete the HRM
                </p>
                <button data-toggle="modal" data-target="#add-emp-modal" class="btn btn-primary" style="margin-bottom: 2em">Add HRM</button>

                <table id="responsive-datatable" class="table table-bordered table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Control</th>
                        </tr>
                    </thead>


                    <tbody>
                        <%
                            while (sdr.Read())
                            {
                        %>
                        <tr>
                            <td><%=sdr["Username"] %></td>
                            <td><%=sdr["Email"] %></td>
                            <td><%=sdr["Password"] %></td>
                            <td><%=sdr["UserRole"] %></td>

                            <td><a class="btn btn-danger" href="Admin_Manage_HRM.aspx?delete=<%=sdr["Id"] %>">Delete</a></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- end row -->

    <!-- add employee modal -->
    <div id="add-emp-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="Admin_Manage_Employee.aspx?addhrm=true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Add HRM</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fieldemail" class="control-label">Email</label>
                                    <input type="email" name="email" class="form-control" id="fieldemail" placeholder="your email" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-3" class="control-label">Username</label>
                                    <input type="text" name="username" class="form-control" id="field-3" placeholder="username" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-4" class="control-label">Password</label>
                                    <input type="password" name="password" class="form-control" id="field-4" placeholder="password" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-info waves-effect waves-light">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- end modal -->
</asp:Content>
