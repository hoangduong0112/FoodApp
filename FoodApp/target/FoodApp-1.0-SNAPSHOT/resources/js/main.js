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
            alert("You are now following this store.");
        } else if (response.status === 409) {
            alert("You are already following this store.");
        } else {
            throw new Error('Error following store.');
        }
    })
    .catch(error => {
        alert("Error following store.");
        console.error(error);
    });
}