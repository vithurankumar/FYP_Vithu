<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Manager_Allowance_Details.aspx.cs" Inherits="FYP_Vith.Manager_Allowance_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%

        while (sdr.Read())
        {
           
    %>
    <div class="row">
        <div class="col-12">
            <div class="card-box">

                <div class="panel-body">
                    <div class="clearfix">
                        <div class="pull-left">
                            <h3 class="text-right"><i class="mdi mdi-radar"></i>HR Payroll</h3>
                        </div>
                        <div class="pull-right">
                            <h6>Allowance Invoice #<%=sdr["AL_id"] %>
                                <br>
                                <strong>For Date  <%=sdr["Month"] %> <%=sdr["Year"] %></strong>
                            </h6>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-12">
                            <div class="pull-left m-t-30">
                                <address>
                                    <strong>To <%=sdr["Fullname"] %></strong><br>
                                    <abbr title="Position">P:</abbr>
                                    <%=sdr["Position"].ToString() %><br>
                                    <abbr title="Email">E:</abbr>
                                    <%=sdr["Email"].ToString() %><br>
                                    <abbr title="Contact">C:</abbr>
                                    <%=sdr["Contact"].ToString() %>
                                </address>
                            </div>
                            <div class="pull-right m-t-30">
                                <p><strong>Allowance Date: </strong><%=sdr["DateCreated"] %></p>
                                <p class="m-t-10"><strong>HRM in Charge: </strong><%=hrmusername%></p>
                                <p class="m-t-10"><strong>HRM Email: </strong><%=hrmemail %></p>
                            </div>
                        </div>
                    </div>
                    <div class="m-h-50"></div>
                    <div class="row">
                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table m-t-30">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Date Allowance</th>
                                            <th>Employee name</th>
                                            <th>Net Salary</th>
                                            <th>Overtime</th>
                                            <th>Medical</th>
                                            <th>Bonus</th>
                                            <th>Deduct Pay</th>
                                            <th>Leave Days</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><%=sdr["AL_id"] %></td>
                                            <td><%=sdr["Month"] %> <%=sdr["Year"] %></td>
                                            <td><%=sdr["Fullname"] %></td>
                                            <td><%=sdr["Salary"] %></td>
                                            <td><%=sdr["Overtime"] %></td>
                                            <td><%=sdr["Medical"] %></td>
                                            <td><%=sdr["Bonus"] %></td>
                                            <td><%=sdr["Deduct_pay"] %></td>
                                            <td><%=sdr["Deduct_leave_days"] %></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="clearfix m-t-40">
                                <h5 class="small text-inverse">PAYMENT TERMS AND POLICIES</h5>

                                <small>All accounts are to be paid within 7 days from receipt of
                                                        allowance. To be paid by cheque or credit card or direct payment
                                                        online. If account is not paid within 7 days the credits details
                                                        supplied as confirmation of work undertaken will be charged the
                                                        agreed quoted fee noted above.
                                </small><br />
                                <small>1 hour for overtime: + MYR 15</small><br />
                                <small>1 day for leave day: - MYR 50</small>
                            </div>
                        </div>
                        <div class="col-6">
                            <p class="text-right"><b>Gov. Tax:</b> 2%</p>
                            <hr>
                            <h4 class="text-right">MYR <%=sdr["Total"]%></h4>
                        </div>
                    </div>
                    <hr>
                    <div class="d-print-none">
                        <div class="text-right">
                            <a href="javascript:window.print()" class="btn btn-dark waves-effect waves-light"><i class="fa fa-print"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
