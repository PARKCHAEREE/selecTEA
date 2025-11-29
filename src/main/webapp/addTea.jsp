<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>상품 등록</title>
<style>
    .bg-brown { background-color: #6f4e37; color: white; }
    .text-brown { color: #6f4e37; }
</style>

<fmt:setLocale value='<%=request.getParameter("language")%>'/>
<fmt:setBundle basename="bundle.message"/>

<script type="text/javascript">
    function CheckAddTea() {
        var teaId = document.getElementById("teaId");
        var name = document.getElementById("name");
        var unitPrice = document.getElementById("unitPrice");
        var unitsInStock = document.getElementById("unitsInStock");

     // JS 경고창 메시지 다국어 변수 설정
        var msgId = "<fmt:message key='msg.teaId'/>";
        var msgName = "<fmt:message key='msg.name'/>";
        var msgPrice = "<fmt:message key='msg.price'/>";
        var msgStock = "<fmt:message key='msg.stock'/>";

        if (!check(/^T[0-9]{4,11}$/, teaId, msgId))
            return false;

        if (name.value.length < 2 || name.value.length > 50) {
            alert(msgName);
            name.select();
            name.focus();
            return false;
        }

        if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
            alert(msgPrice);
            unitPrice.select();
            unitPrice.focus();
            return false;
        }
        if (unitPrice.value < 0) {
            alert(msgPrice);
            unitPrice.select();
            unitPrice.focus();
            return false;
        }

        if (isNaN(unitsInStock.value)) {
            alert(msgStock);
            unitsInStock.select();
            unitsInStock.focus();
            return false;
        }
        
        document.newTea.submit();
    }

    function check(regExp, e, msg) {
        if (regExp.test(e.value)) {
            return true;
        }
        alert(msg);
        e.select();
        e.focus();
        return false;
    }
</script>
</head>
<body>
    <jsp:include page="menu.jsp" />
    
   <div class="jumbotron" style="background-color: #6f4e37; color: white; padding-top: 50px; padding-bottom: 50px; border-radius: 0;">
        <div class="container">
            <h1 class="display-3"><fmt:message key="title"/></h1>
            
            <div class="text-end">
                <a href="?language=ko" class="btn btn-sm btn-outline-light">Korean</a>
                <a href="?language=en" class="btn btn-sm btn-outline-light">English</a>
            </div>
        </div>
    </div>

    <div class="container mt-4">
        <form name="newTea" action="./processAddTea.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
            
            <div class="form-group row mb-3">
                <label class="col-sm-2"><fmt:message key="teaId"/></label>
                <div class="col-sm-3">
                    <input type="text" id="teaId" name="teaId" class="form-control" placeholder="T1000">
                </div>
            </div>
            
            <div class="form-group row mb-3">
                <label class="col-sm-2"><fmt:message key="name"/></label>
                <div class="col-sm-3">
                    <input type="text" id="name" name="name" class="form-control">
                </div>
            </div>
            
            <div class="form-group row mb-3">
                <label class="col-sm-2"><fmt:message key="unitPrice"/></label>
                <div class="col-sm-3">
                    <input type="text" id="unitPrice" name="unitPrice" class="form-control">
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-2"><fmt:message key="country"/></label>
                <div class="col-sm-3">
                    <input type="text" name="country" class="form-control">
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-2"><fmt:message key="category"/></label>
                <div class="col-sm-3">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="category" value="Black Tea" checked> Black Tea
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="category" value="Green Tea"> Green Tea
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="category" value="Herbal Tea"> Herbal Tea
                    </div>
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-2"><fmt:message key="packaging"/></label>
                <div class="col-sm-3">
                    <select name="packaging" class="form-control">
                        <option value="Tin Case">Tin Case</option>
                        <option value="Paper Box">Paper Box</option>
                        <option value="Leaf Bag">Leaf Bag</option>
                    </select>
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
                <div class="col-sm-3">
                    <input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
                </div>
            </div>
            
            <div class="form-group row mb-3">
                <label class="col-sm-2"><fmt:message key="description"/></label>
                <div class="col-sm-5">
                    <textarea name="description" rows="2" class="form-control"></textarea>
                </div>
            </div>
            
            <div class="form-group row mb-3">
                <label class="col-sm-2"><fmt:message key="teaImage"/></label>
                <div class="col-sm-5">
                    <input type="file" name="teaImage" class="form-control">
                </div>
            </div>
            
            <div class="form-group row mb-3">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="button" class="btn btn-primary" value="<fmt:message key='button.add'/>" onclick="CheckAddTea()">
                    <a href="./teas.jsp" class="btn btn-secondary"><fmt:message key="button.cancel"/></a>
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>