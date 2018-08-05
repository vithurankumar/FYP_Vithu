<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Manager_Manage_Allowance.aspx.cs" Inherits="FYP_Vith.Manager_Manage_Allowance" %>

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
                <h4 class="m-t-0 header-title">Add Allowance</h4>
                <p class="text-muted font-14 m-b-30">
                    This is a panel for the manager to manage the allowances, you can add and view the allowances
                </p>
                <button data-toggle="modal" data-target="#add-allowance" class="btn btn-primary" style="margin-bottom: 2em">Add Allowance</button>

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
                            <th>Control</th>
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
                            <td><a class="btn btn-info" href="Manager_Allowance_Details.aspx?viewid=<%=sdr["Al_id"] %>">View</a></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- end row -->

    <!-- add employee modal -->
    <div id="add-allowance" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="Manager_Manage_Allowance.aspx?addallowance=true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Add Allowance (In MYR)</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fieldgender" class="control-label">Select Employee</label>
                                    <select id="empid" name="empid" onchange="assignnetsal()" class="form-control" required>
                                        <option>Select...</option>
                                        <%
                                            foreach (var pair in allemployees)
                                            {
                                        %>
                                        <option value="<%=pair.Key %>"><%=pair.Value %></option>
                                        <%} %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="fieldgender" class="control-label">Select Year</label>
                                    <select name="year" class="form-control" required>
                                        <option>Select...</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="fieldgender" class="control-label">Select Month</label>
                                    <select name="month" class="form-control" required>
                                        <option>Select...</option>
                                        <option value="January">January</option>
                                        <option value="February">February</option>
                                        <option value="March">March</option>
                                        <option value="April">April</option>
                                        <option value="May">May</option>
                                        <option value="June">June</option>
                                        <option value="July">July</option>
                                        <option value="August">August</option>
                                        <option value="September">September</option>
                                        <option value="October">October</option>
                                        <option value="November">November</option>
                                        <option value="December">December</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="field-3" class="control-label">Overtime (hour/s)</label>
                                    <input type="number" name="overtime" onchange="checkbonus();checkgross();" value="0" class="form-control" id="overtime" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="field-4" class="control-label">Medical</label>
                                    <input type="number" name="medical" onchange="checkbonus();checkgross();" value="200" class="form-control" id="medical" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="field-4" class="control-label">Bonus</label>
                                    <input type="number" name="bonus" onchange="checkbonus();checkgross();" value="0" id="bonus" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-4" class="control-label">Direct Deduct</label>
                                    <input type="number" name="dirdeduct" onchange="checkdeduct();checkgross();" value="0" id="dirdeduct" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-4" class="control-label">Leave Days (day/s)</label>
                                    <input type="number" name="leavedays" value="0" onchange="checkdeduct();checkgross();" id="leavedays" class="form-control"required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group no-margin">
                                    <label for="salary" class="control-label">Total Bonuses</label>
                                    <input type="number" name="totbonus" value="0" class="form-control" id="totbonus" readonly required="required" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group no-margin">
                                    <label for="salary" class="control-label">Total Deduction</label>
                                    <input type="number" name="totdeduct" value="0" class="form-control" id="totdeduct" readonly required="required" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group no-margin">
                                    <label for="salary" class="control-label">Net Salary</label>
                                    <input type="number" class="form-control" id="netsal" readonly required="required" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group no-margin">
                                    <label for="salary" class="control-label">Gross Salary (tax 2%)</label>
                                    <input type="number" name="grosssal" class="form-control" id="grosssal" readonly required="required" />
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
