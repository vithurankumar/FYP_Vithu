<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Admin_Update_Employee.aspx.cs" Inherits="FYP_Vith.Admin_Update_Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var password = document.getElementById("passw")
                , confirm_password = document.getElementById("co_pass");

            function valpass() {
                if (password.value.length < 6) {
                    password.setCustomValidity("must be 6 or more characters");
                }

                else {
                    password.setCustomValidity('');
                }
            }

            function validatePassword() {
                if (password.value != confirm_password.value) {
                    confirm_password.setCustomValidity("Passwords do not match");
                }
                else {
                    confirm_password.setCustomValidity('');
                }
            }

            password.onkeyup = valpass;
            confirm_password.onkeyup = validatePassword;
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title">Edit Employee</h4>
                <p class="text-muted m-b-30 font-14">
                    <code>Edit the employee</code>
                </p>

                <div class="row">
                    <div class="col-12">
                        <div class="p-20">
                            <form class="form-horizontal" role="form" method="post" action="Admin_Update_Employee.aspx?editid=<%=Request.QueryString["editid"] %>&edit=true">
                                <div class="form-group row">
                                    <label class="col-2 col-form-label">Full Name</label>
                                    <div class="col-10">
                                        <input name="name" type="text" class="form-control" value="<%=fullname %>" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-2 col-form-label">Gender</label>
                                    <div class="col-10">
                                        <select name="gender" class="form-control" required>
                                            <option <%if (gender.Trim() == "Male")
                                                { %>selected<%} %> value="Male">Male</option>
                                            <option <%if (gender.Trim() == "Female")
                                                { %>selected<%} %> value="Female">Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-2 col-form-label">Contact</label>
                                    <div class="col-10">
                                        <input name="contact" type="number" class="form-control" value="<%=contact %>" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-2 col-form-label">Email</label>
                                    <div class="col-10">
                                        <input type="email" class="form-control" value="<%=email %>" required readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-2 col-form-label">Date Join</label>
                                    <div class="col-10">
                                        <input type="date" class="form-control" value="<%=datejoin %>" required readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-2 col-form-label">Position</label>
                                    <div class="col-10">
                                        <input type="text" class="form-control" value="<%=position %>" readonly required />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-2 col-form-label">Salary</label>
                                    <div class="col-10">
                                        <input type="text" class="form-control" id="salary" value="<%=salary %>" readonly required="required" />
                                    </div>
                                </div>
                                <div class="row justify-content-center">

                                    <button class="col-sm-3 btn btn-confirm" style="margin: 1.1em" type="submit">Edit Change </button>
                                    <button class="col-sm-3 btn btn-confirm" style="margin: 1.1em" type="button" data-toggle="modal" data-target="#changepass">Change Password </button>
                                    <button class="col-sm-3 btn btn-cancel" style="margin: 1.1em" type="reset">Cancel </button>
                                    <a class="col-sm-3 btn btn-primary" style="margin: 1.1em" href="Admin_Manage_Employee.aspx">Back to Manage Employees</a>
                                </div>

                            </form>
                        </div>
                    </div>

                </div>
                <!-- end row -->

            </div>
            <!-- end card-box -->
        </div>
        <!-- end col -->
    </div>
    <!-- add employee modal -->
    <div id="changepass" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="Admin_Update_Employee.aspx?editid=<%=Request.QueryString["editid"] %>&changepass=true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Change Employee Password</h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fieldemail" class="control-label">New Password</label>
                                    <input id="passw" class="form-control" type="password" name="password" required />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fieldemail" class="control-label">Confirm New Password</label>
                                    <input id="co_pass" class="form-control" type="password" name="conpass" required />
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
