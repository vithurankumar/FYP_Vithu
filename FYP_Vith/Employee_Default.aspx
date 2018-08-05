<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Employee_Default.aspx.cs" Inherits="FYP_Vith.Employee_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-12">
                        <h1>This is homepage for employee</h1>
                        <p class="text-muted">
                            Employee able to see their profile, see their monthly reports,
                            also able to send enquiries to admin or manager regarding any issues.
                        </p>

                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card-box table-responsive">
                <h4 class="m-t-0 header-title">Allowances</h4>
                <p class="text-muted font-14 m-b-30">
                    Employee allowances monthly
                </p>
                <table id="responsive-datatable" class="table table-bordered table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Fullname</th>
                            <th>Month</th>
                            <th>Year</th>
                            <th>Net Salary</th>
                            <th>Overtime</th>
                            <th>Medical</th>
                            <th>Bonus</th>
                            <th>Deduct Direct</th>
                            <th>Deduct Leave</th>
                            <th>Gross Salary</th>
                        </tr>
                    </thead>


                    <tbody>
                        <%
                            while (sdr.Read())
                            {
                        %>
                        <tr>
                            <td><%=sdr["Fullname"] %></td>
                            <td><%=sdr["Month"] %></td>
                            <td><%=sdr["Year"] %></td>
                            <td><%=sdr["Salary"] %></td>
                            <td><%=sdr["Overtime"] %></td>
                            <td><%=sdr["Medical"] %></td>
                            <td><%=sdr["Bonus"] %></td>
                            <td><%=sdr["Deduct_pay"] %></td>
                            <td><%=sdr["Deduct_leave_days"] %></td>
                            <td><%=sdr["Total"] %></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- end row -->
</asp:Content>
