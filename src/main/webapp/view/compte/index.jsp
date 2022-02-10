<%@ page import="com.example.projetappel.model.Utilisateur" %><%--
  Created by IntelliJ IDEA.
  User: rmonl
  Date: 06/02/2022
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.example.projetappel.enumtype.Role" %>
<html>
<head>
    <title>${requestScope.page}</title>
    <meta name="viewport" charset=UTF-8" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="/assets/compte/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="/assets/compte/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="/assets/compte/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/compte/fonts/fontawesome5-overrides.min.css">
</head>

    <body id="page-top">
        <div id="wrapper">
            <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0 toggled">
                <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon"><i class="fas fa-university"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>Gestion appel</span></div>
                </a>
                    <hr class="sidebar-divider my-0">
                    <ul class="navbar-nav text-light" id="accordionSidebar">
                    <c:choose>
                        <c:when test = "${requestScope.role== Role.ETUDIANT}">
                        <li class="nav-item"><a class="nav-link ${requestScope.page eq 'accueil' ? 'active' : ''}" href="/compte/accueil"><i class="fas fa-home"></i><span>Accueil</span></a></li>
                        <li class="nav-item"><a class="nav-link ${requestScope.page eq 'consultation-etudiant' ? 'active' : ''}" href="/compte/consultation-etudiant"><i class="fas fa-clock"></i><span>Mes absences/Mes justificatifs</span></a></li>
                        </c:when>
                        <c:when test = "${requestScope.role== Role.ENSEIGNANT}">
                            <li class="nav-item"><a class="nav-link ${requestScope.page eq 'accueil' ? 'active' : ''}" href="/compte/accueil"><i class="fas fa-home"></i><span>Accueil</span></a></li>
                            <li class="nav-item"><a class="nav-link ${requestScope.page eq 'planning' ? 'active' : ''}" href="/compte/planning"><i class="fas fa-calendar-alt"></i><span>Planning</span></a></li>
                            <li class="nav-item"><a class="nav-link ${requestScope.page eq 'cours' ? 'active' : ''}" href="/compte/cours"><i class="fas fa-chalkboard-teacher"></i><span>Cours</span></a></li>
                            <li class="nav-item"><a class="nav-link ${requestScope.page eq 'liste-etudiant' ? 'active' : ''}" href="/compte/liste-etudiant"><i class="fas fa-user-graduate"></i><span>Etudiants</span></a></li>

                        </c:when>
                        <c:when test = "${requestScope.role== Role.SCOLARITE}">
                            <li class="nav-item"><a class="nav-link ${requestScope.page eq 'accueil' ? 'active' : ''}" href="/compte/accueil"><i class="fas fa-home"></i><span>Accueil</span></a></li>
                        </c:when>

                    </c:choose>


                    </ul>
                    <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
                </div>
            </nav>
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                            <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                <div class="input-group">
                                    <div class="input-group-append"></div>
                                </div>
                            </form>
                            <ul class="navbar-nav flex-nowrap ml-auto">
                                <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                    <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                        <form class="form-inline mr-auto navbar-search w-100">
                                            <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                                <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                            </div>
                                        </form>
                                    </div>
                                </li>
                                <li class="nav-item dropdown no-arrow mx-1">
                                    <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><span class="badge badge-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-list animated--grow-in">
                                            <h6 class="dropdown-header">alerts center</h6><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="mr-3">
                                                <div class="bg-primary icon-circle"><i class="fas fa-file-alt text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">December 12, 2019</span>
                                                <p>A new monthly report is ready to download!</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="mr-3">
                                                <div class="bg-success icon-circle"><i class="fas fa-donate text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">December 7, 2019</span>
                                                <p>$290.29 has been deposited into your account!</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="mr-3">
                                                <div class="bg-warning icon-circle"><i class="fas fa-exclamation-triangle text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">December 2, 2019</span>
                                                <p>Spending Alert: We've noticed unusually high spending for your account.</p>
                                            </div>
                                        </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="nav-item dropdown no-arrow mx-1">
                                    <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><span class="badge badge-danger badge-counter">7</span><i class="fas fa-envelope fa-fw"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-list animated--grow-in">
                                            <h6 class="dropdown-header">alerts center</h6><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image mr-3"><img class="rounded-circle" src="/assets/compte/img/avatars/avatar4.jpeg">
                                                <div class="bg-success status-indicator"></div>
                                            </div>
                                            <div class="font-weight-bold">
                                                <div class="text-truncate"><span>Hi there! I am wondering if you can help me with a problem I've been having.</span></div>
                                                <p class="small text-gray-500 mb-0">Emily Fowler - 58m</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image mr-3"><img class="rounded-circle" src="/assets/compte/img/avatars/avatar2.jpeg">
                                                <div class="status-indicator"></div>
                                            </div>
                                            <div class="font-weight-bold">
                                                <div class="text-truncate"><span>I have the photos that you ordered last month!</span></div>
                                                <p class="small text-gray-500 mb-0">Jae Chun - 1d</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image mr-3"><img class="rounded-circle" src="/assets/compte/img/avatars/avatar3.jpeg">
                                                <div class="bg-warning status-indicator"></div>
                                            </div>
                                            <div class="font-weight-bold">
                                                <div class="text-truncate"><span>Last month's report looks great, I am very happy with the progress so far, keep up the good work!</span></div>
                                                <p class="small text-gray-500 mb-0">Morgan Alvarez - 2d</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image mr-3"><img class="rounded-circle" src="/assets/compte/img/avatars/avatar5.jpeg">
                                                <div class="bg-success status-indicator"></div>
                                            </div>
                                            <div class="font-weight-bold">
                                                <div class="text-truncate"><span>Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</span></div>
                                                <p class="small text-gray-500 mb-0">Chicken the Dog · 2w</p>
                                            </div>
                                        </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                        </div>
                                    </div>
                                    <div class="shadow dropdown-list dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown"></div>
                                </li>
                                <div class="d-none d-sm-block topbar-divider"></div>
                                <li class="nav-item dropdown no-arrow">
                                    <div class="nav-item dropdown no-arrow">
                                        <a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">${requestScope.utilisateur.prenom} ${requestScope.utilisateur.nom}</span><img class="border rounded-circle img-profile" src="${requestScope.utilisateur_image}"></a>
                                        <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in">
                                            <a class="dropdown-item" href="/compte/profile"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" href="/deconnexion"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Se déconnecter</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <div class="container-fluid">
                        <c:choose>
                            <c:when test = "${requestScope.page eq 'accueil'}">
                                <jsp:include page = "./page/accueil.jsp"/>
                            </c:when>
                            <c:when test = "${requestScope.page eq 'planning'}">
                                <jsp:include page = "./page/planning.jsp"/>
                            </c:when>
                            <c:when test = "${requestScope.page eq 'cours'}">
                                <jsp:include page = "./page/cours.jsp"/>
                            </c:when>
                            <c:when test = "${requestScope.page eq 'justificatif'}">
                                <jsp:include page = "./page/justificatif.jsp"/>
                            </c:when>
                            <c:when test = "${requestScope.page eq 'profile'}">
                                <jsp:include page = "./page/profile.jsp"/>
                            </c:when>
                            <c:when test = "${requestScope.page eq 'consultation-etudiant'}">
                                <jsp:include page = "page/consultation-etudiant.jsp"/>
                            </c:when>
                            <c:when test = "${requestScope.page eq 'liste-etudiant'}">
                                <jsp:include page = "./page/liste-etudiant.jsp"/>
                            </c:when>
                            <c:when test = "${requestScope.page eq 'profile-etudiant-cherche'}">
                                <jsp:include page = "./page/profile-etudiant-cherche.jsp">
                                    <jsp:param name="etudiantId" value="${etudiantId}"/>
                                </jsp:include>
                            </c:when>
                            <c:when test = "${requestScope.page eq 'cours-instance'}">
                                <jsp:include page = "./page/fiche-appel.jsp"/>
                            </c:when>
                            <c:when test = "${requestScope.page eq 'cours-statistiques'}">
                                <jsp:include page = "./page/cours-statistiques.jsp">
                                    <jsp:param name="etudiantId" value="${etudiantId}"/>
                                </jsp:include>
                            </c:when>
                        </c:choose>
                    </div>

                    </div>
                    <footer class="bg-white sticky-footer">
                        <div class="container my-auto">
                            <div class="text-center my-auto copyright"><span>Copyright © Brand 2022</span></div>
                        </div>
                    </footer>
                </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
        </div>

        <script src="/assets/compte/js/jquery.min.js"></script>
        <script src="/assets/compte/bootstrap/js/bootstrap.min.js"></script>
        <script src="/assets/compte/js/chart.min.js"></script>
        <script src="/assets/compte/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
        <script src="/assets/compte/js/theme.js"></script>
    </body>
</html>
