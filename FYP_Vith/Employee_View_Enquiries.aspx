<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Employee_View_Enquiries.aspx.cs" Inherits="FYP_Vith.Employee_View_Enquiries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="portlet">
                <div class="portlet-heading bg-primary"> <!-- bg-success, bg-danger -->
                    <h3 class="portlet-title">Category
                    </h3>
                    <div class="portlet-widgets">
                        <span>To: Admin</span>
                        <span class="divider"></span>
                        <span>Status</span>
                        <span class="divider"></span>
                        <span>14/5/2018 15:12AM</span>
                        <span class="divider"></span>
                        <a href="javascript:;" data-toggle="reload"><i class="ion-refresh"></i></a>
                        <span class="divider"></span>
                        <a data-toggle="collapse" data-parent="#accordion1" href="#bg-default"><i class="ion-minus-round"></i></a>
                        
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="bg-default" class="panel-collapse collapse">
                    <div class="portlet-body">

                        <h5>Employee Fullname: amam</h5>
                        <hr />
                        <h5>Employee Email   : amammustofa@gmail.com</h5>
                        <hr />
                        <h5>Subject          : please</h5>
                        <hr />
                        <br />
                        <p>messages asdfadfasdfsf</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
