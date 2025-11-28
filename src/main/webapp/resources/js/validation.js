function CheckAddTea() {
    var teaId = document.getElementById("teaId");
    var name = document.getElementById("name");
    var unitPrice = document.getElementById("unitPrice");
    var unitsInStock = document.getElementById("unitsInStock");

    // 1. 아이디 체크 (T로 시작, 숫자 4~11자리)
    if (!check(/^T[0-9]{4,11}$/, teaId, "[상품 코드]\nT와 숫자를 조합하여 5~12자까지 입력하세요.\n첫 글자는 반드시 T로 시작하세요."))
        return false;

    // 2. 상품명 체크
    if (name.value.length < 2 || name.value.length > 50) {
        alert("[상품명]\n최소 2자에서 최대 50자까지 입력하세요");
        name.select();
        name.focus();
        return false;
    }

    // 3. 가격 체크
    if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
        alert("[가격]\n숫자만 입력하세요");
        unitPrice.select();
        unitPrice.focus();
        return false;
    }
    if (unitPrice.value < 0) {
        alert("[가격]\n음수는 입력할 수 없습니다");
        unitPrice.select();
        unitPrice.focus();
        return false;
    }

    // 4. 재고 수 체크
    if (isNaN(unitsInStock.value)) {
        alert("[재고 수]\n숫자만 입력하세요");
        unitsInStock.select();
        unitsInStock.focus();
        return false;
    }
    
    // 성공 시 전송
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