<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FYP_Vith.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/js/jquery.min.js"></script>
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
    <div class="text-center">
        <a href="index.html" class="logo-lg"><i class="md md-equalizer"></i><span>FYP HR Payroll</span> </a>
    </div>

    <form method="post" class="form-horizontal m-t-20" action="Register.aspx?register=true">

        <div class="form-group row">
            <div class="col-12">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="mdi mdi-email"></i></span>
                    </div>
                    <input class="form-control" name="email" type="email" required="" placeholder="Email">
                </div>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-12">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="mdi mdi-account"></i></span>
                    </div>
                    <input class="form-control" name="username" type="text" required="" placeholder="Username">
                </div>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-12">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="mdi mdi-key"></i></span>
                    </div>
                    <input class="form-control" id="passw" name="password" type="password" required="" placeholder="Password">
                </div>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-12">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="mdi mdi-key"></i></span>
                    </div>
                    <input class="form-control" id="co_pass" type="password" required="" placeholder="Confirm-Password">
                </div>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-12">
                <div class="checkbox checkbox-primary">
                    <input id="checkbox-signup" type="checkbox" checked="checked" required="">
                    <label for="checkbox-signup">
                        I accept <a href="#">Terms and Conditions</a>
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group text-right m-t-20">
            <div class="col-xs-12">
                <button class="btn btn-primary btn-custom waves-effect waves-light w-md" type="submit">Register</button>
            </div>
        </div>

        <div class="form-group row m-t-30">
            <div class="col-12 text-center">
                <a href="Login.aspx" class="text-muted">Already have account?</a>
            </div>
        </div>

    </form>

</asp:Content>
