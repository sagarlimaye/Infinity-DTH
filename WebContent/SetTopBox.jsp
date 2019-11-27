<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <jsp:include page="Admin.jsp"/>
    <meta charset="ISO-8859-1">
    <title>Create Set Top Box (STB)</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
    <style type="text/css">
        /* Style the close button */
        .close {
            right: 0;
            top: 0;
        }
    </style>
    <style type="text/css">
body{
background-image: url("1.jpg");
 height: 1300px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;

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

                        <form class="form-horizontal" method="post" action="HomeController" enctype="multipart/form-data">

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
                                        <select class="selectpicker" name="channels" id="featureSelect" multiple>
                                            <c:forEach items="${features}" var="feature">
                                                <option value="${feature.id}">
                                                    <c:out value="${feature.name}"></c:out>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="cols-sm-10">

                                    <div class="input-group">


                                        <div class="features">
                                            <button type="button" class="btn btn-info" data-toggle="modal"
                                                data-target="#features">Features</button>
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
                                                                    <c:forEach items="${features}" var="feature">
                                                                        <li>
                                                                            <c:out value="${feature.name}"></c:out>
                                                                            <span class="close"
                                                                                id="${feature.id}">X</span>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                                <script>
                                                                    var select = $("#featureSelect");
                                                                    var close = document.getElementsByClassName("close");
                                                                    var list = document.getElementById("list");
                                                                    var i;
                                                                    function OnClose() {
                                                                        var saved = false;
                                                                        var li = this.parentElement;

                                                                        $.ajax("/InfinityDTH/HomeController?option=FeatureRemove&id=" + this.id, 
                                                                        {
                                                                            method: "DELETE",
                                                                            success: () => {
                                                                                $(select).find("option[value='" + this.id + "']").remove();
                                                                                li.remove();
                                                                            },
                                                                            error: () => { alert("Could not delete that feature"); }
                                                                        });
                                                                    }
                                                                    function OnClick() {
                                                                        var saved = false;
                                                                        var node = document.createElement("li");
                                                                        var textnode = document.createTextNode(document.getElementById("idea").value);
                                                                        $.post("/InfinityDTH/HomeController", {
                                                                            option: "FeatureAdd",
                                                                            featureName: textnode.textContent
                                                                        }, function (result) {
                                                                            node.appendChild(textnode);
                                                                            list.appendChild(node);
                                                                            document.getElementById("idea").value = "";
                                                                            var span = document.createElement("SPAN");
                                                                            var txt = document.createTextNode("X");
                                                                            var option = document.createElement("option");
                                                                            span.className = "close";
                                                                            span.id = result.id;
                                                                            option.value = result.id;
                                                                            option.text = textnode.textContent;
                                                                            span.appendChild(txt);
                                                                            node.appendChild(span);
                                                                            select.append(option);
                                                                            span.onclick = OnClose;
                                                                        }).fail(() => { alert("Could not add that feature"); });
                                                                    }

                                                                    // Click on a close button to hide the current list item
                                                                    for (i = 0; i < close.length; i++) {
                                                                        close[i].onclick = OnClose;
                                                                    }

                                                                    // Create a new list item when clicking on the "Add" button
                                                                    document.getElementById("add").onclick = OnClick;
                                                                    $("#features").on('hidden.bs.modal', () => { select.selectpicker("refresh"); });
                                                                </script>

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
                                    </div>
                                </div>
                            </div>
                                <input type="hidden" name="option" value="CreateSetTopBox"/>
                                <button type="submit" class="btn btn-primary btn-lg btn-block login-button">Submit</button>
                            

                        </form>
                    </div>

                </div>
            </div>

</body>

</html>