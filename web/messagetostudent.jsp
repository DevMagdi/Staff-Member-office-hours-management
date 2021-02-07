

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message To Staff</title>
    </head>

    <body>
        <h1>Message From Student To Dr || TAs</h1>
        <form action="messagetostaff" method="post">
            <table border="1">
            <tr class="TableSide">
            
            </tr>
                        
            <tr>
                <td> To :
                    <select name="To">
                        <option value="">Student</option>
                        <option value="Dr: Bsheer AbdElfatah">Dr: Bsheer AbdElfatah</option>
                        <option value="Dr: Ehab Ezzat">Dr: Ehab Ezzat</option>
                        <option value="Dr: Hoda Mokhtar">Dr: Hoda Mokhtar</option>
                        <option value="Dr: Moatz Korshid">Dr: Moatz Korshid</option>
                        <option value="Dr: Mohamed Ahmed Wahby">Dr: Mohamed Ahmed Wahby</option>
                        <option value="Dr: Mohamed ElRamly">Dr: Mohamed ElRamly</option>
                        <option value="Dr: Mohamed ElRefaay">Dr: Mohamed ElRefaay</option>
                        <option value="Dr: Osama Esmail">Dr: Osama Esmail</option>
                        <option value="Dr: Reda AbdElwahab Ahmed">Dr: Reda AbdElwahab Ahmed</option>
                        <option value="Dr: Soha Makady">Dr: Soha Makady</option>
                        <option value="TA: Sherif Zahran">TA: Sherif Zahran</option>
                        <option value="TA: Ahmed AbdElaziz">TA: Ahmed AbdElaziz</option>
                        <option value="TA: Amr Magdy">TA: Amr Magdy</option>
                        <option value="TA: Desoky AbdElQawy">TA: Desoky AbdElQawy</option>
                        <option value="TA: Hayam Gamal">TA: Hayam Gamal</option>
                        <option value="TA: Yomna Hossam">TA: Yomna Hossam</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td> From :
                    <select name="mfrom">
                        <option value="Dr: Bsheer AbdElfatah">Dr: Bsheer AbdElfatah</option>
                        <option value="Dr: Ehab Ezzat">Dr: Ehab Ezzat</option>
                        <option value="Dr: Hoda Mokhtar">Dr: Hoda Mokhtar</option>
                        <option value="Dr: Moatz Korshid">Dr: Moatz Korshid</option>
                        <option value="Dr: Mohamed Ahmed Wahby">Dr: Mohamed Ahmed Wahby</option>
                        <option value="Dr: Mohamed ElRamly">Dr: Mohamed ElRamly</option>
                        <option value="Dr: Mohamed ElRefaay">Dr: Mohamed ElRefaay</option>
                        <option value="Dr: Osama Esmail">Dr: Osama Esmail</option>
                        <option value="Dr: Reda AbdElwahab Ahmed">Dr: Reda AbdElwahab Ahmed</option>
                        <option value="Dr: Soha Makady">Dr: Soha Makady</option>
                        <option value="TA: Sherif Zahran">TA: Sherif Zahran</option>
                        <option value="TA: Ahmed AbdElaziz">TA: Ahmed AbdElaziz</option>
                        <option value="TA: Amr Magdy">TA: Amr Magdy</option>
                        <option value="TA: Desoky AbdElQawy">TA: Desoky AbdElQawy</option>
                        <option value="TA: Hayam Gamal">TA: Hayam Gamal</option>
                        <option value="TA: Yomna Hossam">TA: Yomna Hossam</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td> Subject :
                    <select name="msubject">
                        <option value="Logic Design">Logic Design</option>
                        <option value="Introduction To Database Systems">Introduction To Database Systems</option>
                        <option value="Data Warehousing">Data Warehousing</option>
                        <option value="Electronic2">Electronic2</option>
                        <option value="Signals and Systems">Signals and Systems</option>
                        <option value="Data Mining">Data Mining</option>
                        <option value="Image processing">Image processing</option>
                        <option value="SoftwareEngineering2">SoftwareEngineering2</option>
                        <option value="Object Oriented Programming">Object Oriented Programming</option>
                        <option value="Internet Applications">Internet Applications</option>
                        <option value="Decision Support Systems">Decision Support Systems</option>
                    </select>
                </td>
            </tr>
                        
                        
            <tr>
                <td>
                    <textarea name="mcontent" cols="65" rows="15"></textarea>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="submit" name="add" value="Send">
                </td>
            </tr>
        </table>
        </form>
        <br/>
        <a href="index.html">Bach to Home</a>
    </body>
</html>

