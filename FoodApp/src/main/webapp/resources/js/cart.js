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
        console.info(data)
        let counters = document.getElementsByClassName("cart-counter");
        for (let d of counters)
            d.innerText = data.totalQuantity;
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
    });
}

function deleteItem(endpoint, id) {
    $('#loader').show();
    if (confirm("Bạn chắc chắn xóa không?") === true) {
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
        });
    }
}
function pay(endpoint) {
    fetch(endpoint, {
        method: "post"
    }).then(res => {
        console.info(res);
        if (res.status === 200) {

            alert("Success");

            let counters = document.getElementsByClassName("cart-counter");
            for (let d of counters)
                d.innerText = 0;
            res.text().then(text => {
                window.location.href = "/checkout/" + text;
            });
        }
    })
}








