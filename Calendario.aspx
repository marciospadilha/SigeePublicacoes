<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendario.aspx.cs" Inherits="Sigee.Calendario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <link rel="stylesheet" href="LTE/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <link rel="stylesheet" href="LTE/plugins/fullcalendar/fullcalendar.min.css" />
    <link rel="stylesheet" href="LTE/plugins/fullcalendar/fullcalendar.print.css" media="print" />
    <link rel="stylesheet" href="LTE/dist/css/AdminLTE.min.css" />
    <link rel="stylesheet" href="LTE/dist/css/skins/_all-skins.min.css" />
</head>
<body>
    <form id="form" runat="server">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-body no-padding">
                        <div id="calendario"></div>
                    </div>
                </div>
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
        <asp:Literal ID="literal" runat="server"></asp:Literal>
    </form>
</body>
</html>