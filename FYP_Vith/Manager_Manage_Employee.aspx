<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Manager_Manage_Employee.aspx.cs" Inherits="FYP_Vith.Manager_Manage_Employee" %>

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
                <h4 class="m-t-0 header-title">Manage Employee</h4>
                <p class="text-muted font-14 m-b-30">
                    This is a panel manager can increment the base salary or change the position of employees
                </p>

                <table id="responsive-datatable" class="table table-bordered table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Employee Id</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Date Registered</th>
                            <th>Position</th>
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
                            <td><%=sdr["Emp_id"] %></td>
                            <td><%=sdr["Fullname"] %></td>
                            <td><%=sdr["Email"] %></td>
                            <td><%=sdr["Contact"] %></td>
                            <td><%=sdr["Date_of_join"] %></td>
                            <td><%=sdr["Position"] %></td>
                            <td><%=sdr["Salary"] %></td>

                            <td><a class="btn btn-dark editempbut" data-id="<%=sdr["Emp_id"] %>" data-editemp='{"id":"<%=sdr["Emp_id"] %>","position":"<%=sdr["Position"] %>","salary":"<%=sdr["Salary"] %>"}' data-toggle="modal" href="#editemployee">Edit</a></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- end row -->

    <!-- add employee modal -->
    <div id="editemployee" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="Manager_Manage_Employee.aspx?editemployee=true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Edit Employee</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fieldemail" class="control-label">Employee ID</label>
                                    <input id="mempid" class="form-control" type="text" value="" name="empid" required readonly />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fieldemail" class="control-label">Select new position</label>
                                    <select name="position" class="form-control" id="position" onchange="checksalary()" required>
                                        <option value="Junior Employee">Junior Employee</option>
                                        <option value="Senior Employee">Senior Employee</option>
                                        <option value="Manager">Manager</option>
                                        <option value="Senior Manager">Senior Manager</option>
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
                            <div class="col-md-6">
                                <div class="form-group no-margin">
                                    <label for="salary" class="control-label">Addition</label>
                                    <input type="number" name="addition" value="0" class="form-control" required="required" />
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
