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
                    $('#successMessage').text('Xóa thành công')
                    $('#successModal').modal('show')
                } else {
                    $('#failureMessage').text('Xóa thất bại')
                    $('#failureModal').modal('show')
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
                    $('#successMessage').text('Xóa thành công')
                    $('#successModal').modal('show')

                } else {
                    $('#failureMessage').text('Xóa thất bại')
                    $('#failureModal').modal('show')
                }
            })
            .catch(error => {
                if (error.response && error.response.status === 400) {
                    $('#failureMessage').text('Xóa thất bại')
                    $('#failureModal').modal('show')
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
                    $('#successMessage').text('Xóa thành công')
                    $('#successModal').modal('show')

                } else {
                    $('#failureMessage').text('Xóa thất bại')
                    $('#failureModal').modal('show')
                }
            });
}






