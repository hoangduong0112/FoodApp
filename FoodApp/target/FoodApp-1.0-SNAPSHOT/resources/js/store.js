/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

// Spinner
var spinner = function () {
    setTimeout(function () {
        if ($('#spinner').length > 0) {
            $('#spinner').removeClass('show');
        }
    }, 1);
};
spinner();

function deleteMenu(endpoint, id) {
    fetch(endpoint, {
        method: 'delete'
    })
            .then(response => {
                console.log(response)
                if (response.status === 204) {
                    document.getElementById(`menu${id}`).style.display = "none";
                    alert("Xóa thành công")
                    spinner();

                } else {
                    alert("Xóa thất bại")
                }
            });
}

function deleteMenuItem(endpoint, id) {
    fetch(endpoint, {
        method: 'delete'
    })
            .then(response => {
                console.log(response)
                if (response.status === 204) {
                    document.getElementById(`item${id}`).style.display = "none";
                    alert("Xóa thành công")

                } else {
                    alert("Xóa thất bại")
                }
            });
}