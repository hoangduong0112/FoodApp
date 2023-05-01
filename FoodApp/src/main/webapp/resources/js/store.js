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
function deleteStore(endpoint, id) {
    $('#spinner').show();
    fetch(endpoint, {
        method: 'delete'
    })
            .then(response => {
                $('#spinner').hide();
                if (response.status === 204) {
                    document.getElementById(`store${id}`).style.display = "none";
                    alert("Xóa thành công")
                } else {
                    alert("Xóa thất bại")
                }
            });
}
function deleteMenu(endpoint, id) {
    $('#spinner').show();
    fetch(endpoint, {
        method: 'delete'
    })
            .then(response => {
                $('#spinner').hide();
                if (response.status === 204) {
                    document.getElementById(`menu${id}`).style.display = "none";
                    alert("Xóa thành công")
                    spinner();

                } else {
                    alert("Xóa thất bại do Menu vẫn còn sản phẩm");
                }
            })
            .catch(error => {
                if (error.response && error.response.status === 400) {
                    alert(error.response.data.message);
                }
            });
}

function deleteMenuItem(endpoint, id) {
    $('#spinner').show();
    fetch(endpoint, {
        method: 'delete'
    })
            .then(response => {
                $('#spinner').hide();
                if (response.status === 204) {
                    document.getElementById(`item${id}`).style.display = "none";
                    alert("Xóa thành công")

                } else {
                    alert("Xóa thất bại")
                }
            });
}
function addMenu() {
    var menuName = $("#MenuName").val();
    $.ajax({
        type: "POST",
        url: "/api/menu/",
        data: JSON.stringify(menuName),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            alert("Menu added successfully!");
        },
        error: function (xhr, status, error) {
            alert("Error adding menu: " + error);
        }
    });
}






