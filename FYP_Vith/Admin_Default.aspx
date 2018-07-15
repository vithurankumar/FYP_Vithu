<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Admin_Default.aspx.cs" Inherits="FYP_Vith.Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <h3 class="col-sm-12 title"><b>Feedbacks</b><a href="#" class="btn btn-toolbar float-right">Delete all</a></h3>
        <%
            while (sdr.Read())
            {
        %>
        <div class="col-sm-12">
            <div class="card-box m-t-20">
                <h4 class="m-t-0 font-18"><b><%=sdr["Subject"] %></b><a href="Admin_Default.aspx?deletefeedback=<%=sdr["F_id"] %>" style="float: right">x</a></h4>

                <hr />

                <div class="media m-b-30">
                    <img class="d-flex mr-3 rounded-circle thumb-sm" src="assets/images/users/avatar-1.jpg" alt="Generic placeholder image">
                    <div class="media-body">
                        <span class="media-meta pull-right"><%=sdr["DateCreated"] %></span>
                        <h4 class="text-primary font-16 m-0">User</h4>
                        <small class="text-muted">From: <%=sdr["Email"] %></small>
                    </div>
                </div>

                <p><%=sdr["Messages"] %></p>

                <hr />

         
            </div>

        </div>
        <%} %>
    </div>
</asp:Content>
