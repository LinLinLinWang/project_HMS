/**
 * 
 */
 function   validateCode() {
    document.getElementById('getCode').src = "verification.jsp?" + Math.ceil(Math.random() * 1000);
     }     
