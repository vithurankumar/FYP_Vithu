<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Contactus.aspx.cs" Inherits="FYP_Vith.Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="text-center">
                <h3 class="font-600">Give us your feedback</h3>
                <p class="text-muted">
                    You might seen this application is not perfect application, you can drop us any comments to our admin to enhance further the system
                    . so in the future reusability of the system can be made to be accepted by the users.
                </p>

                <button type="button" data-toggle="modal" data-target="#con-close-modal" class="btn btn-success waves-effect waves-light m-t-10">Send us your question</button>

            </div>
        </div>
        <!-- end col -->
    </div>

    <div class="row m-t-40">
        <div class="col-lg-9 center-page">
            <div>
                <div class="question-q-box">Q.</div>
                <h4 class="question">What is HR Payroll System</h4>
                <p class="answer">
                    APU Human Resource Management Online Payroll System will be a web based system with combination of database 
                                which would provide enhances features to administrator to manage existing employees data in a more organized 
                                and systematic way, allowing to register details of new employees and providing flexibility to employees to 
                                view their amount earned during that period of work and reimbursements, bonuses, overtime and holiday pay. 
                                In addition, employees able to view and make changes to their personal information and send in enquiry.
                </p>
            </div>

            <div>
                <div class="question-q-box">Q.</div>
                <h4 class="question">Where is the location of the office?</h4>
                <p class="answer">It is located at Endah Promenade Condominium, Sri Petaling, Kuala Lumpur, Malaysia</p>
            </div>

            <div>
                <div class="question-q-box">Q.</div>
                <h4 class="question">May I know your contact number?</h4>
                <p class="answer">
                    You can contact us via phone or whatsapp : +60182655318
                </p>
            </div>

            <div>
                <div class="question-q-box">Q.</div>
                <h4 class="question">May I know the email?</h4>
                <p class="answer">
                    You can further email us at : hrpayrollsystemapu@mail.apu.edu.my
                </p>
            </div>
        </div>
    </div>

    <div id="con-close-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="Contactus.aspx?addfeedback=true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Feedback Enquiries</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="field-3" class="control-label">Email Address</label>
                                    <input type="text" class="form-control" name="email" id="field-3" placeholder="email">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="field-4" class="control-label">Subject</label>
                                    <input type="text" class="form-control" name="subject" id="field-4" placeholder="subject">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group no-margin">
                                    <label for="field-7" class="control-label">Message</label>
                                    <textarea class="form-control" id="field-7" name="message" placeholder="Write something..."></textarea>
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
    <!-- /.modal -->
</asp:Content>
