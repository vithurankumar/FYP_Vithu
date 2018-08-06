<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Manager_Enquiries.aspx.cs" Inherits="FYP_Vith.Manager_Enquiries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <%
            while (sdr.Read())
            {
        %>
        <div class="col-lg-12">
            <div class="portlet">
                <div class="portlet-heading <%if (sdr["Status"].ToString() == "Pending")
                    { %>
                    bg-primary<%}
                    else if (sdr["Status"].ToString() == "Approved")
                    { %>bg-success<%}
                    else if (sdr["Status"].ToString() == "Declined")
                    { %>bg-danger<%} %>">
                    <!-- bg-success, bg-danger -->
                    <h3 class="portlet-title"><%=sdr["Category"] %>
                    </h3>
                    
                    <div class="portlet-widgets">
                        <span>To: <%=sdr["Sending_to"] %></span>
                        <span class="divider"></span>
                        <span><%=sdr["Status"] %></span>
                        <span class="divider"></span>
                        <span><%=sdr["DateCreated"] %></span>
                        <span class="divider"></span>
                        <a href="javascript:;" data-toggle="reload"><i class="ion-refresh"></i></a>
                        <span class="divider"></span>
                        <a data-toggle="collapse" data-parent="#accordion1" href="#bg-default<%=sdr["Enq_id"] %>"><i class="ion-minus-round"></i></a>
                        <span class="divider"></span>
                        <a href="Admin_Enquiries.aspx?eid=<%=sdr["Enq_id"] %>&delete=true"><i class="ion-close"></i></a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="bg-default<%=sdr["Enq_id"] %>" class="panel-collapse collapse">
                    <div class="portlet-body">

                        <h5>Employee Id: <%=sdr["Emp_id"] %></h5>
                        <hr />
                        <h5>Employee Email   : <%=sdr["Email"] %></h5>
                        <hr />
                        <h5>Subject          : <%=sdr["Subject"] %></h5>
                        <%
                            if (sdr["Status"].ToString() == "Pending")
                            {
                        %>
                        <hr />
                        <div class="form-group">
                            <a href="Manager_Enquiries.aspx?eid=<%=sdr["Enq_id"] %>&status=Approved" class="btn btn-success">Approve</a>
                            <a href="Manager_Enquiries.aspx?eid=<%=sdr["Enq_id"] %>&status=Declined" class="btn btn-danger">Decline</a>
                        </div>
                        <%} %>
                        <hr />
                        <br />
                        <p><%=sdr["Messages"] %></p>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
    </div>
</asp:Content>

