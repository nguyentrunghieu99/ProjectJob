/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function addComment(jobId, userId) {
    fetch("/JobSpringMVC/api/add-comment", {
        method: 'post',
        body: JSON.stringify(
                {
                    "content": document.getElementById("commentId").value,
                    "jobId": jobId,
                    "userId": userId
                }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        console.info(res)

        return res.json();
    }).then(function (data) {
        console.info(data);

        let area = document.getElementById("commentArea");
        area.innerHTML = `
        <div class="row">
                <div class="col-md-2" style="padding: 10px">
                    <img class="rounded-circle img-fluid" src="https://res.cloudinary.com/springmvc/image/upload/v1631778579/cazkgssjiy7flmuma25g.png" alt="name"/>
                </div>
                <div class="col-md-10 my-date">
                    <p>Name: ${data.user.username}</p>
                    <p>${data.content}</p>
                    <i>${moment(data.createDate).fromNow()}</i>
                </div>
            </div>
    `
                + area.innerHTML
    })

}

