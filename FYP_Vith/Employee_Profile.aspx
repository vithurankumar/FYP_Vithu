<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Employee_Profile.aspx.cs" Inherits="FYP_Vith.Employee_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%while (sdr.Read())
        { %>
    <div class="row">
        <div class="col-xl-3 col-lg-4">
            <div class="text-center card-box">
                <div class="member-card">
                    <div class="thumb-xl member-thumb m-b-10 center-block">
                        <img src="assets/images/users/download.png" class="rounded-circle img-thumbnail" alt="profile-image">
                    </div>

                    <div class="">
                        <h5 class="m-b-5"><%=sdr["Fullname"] %></h5>
                        <p class="text-muted">@<%=sdr["UserRole"] %></p>
                    </div>

                    <a href="Employee_Default.aspx" class="btn btn-success btn-sm w-sm waves-effect m-t-10 waves-light">Allowances</a>
                    <a href="Employee_Add_Enquiries.aspx" class="btn btn-danger btn-sm w-sm waves-effect m-t-10 waves-light">Enquiries</a>


                    <div class="text-left m-t-40">
                        <p class="text-muted font-13"><strong>Username :</strong> <span class="m-l-15"><%=sdr["Username"] %></span></p>

                        <p class="text-muted font-13"><strong>Email     :</strong> <span class="m-l-15"><%=sdr["Email"] %></span></p>

                        <p class="text-muted font-13"><strong>Gender    :</strong> <span class="m-l-15"><%=sdr["Gender"] %></span></p>
                    </div>

                </div>

            </div>
            <!-- end card-box -->

        </div>
        <!-- end col -->


        <div class="col-lg-8 col-xl-9">
            <div class="">
                <div class="card-box">
                    <ul class="nav nav-tabs tabs-bordered">
                        <li class="nav-item">
                            <a href="#home" data-toggle="tab" aria-expanded="false" class="nav-link">ABOUT ME
                                                </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <p class="m-b-5">
                                Hi I'm <%=sdr["Fullname"] %>, I have worked in the company since <%=sdr["Date_of_join"] %>. my position in the company is as <%=sdr["Position"] %>
                                I am glad to be here with my salary of <%=sdr["Salary"] %> now.
                            </p>

                            <div class="m-t-30">
                                <h5>Professional Information</h5>

                                <div class=" p-t-10">
                                    <h6 class="text-primary m-b-5">Date Join</h6>

                                    <p><b><%=sdr["Date_of_join"] %></b></p>

                                </div>

                                <hr>

                                <div class="">
                                    <h6 class="text-primary m-b-5">Position</h6>
                                    <p><b><%=sdr["Position"] %></b></p>


                                </div>

                                <hr>

                                <div class="">
                                    <h6 class="text-primary m-b-5">Salary</h6>
                                    <p><b>MYR <%=sdr["Salary"] %></b></p>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- end col -->
    </div>
    <!-- end row -->
    <%} %>
</asp:Content>
