<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">

    <style>
      body {
        font-family: 'Rubik', sans-serif !important;
      }
      ul {
          height: 20rem;
          width: 12rem;
          margin-left: 15px; 
          margin-right: 15px;
          background: rgba(33,37,41,255) !important; 
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      .customButton {
          width: 12rem; 
          height: 3rem;
          margin: 1rem;
          font-size: 1.3rem;
      }
      main {
          border-radius: 25px 0px 0px 25px;
          background: rgba(33,37,41,255);
          padding-left: 20px !important;
          padding-right: 15px !important;
      }
      
      h1, h3 {
          color: #febc2c;
      }
      .align-center {
          display: flex;
          justify-content: center;
      }
      
      input {
          
      }
    </style>
  </head>
<body>
    <header class="navbar sticky-top flex-md-nowrap p-0">
    <a class="col-2 me-0 px-3" id="logo" href="dashboard" style="font-family: monospace; font-size: 3rem">LEVAN</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-nav">
      <div class="nav-item text-nowrap">
        <a class="btn btn-outline-danger me-3" href="#">
          Sign out
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
            <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
          </svg></a>
      </div>
    </div>
  </header>

<div class="container-fluid">
    <div class="row" style="background-color: rgba(61,67,75,255);">
    <!--Navigation bar-->
    <nav id="sidebarMenu" class="col-2 sidebar">
      <div class="position-sticky pt-4 sidebar-sticky">
          <ul class="nav flex-column wrapped p-2">
          <li class="nav-item">
              <form>
                  <input type="hidden" name="action" value="productlist">
                  <input class="btn btn-secondary mt-3 ms-3" type="submit" value="View Product">
              </form>
          </li>
          <li class="nav-item">
            <form>
                  <input type="hidden" name="action" value="addproduct">
                  <input class="btn btn-success mt-3 ms-3" type="submit" value="New Product">
              </form>
          </li>
        </ul>
      </div>
    </nav>

    <!--Content-->
    
    <main class="col-7 ms-sm-auto" data-bs-spy="scroll" data-bs-target="#sidebarMenu" tabindex="0" data-bs-smooth-scroll="true">
      <!--DASHBOARD-->
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
        <h1 id="dashboard" style="font-weight: 600">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          
        </div>
      </div>

      <div class="d-flex flex-wrap">

         <%! int[] data;%>
         <% data = (int[]) request.getAttribute("data"); %>
         <%out.print("<div class='wrapped box'>"
                 + "<p>Number of users:</p>"
                 + "<h3>"+data[0]+"</h3>"
                 + "<p>New users this month:</p>"
                 + "<h3>"+data[8]+"</h3>"
                 + "</div>");
        %>
        
         <%  out.print("<div class='wrapped box'>"
                 + "<p>Number of products:</p>"
                 + "<h1>"+data[1]+"</h1>"
                 + "</div>");
        %>

        <div class="wrapped big-box" style="height: 500px">
          <p>New users: January - March 2023</p>
          <canvas id="NumOfSignup" width="600" height="200"></canvas>
          <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                var NumOfSignup = document.getElementById("NumOfSignup");
                var data = {
                    label: "New signups",
                   <% out.print("data: ["+data[2]+", "+data[3]+", "+data[4]+", "+data[5]+", "+data[6]+", "+data[7]+"],"); %>
                    lineTension: 0,
                    fill: false,
                    borderColor: '#febc2c'};
                var numberData = {
                  labels: ["Jan 1st half","Jan 2nd half", "Feb 1st half","Feb 2nd half", "Mar 1st half", "Mar 2nd half"],
                  datasets: [data] };
                var chartOptions = {
                  legend: {display: true,position: 'top',
                  labels: {boxWidth: 80, fontColor: 'white'}}};
                var lineChart = new Chart(NumOfSignup, {type: 'line',data: numberData,options: chartOptions});             
            </script>
        </div>

        
      </div>

    </main>
       
<!--Side bar-->
    <div class="col-3" style="background: rgba(42,46,50,255); border-radius: 0px 25px 25px 0px; margin-right: 25px">
        <div class="align-center mt-5"><svg xmlns="http://www.w3.org/2000/svg" width="140" height="140" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg></div>
        <div class="align-center mt-3">
            <p>${sessionscope.usersession.fullname}</p>
        </div>
        <div class="align-center mt-3">
            <h1>Admin</h1>
        </div>
    </div>
        
  </div>
</div>
    <footer class="container py-5 mt-5">
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
        crossorigin="anonymous"></script>
    <script src="dashboard.js"></script>
  </body>
</html>
