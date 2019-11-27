<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="Admin.jsp" />
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
    <style type="text/css">
        body {
            background-image: url("1.jpg");
            height: 1200px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;

        }

        /* Style the close button */
        .close {
            right: 0;
            top: 0;
        }
    </style>

    <script type="text/javascript">

        function fun() {

            var ele = document.getElementsByName('box');

            for (i = 0; i < ele.length; i++) {
                if (ele[i].checked) {


                    if (ele[i].value == "Standard") {
                        document.getElementById("Upcharge").disabled = true;
                    }
                    else {
                        document.getElementById("Upcharge").disabled = false;
                    }

                }

            }


        }
        function dis() {

            var ele = document.getElementsByName('billing');

            for (i = 0; i < ele.length; i++) {
                if (ele[i].checked) {


                    if (ele[i].value == "Prepaid") {
                        document.getElementById("refund").disabled = true;
                    }
                    else {
                        document.getElementById("refund").disabled = false;
                    }

                }

            }


        }


    </script>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Manage Set Top Box</div>
                    <div class="card-body">

                        <form class="form-horizontal" method="post" action="#">

                            <div class="form-group">
                                <label for="name" class="cols-sm-2 control-label">Type</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa"
                                                aria-hidden="true"></i></span>
                                        <input type="radio" name="box" value="Standard" id="std" checked
                                            onclick="fun()">Standard
                                        <input type="radio" name="box" value="HD" id="hd" onclick="fun()">HD
                                        <input type="radio" name="box" value="HD+" id="hd+" onclick="fun()">HD+
                                        <input type="radio" name="box" value="IPTV" id="iptv" onclick="fun()">IPTV
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="features" class="cols-sm-2 control-label">Add Features</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <select class="selectpicker" name="channels" id="channelSelect" multiple>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="cols-sm-10">

                                    <div class="input-group">


                                        <div class="features">
                                            <button type="button" class="btn btn-info" data-toggle="modal"
                                                data-target="#features">Add Features</button>
                                            <div class="modal fade" id="features" tabindex="-1" role="dialog"
                                                aria-labelledby="features" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <form action="HomeController" method="Post">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title custom_align" id="Heading">Add
                                                                    Features</h4>
                                                                <button type="button" data-dismiss="modal"
                                                                    aria-hidden="true">X</button>

                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <input type="text" id="idea" />
                                                                    <input type="button" value="add to list" id="add" />
                                                                </div>

                                                                <ul id="list">


                                                                </ul>
                                                                <script>

                                                                    function OnClose() {
                                                                        var saved = false;
                                                                        var div = this.parentElement;
                                                                        $.ajax("/InfinityDTH/HomeController?option=FeatureRemove&id="+this.id, {
                                                                            method: "DELETE",
                                                                            statusCode: {
                                                                                204: function() {
                                                                                    div.style.display = "none";
                                                                                },
                                                                                500: () => { alert("Could not delete that feature"); }
                                                                            } 
                                                                        });  
                                                                    }
                                                                    function OnClick() {
                                                                        var saved = false;
                                                                        var node = document.createElement("li");
                                                                        var textnode = document.createTextNode(document.getElementById("idea").value);
                                                                        $.post("/InfinityDTH/HomeController", {
                                                                            option: "FeatureAdd",
                                                                            featureName: textnode.textContent
                                                                        }, function(result) {
                                                                            node.appendChild(textnode);
                                                                            list.appendChild(node);
                                                                            document.getElementById("idea").value = "";
                                                                            var span = document.createElement("SPAN");
                                                                            var txt = document.createTextNode("\u00D7");
                                                                            span.className = "close";
                                                                            span.id = result.id;
                                                                            span.appendChild(txt);
                                                                            node.appendChild(span);

                                                                            for (i = 0; i < close.length; i++) {
                                                                                close[i].onclick = OnClose;
                                                                            }
                                                                        });
                                                                    }
                                                                    // Click on a close button to hide the current list item
                                                                    var close = document.getElementsByClassName("close");
                                                                    var list = document.getElementById("list");
                                                                    var i;
                                                                    for (i = 0; i < close.length; i++) {
                                                                        close[i].onclick = OnClose;
                                                                    }
                                                                    // Create a new list item when clicking on the "Add" button
                                                                    document.getElementById("add").onclick = OnClick;
                                                                </script>

                                                            </div>
                                                            <div class="modal-footer ">
                                                                <input type="hidden" name="option"
                                                                    value="UpdatePackage">
                                                                <input type="hidden" name="package_Id">
                                                                <button type="submit" class="btn btn-warning btn-lg"
                                                                    style="width: 100%;"><span
                                                                        class="glyphicon glyphicon-ok-sign"></span>�Add
                                                                    Features</button>

                                                            </div>
                                                        </div>
                                                    </form>
                                                    <!-- /.modal-content -->
                                                </div>
                                                <!-- /.modal-dialog -->
                                            </div>



                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="username" class="cols-sm-2 control-label">Dimensions</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-users fa"
                                                aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="dimension" id="dimension"
                                            placeholder="Enter length x breadth x width" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="cols-sm-2 control-label">Price</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                aria-hidden="true"></i></span>
                                        <input type="number" class="form-control" name="price" id="price"
                                            placeholder="Enter price" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm" class="cols-sm-2 control-label">Installation Charges</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                aria-hidden="true"></i></span>
                                        <input type="number" class="form-control" name="charge" id="charge"
                                            placeholder="Enter Installation Charges" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm" class="cols-sm-2 control-label">Upgradation Charges</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                aria-hidden="true"></i></span>
                                        <input type="number" class="form-control" name="Upcharge" id="Upcharge"
                                            placeholder="Enter Upgradation Charges" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm" class="cols-sm-2 control-label">Discount</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="discount" id="discount"
                                            placeholder="Discount" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm" class="cols-sm-2 control-label">Billing Type</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                aria-hidden="true"></i></span>
                                        <input type="radio" name="billing" id="pre" value="Prepaid"
                                            onclick="dis()">Prepaid
                                        <input type="radio" name="billing" id="post" value="postPaid"
                                            onclick="dis()">Post Paid
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm" class="cols-sm-2 control-label">Refundable Deposit Amount</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                aria-hidden="true"></i></span>
                                        <input type="number" class="form-control" name="refund" id="refund"
                                            placeholder="Enter Refundable Deposit Amount" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm" class="cols-sm-2 control-label">Set Top Box Inventory</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                aria-hidden="true"></i></span>
                                        <input type="file" name="myFile" multiple>
                                        <input type="submit" value="upload" />
                                    </div>
                                </div>
                            </div>




                            <div class="form-group ">
                                <button type="button"
                                    class="btn btn-primary btn-lg btn-block login-button">Submit</button>
                            </div>

                        </form>
                    </div>

                </div>
</div>

</body>

</html>