<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/SigeeMaster.Master"
    AutoEventWireup="true"
    CodeBehind="Tarefas.aspx.cs"
    Inherits="Sigee.Tarefas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphConteudoPrincipal" runat="server">
    <asp:MultiView runat="server" ID="multiview">
        <asp:View ID="view" runat="server">
            <div class="row mt">
                <div class="col-lg-12">
                    <p style="text-align: center;">
                        <asp:Button ID="btnIncluir" runat="server" Text="Incluir" CssClass="btn btn-primary" OnClick="btnIncluir_Click" />
                    </p>
                </div>
            </div>
            <asp:Panel runat="server" ID="pnlBuscaPerfil" CssClass="row mt">
                <div class="col-lg-12">
                    <asp:DropDownList 
                        runat="server" 
                        ID="ddlPerfil" 
                        CssClass="form-control"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlPerfil_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </asp:Panel>

            <asp:Literal runat="server" ID="ltlCalendario"></asp:Literal>
            <%--<iframe id="frame" src="Calendario.aspx" style="background-color: transparent; border: none; height: 800px; width: 100%"></iframe>
            --%>
            <%--<link rel="stylesheet" href="LTE/bootstrap/css/bootstrap.min.css" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
            <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
            <link rel="stylesheet" href="LTE/plugins/fullcalendar/fullcalendar.min.css" />
            <link rel="stylesheet" href="LTE/plugins/fullcalendar/fullcalendar.print.css" media="print" />
            <link rel="stylesheet" href="LTE/dist/css/AdminLTE.min.css" />
            <link rel="stylesheet" href="LTE/dist/css/skins/_all-skins.min.css" />
            <div class="row">
                <div class="col-md-9">
                    <div class="box box-primary">
                        <div class="box-body no-padding">
                            <div id="calendario"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt">
                <div class="col-lg-12">
                    <p style="text-align: center;">
                        <asp:Button ID="btnIncluir" runat="server" Text="Incluir" CssClass="btn btn-primary" OnClick="btnIncluir_Click" />
                    </p>
                </div>
            </div>
            <script src="LTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
            <script src="LTE/bootstrap/js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
            <script src="LTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
            <script src="LTE/plugins/fastclick/fastclick.min.js"></script>
            <script src="LTE/dist/js/app.min.js"></script>
            <script src="LTE/dist/js/demo.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
            <script src="LTE/plugins/fullcalendar/fullcalendar.min.js"></script>
            <asp:Literal ID="literal" runat="server"></asp:Literal>--%>
        </asp:View>
    </asp:MultiView>
</asp:Content>