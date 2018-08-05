<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Employee_Default.aspx.cs" Inherits="FYP_Vith.Employee_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <!-- Responsive datatable examples -->
    <link href="plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
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
                <h4 class="m-t-0 header-title">View Allowances</h4>
                <p class="text-muted font-14 m-b-30">
                    Employee can view their allowance detail for the months
                </p>

                <table id="responsive-datatable" class="table table-bordered table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Date Allowance</th>
                            <th>Employee name</th>
                            <th>Net Salary</th>
                            <th>Bonuses</th>
                            <th>Deduction</th>
                            <th>Gross Salary</th>
                            <th>Timestamp</th>
                        </tr>
                    </thead>


                    <tbody>
                        <%
                            while (sdr.Read())
                            {
                        %>
                        <tr>
                            <td><%=sdr["Month"] %> <%=sdr["Year"] %></td>
                            <td><%=sdr["Fullname"] %></td>
                            <td><%=sdr["Salary"] %></td>
                            <td><%=sdr["Bonuses"] %></td>
                            <td><%=sdr["Deduct_total"] %></td>
                            <td><%=sdr["Total"] %></td>
                            <td><%=sdr["DateCreated"] %></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- end row -->
</asp:Content>
