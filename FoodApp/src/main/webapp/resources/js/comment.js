/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function showSpinner(status) {
    let spinners = document.getElementsByClassName("LoadCommentSpinner");
    for (let s of spinners)
        s.style.display = status;
}

function loadComments(endpoint) {
    fetch(endpoint).then(res => res.json()).then(data => {
        let msg = "";
        for (let c of data) {
            msg += `
               <div class="row bg-light p-3 mb-3 rounded">
                    <div class="col-md-2 col-sm-3 col-4">
                        <img src="${c.userId.avatarUrl}" class="img-fluid rounded-circle">
                    </div>
                    <div class="col-md-10 col-sm-9 col-8">
                        <h6 class="mb-2">${c.userId.hoten}</h6>
                        <p>${c.content}</p>
                        <small class="text-muted">
                            Bình luận bởi <a href="#" class="text-dark">${c.userId.username}</a> vào ${moment(c.createdDate).locale("vi").format("D MMMM YYYY [lúc] h:mm A")}
                        </small>
                    </div>
                </div>

            `
        }

        let d = document.getElementById("comments");
        d.innerHTML = msg;
    });
}

function addComment(endpoint) {
    showSpinner("block")
    fetch(endpoint, {
        method: "POST",
        body: JSON.stringify({
            "content": document.getElementById("comment-content").value
        }), 
        headers: {
            "Content-Type": "application/json"
        }
    }).then(res => res.json()).then(c => {
        showSpinner("none")
        let d = document.getElementById("comments");
        d.innerHTML = `
               <div class="row bg-light p-3 mb-3 rounded">
                    <div class="col-md-2 col-sm-3 col-4">
                        <img src="${c.userId.avatarUrl}" class="img-fluid rounded-circle">
                    </div>
                    <div class="col-md-10 col-sm-9 col-8">
                        <h6 class="mb-2">${c.userId.hoten}</h6>
                        <p>${c.content}</p>
                        <small class="text-muted">
                            Bình luận bởi <a href="#" class="text-dark">${c.userId.username}</a> vào ${moment(c.createdDate).locale("vi").format("D MMMM YYYY [lúc] h:mm A")}
                        </small>
                    </div>
                </div>
            ` + d.innerHTML;
    });
}


moment.updateLocale('vi', {
    relativeTime: {
        future: "trong %s",
        past: "%s trước",
        s: 'vài giây',
        ss: '%d giây',
        m: "một phút",
        mm: "%d phút",
        h: "một giờ",
        hh: "%d giờ",
        d: "một ngày",
        dd: "%d ngày",
        w: "một tuần",
        ww: "%d tuần",
        M: "một tháng",
        MM: "%d tháng",
        y: "một năm",
        yy: "%d năm"
    }
});
moment.locale('vi');