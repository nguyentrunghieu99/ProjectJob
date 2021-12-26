/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = function () {
    let dates = document.querySelectorAll(".my-date > i,span,p");
    for (let i = 0; i < dates.length; i++) {
        let d = dates[i];
        let c = moment(d.innerText).fromNow();

        switch (true) {
            case c.includes("a few seconds ago"):
                d.innerText = c.replace('a few seconds ago', 'vài giây trước');
                break;

            case c.includes("a minute ago"):
                d.innerText = c.replace('a minute ago', '1 phút trước');
                break;

            case c.includes("minutes ago"):
                d.innerText = c.replace('minutes ago', 'phút trước');
                break;

            case c.includes("an hour ago"):
                d.innerText = c.replace('an hour ago', 'một giờ trước');
                break;

            case c.includes("hours ago"):
                d.innerText = c.replace('hours ago', 'giờ trước');
                break;

            case c.includes("a day ago"):
                d.innerText = c.replace('a day ago', '1 ngày trước');
                break;

            case c.includes("days ago"):
                d.innerText = c.replace('days ago', 'ngày trước');
                break;

            case c.includes("a month ago"):
                d.innerText = c.replace('a month ago', '1 tháng trước');
                break;

            case c.includes("months ago"):
                d.innerText = c.replace('months ago', 'tháng trước');
                break;

            case c.includes("a year ago"):
                d.innerText = c.replace('a year ago', '1 năm trước');
                break;

            case c.includes("years ago"):
                d.innerText = c.replace('years ago', 'năm trước');
                break;

        }
    }
}




