var removeSpinner = function () {
    setTimeout(function () {
        if ($('#spinner').length > 0) {
            $('#spinner').removeClass('show');
        }
    }, 1);
};

removeSpinner()

function FollowStore(endpoint) {
    $('#spinner').show();
    fetch(endpoint, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        }
    })
            .then(response => {
                $('#spinner').hide();
                if (response.status === 200) {
                    $('#successMessage').text('Theo dõi thành công')
                    $('#successModal').modal('show')
                } else if (response.status === 204) {
                    $('#warningMessage').text('Bạn đã theo dõi cửa hàng này rồi')
                    $('#warningModal').modal('show')
                } else {
                    throw new Error('Error following store.');
                }
            })
            .catch(error => {
                $('#failureMessage').text('Theo dõi thất bại, có lỗi xảy ra')
                $('#failureModal').modal('show')
            });
}

function UnfollowStore(endpoint) {
    $('#spinner').show();
    fetch(endpoint, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        }
    })
            .then(response => {
                $('#spinner').hide();
                if (response.status === 200) {
                    $('#successMessage').text('Bỏ theo dõi thành công')
                    $('#successModal').modal('show')
                } else if (response.status === 204) {
                    $('#warningMessage').text('Bạn chưa theo dõi cửa hàng')
                    $('#warningModal').modal('show')
                } else {
                    throw new Error('Error following store.');
                }
            })
            .catch(error => {
                $('#failureMessage').text('Bỏ theo dõi thất bại, có lỗi xảy ra')
                $('#failureModal').modal('show')
            });
}