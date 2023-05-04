/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


   function acceptOrderItem(orderItemId) {
    $.ajax({
        url: "/api/order/accept/" + orderItemId + "/",
        type: "PUT",
        success: function (result) {
            $('.status[data-order-item-id="' + orderItemId + '"]').text('Đã xác nhận');
            $('.btn-accept[data-order-item-id="' + orderItemId + '"]').prop('disabled', true);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("Lỗi" + errorThrown);
        }
    });
}