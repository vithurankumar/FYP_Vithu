<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Admin_Manage_Employee.aspx.cs" Inherits="FYP_Vith.Admin_Manage_Employee" %>

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
                    This is a panel for the admin to manage the employees, you can add, edit or delete the employees
                </p>
                <button data-toggle="modal" data-target="#add-emp-modal" class="btn btn-primary" style="margin-bottom: 2em">Add Employee</button>

                <table id="responsive-datatable" class="table table-bordered table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Fullname</th>
                            <th>Position</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Start date</th>
                            <th>Salary</th>
                            <th>Control</th>
                        </tr>
                    </thead>


                    <tbody>
                        <%
                            while (sdr.Read())
                            {
                            %>
                        <tr>
                            <td><%=sdr["Fullname"] %></td>
                            <td><%=sdr["Position"] %></td>
                            <td><%=sdr["Email"] %></td>
                            <td><%=sdr["Contact"] %></td>
                            <td><%=sdr["Date_of_join"] %></td>
                            <td><%=sdr["Salary"] %></td>
                            <td><a class="btn btn-info" href="Admin_Update_Employee.aspx?editid=<%=sdr["Emp_id"] %>">Update</a> <a class="btn btn-danger" href="Admin_Manage_Employee.aspx?delete=<%=sdr["Emp_id"] %>&email=<%=sdr["Email"] %>">Delete</a></td>
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
                <form method="post" action="Admin_Manage_Employee.aspx?addemployee=true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Add Employee</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fieldname" class="control-label">Name</label>
                                    <input type="text" name="name" class="form-control" id="fieldname" placeholder="your name" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fieldemail" class="control-label">Email</label>
                                    <input type="email" name="email" class="form-control" id="fieldemail" placeholder="your email" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="contact" class="control-label">Contact</label>
                                    <input type="number" name="contact" class="form-control" id="contact" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fieldgender" class="control-label">Gender</label>
                                    <select name="gender" class="form-control" id="fieldgender" required>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
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
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group no-margin">
                                    <label for="field-7" class="control-label">Date Join</label>
                                    <input type="date" name="datejoin" class="form-control" id="field-7" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group no-margin">
                                    <label for="position" class="control-label">Position</label>
                                    <select name="position" class="form-control" id="position" onchange="checksalary()" required>
                                        <option value="IT Trainee">IT Trainee</option>
                                        <option value="IT Junior">IT Junior</option>
                                        <option value="IT Senior">IT Senior</option>
                                        <option value="Business Trainee">Business Trainee</option>
                                        <option value="Business Junior">Business Junior</option>
                                        <option value="Business Senior">Business Senior</option>
                                    </select>
                                </div>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group no-margin">
                                    <label for="salary" class="control-label">Salary</label>
                                    <input type="text" name="salary" class="form-control" id="salary" readonly required="required" />
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
