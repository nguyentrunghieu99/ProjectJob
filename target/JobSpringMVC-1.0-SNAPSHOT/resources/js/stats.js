

function generateColor() {
    let r = parseInt(Math.random() * 255);
    let g = parseInt(Math.random() * 255);
    let b = parseInt(Math.random() * 255);
    return `rgb(${r},${g},${b})`;
}

function cateChart(id, cateLabels = [], cateInfo = []) {
    let colors = [];
    for (let i = 0; i < cateInfo.length; i++)
        colors.push(generateColor());

    const data = {
        labels: cateLabels,
        datasets: [{
                label: 'Thống kê theo danh mục',
                data: cateInfo,
                backgroundColor: colors,
                hoverOffset: 4
            }]
    };
    const config = {
        type: 'doughnut',
        data: data
    };

    let ctx = document.getElementById(id).getContext("2d")
    new Chart(ctx, config);
}

function jobChart(id, jobLabels = [], jobInfo = []) {
    let colors = [];
    for (let i = 0; i < jobInfo.length; i++)
        colors.push(generateColor());

    const data = {
        labels: jobLabels,
        datasets: [{
                label: 'Thong ke theo bai',
                data: jobInfo,
                backgroundColor: colors,
                borderColor: colors,
                borderWidth: 1
            }]
    };
    const config = {
        type: 'bar',
        data: data,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
    };

    let ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, config);
}

function appliChart(id, appLabels = [], appInfo = []) {
    let colors = [];
    for (let i = 0; i < jobInfo.length; i++)
        colors.push(generateColor());
    
    const data = {
        labels: appLabels,
        datasets: [{
                type: 'bar',
                label: 'Thống Kê Theo Thời Gian',
                data: appInfo,
                borderColor: colors,
                backgroundColor: colors
            }, {
                type: 'line',
                label: 'Line Dataset',
                data: [50, 50, 50, 50],
                fill: false,
                borderColor: colors
            }]
    };
    const config = {
        type: 'scatter',
        data: data,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    };
    let ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, config);

}
