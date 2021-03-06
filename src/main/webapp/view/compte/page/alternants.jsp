<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.projetappel.util.FileManager" %>
<%@ page import="com.example.projetappel.util.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: cindy
  Date: 10/02/2022
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<h3>Récapitulatif des absences et présences pour les alternants de cette semaine</h3>
<div class="table-responsive" id="no-more-tables">
    <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
        <thead class="thead-dark cf" >
        <tr>
            <th scope="col"></th>
            <th scope="col">Nom et prénom</th>
            <th scope="col">Nombre de présence</th>
            <th scope="col">Nombre d'absences</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.listeAlternants}" var="alternant" >
            <tr>
                <td><img class="border rounded-circle img-profile" src="${alternant.getFichier() != null ? FileManager.getFichier(alternant.getFichier) : Constants.DEFAULT_IMAGE_URL}"></td>
                <td>
                    <c:out  value="${alternant.getNom()}"/>
                    <c:out  value="${alternant.getPrenom()}"/>
                </td>
                <td>
                    <p> <span class="labelHidden" >Nombre de présence :</span>
                    <c:out  value="${requestScope.listNbPresenceEtudiant.get(alternant) != null ? requestScope.listNbPresenceEtudiant.get(alternant) :0}"/></p>
                </td>
                <td>
                    <p><span class="labelHidden" >Nombre d'absence :</span>
                    <c:out  value="${requestScope.listNbAbsenceEtudiant.get(alternant)!= null ? requestScope.listNbAbsenceEtudiant.get(alternant):0 }"/></p>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
