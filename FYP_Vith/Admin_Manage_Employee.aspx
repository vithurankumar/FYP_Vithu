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
                            <th>Name</th>
                            <th>Position</th>
                            <th>Office</th>
                            <th>Age</th>
                            <th>Start date</th>
                            <th>Salary</th>
                        </tr>
                    </thead>


                    <tbody>
                        <tr>
                            <td>Tiger Nixon</td>
                            <td>System Architect</td>
                            <td>Edinburgh</td>
                            <td>61</td>
                            <td>2011/04/25</td>
                            <td>$320,800</td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- end row -->
    <div id="add-emp-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Add Employee</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="fieldname" class="control-label">Name</label>
                                <input type="text" class="form-control" id="fieldname" placeholder="your name">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="fieldemail" class="control-label">Email</label>
                                <input type="email" class="form-control" id="fieldemail" placeholder="your email">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="fieldgender" class="control-label">Gender</label>
                                <select class="form-control" id="fieldgender">
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
                                <input type="text" class="form-control" id="field-3" placeholder="email">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-4" class="control-label">Password</label>
                                <input type="password" class="form-control" id="field-4" placeholder="password">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group no-margin">
                                <label for="field-7" class="control-label">Date Join</label>
                                <input type="date" class="form-control" id="field-7">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group no-margin">
                                <label for="position" class="control-label">Position</label>
                                <select class="form-control" id="position" onchange="checksalary()">
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
                                <input type="text" class="form-control" id="salary" disabled required="required" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-info waves-effect waves-light">Save changes</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
