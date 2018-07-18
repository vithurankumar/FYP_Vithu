<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Employee_Add_Enquiries.aspx.cs" Inherits="FYP_Vith.Employee_Add_Enquiries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">

            <div class="card-box">
                <h4 class="header-title m-t-0">Add Enquiries</h4>
                <p class="text-muted font-14 m-b-20">
                    Add enquiries to send your issues to the HRM, if you want to change your password or your info, you can make enquiries to the admin
                </p>

                <form method="post" action="Employee_Add_Enquiries.aspx?addenquiries=true">
                    <div class="form-group">
                        <label for="sendto">Send to<span class="text-danger">*</span></label>
                        <select name="sendto"  required
                            class="form-control" id="sendto">
                            <option></option>
                            <option value="Admin">Admin</option>
                            <option value="HRM">HRM</option>
                        </select>

                    </div>
                    <div class="form-group">
                        <label for="category">Category<span class="text-danger">*</span></label>
                        <select name="category" required
                            class="form-control" id="category">
                            <option></option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject<span class="text-danger">*</span></label>
                        <input type="text" name="subject"  required
                            placeholder="Subject" class="form-control" id="subject">
                    </div>
                    <div class="form-group">
                        <label for="userName">Messages<span class="text-danger">*</span></label>
                        <textarea name="messages"  required
                            placeholder="Enter Messages" class="form-control" id="messages"></textarea>
                    </div>
                    <div class="form-group">
                        <div class="checkbox checkbox-purple">
                            <input id="checkbox6a" type="checkbox"  required>
                            <label for="checkbox6a">
                                Confirmation check
                            </label>
                        </div>

                    </div>

                    <div class="form-group text-right m-b-0">
                        <button class="btn btn-primary waves-effect waves-light" type="submit">
                            Submit
                        </button>
                        <button type="reset" class="btn btn-secondary waves-effect m-l-5">
                            Cancel
                        </button>
                    </div>

                </form>
            </div>
            <!-- end card-box -->
        </div>
    </div>
</asp:Content>
