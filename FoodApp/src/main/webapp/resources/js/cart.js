/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
// Spinner
var removeSpinner = function () {
    setTimeout(function () {
        if ($('#spinner').length > 0) {
            $('#spinner').removeClass('show');
        }
    }, 1);
};

removeSpinner()
function addToCart(endpoint, id, name, price) {
    fetch(endpoint, {
        method: "POST",
        body: JSON.stringify({
            "id": id,
            "name": name,
            "price": price,
            "quantity": 1
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(res => res.json()).then(data => {

        let counters = document.getElementsByClassName("cart-counter");
        for (let d of counters)
            d.innerText = data.totalQuantity;
        $('#successMessage').text('Thêm vào giỏ thành công')
        $('#successModal').modal('show')
    });
}

function updateItem(endpoint, obj) {    
    fetch(endpoint, {
        method: "put",
        body: JSON.stringify({
            "quantity": obj.value
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(res => res.json()).then(data => {
        let counters = document.getElementsByClassName("cart-counter");
        for (let d of counters)
            d.innerText = data.totalQuantity;
        let amounts = document.getElementsByClassName("cart-amount");
        for (let d of amounts)
            d.innerText = parseFloat(data.totalAmount).toLocaleString("en-US");
        $('#successMessage').text('Cập nhật giỏ hàng thành công')
        $('#successModal').modal('show')
    });
}

function deleteItem(endpoint, id) {
    $('#loader').show();

    fetch(endpoint, {
        method: "delete"
    }).then(res => res.json()).then(data => {
        $('#loader').hide();
        let el = document.getElementById(`cart${id}`);
        el.style.display = "none";

        let counters = document.getElementsByClassName("cart-counter");
        for (let d of counters)
            d.innerText = data.totalQuantity;
        let amounts = document.getElementsByClassName("cart-amount");
        for (let d of amounts)
            d.innerText = parseFloat(data.totalAmount).toLocaleString("en-US");
        $('#successMessage').text('Xóa khỏi giỏ hàng')
        $('#successModal').modal('show')
    });
}
function pay(endpoint) {
    $('#spinner').show()
    fetch(endpoint, {
        method: "post"
    }).then(res => {
        console.info(res);
        if (res.status === 200) {
            let counters = document.getElementsByClassName("cart-counter");
            for (let d of counters)
                d.innerText = 0;
            $('#spinner').hide()
            res.text().then(url => {
                window.location.href = url;
            });
        }
    })
}








