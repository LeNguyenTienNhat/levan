
<%@page import="java.util.List"%>
<%@page import="com.levan.Product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/dashboard.css" rel="stylesheet">
        <title>Product List</title>
        <style>
            th, td {
                color: white;
            }
            table {
                margin-left: 5rem;
                margin-top: 2rem;
                margin-right: 5rem;
            }
            .page-item, .page-link {
                margin-top: 3rem; 
                color: white;
                background: transparent;
            }
            
        </style>
    </head>
    <body>
        <div class="container m-5 ps-5" >
            <button class="btn btn-dark" onclick="history.back()">Back</button>
            <table class="table">
                <%! List<ProductDTO> list; %>
               <% list = (List<ProductDTO>) request.getAttribute("list"); 
               out.print("<thead><tr>"
                      + "<th scope='col'>ID</th>"
                       + "<th scope='col'>Name</th>"
                       + "<th scope='col'>category_ID</th>"
                       + "<th scope='col'>Quantity</th>"
                       + "<th scope='col'>Price</th>"
                       + "<th scope='col'>AddDate</th>"
                       + "<th scope='col'></th>"
                      +"</tr></thead>");
               out.print("<tbody>");
                  for (ProductDTO productDTO : list){
                         out.print("<tr>"
                      +"<th scope='row'>"+productDTO.getID()+"</th>"
                      +"<td>"+productDTO.getName()+"</td>"
                      +"<td>"+productDTO.getCategory_ID()+"</td>"
                      +"<td>"+productDTO.getQuantity()+"</td>"
                      +"<td>"+productDTO.getPrice()+"</td>"
                      +"<td>"+productDTO.getAddDate()+"</td>"
                      + "<td>"+"<form><input type=hidden name='ID' value = "+productDTO.getID()+">"
                              + "<input type=hidden name='action' value='productdetails'>"
                              + "<input type=submit class='btn btn-dark' value='Detail'></form>"+"</td>"
                      + "<td>"+"<form><input type=hidden name='ID' value = "+productDTO.getID()+">"
                              + "<input type=hidden name='action' value='productdelete'>"
                              + "<input type=submit class='btn btn-danger' value='Remove'></form>"+"</td>"   
                    +"</tr>" );
                  }
               out.print("</tbody>");
              %>
           </table>
        </div>
    </body>
</html>
