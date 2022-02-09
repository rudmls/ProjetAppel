package com.example.projetappel.controller;

import com.example.projetappel.dao.AbsenceDao;
import com.example.projetappel.dao.CoursInstanceDao;
import com.example.projetappel.dao.EtudiantDao;
import com.example.projetappel.dao.PresenceDao;
import com.example.projetappel.enumtype.Role;
import com.example.projetappel.model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "ProfileEtudiantChercheController", value = "/compte/profile-etudiant-cherche")
public class ProfileEtudiantChercheController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        if (request.getParameter("etudiantId")!=null){
            int etudiantId= Integer.parseInt(request.getParameter("etudiantId"));
            EtudiantDao etudiantDao = new EtudiantDao();
            Etudiant etudiant= etudiantDao.find(etudiantId);
            request.setAttribute("etudiantId",etudiant);
            Cours cours = new Cours();

            Etudiant etudiantCherche = etudiantDao.find(etudiant.getId());

            //get nombre généralles d'absences par étudiant
            AbsenceDao absenceDao = new AbsenceDao();
            ArrayList<Absence> absences = (ArrayList<Absence>) absenceDao.getAbsences(etudiantCherche.getId());
            float nbAbs = ((ArrayList<Absence>) absenceDao.getAbsences(etudiantCherche.getId())).size();

            //get nombre général d'instances de cours où un étudiant était censé participer
            CoursInstanceDao coursInstanceDao = new CoursInstanceDao();
            ArrayList<CoursInstance> coursInstances = (ArrayList<CoursInstance>) coursInstanceDao.getCoursInstances(etudiantCherche.getId());
            float nbInstances = ((ArrayList<CoursInstance>) coursInstanceDao.getCoursInstances((etudiantCherche.getId()))).size();

            //get nombre général de retards d'un étudiant donné
            PresenceDao presenceDao = new PresenceDao();
            float nbRetards = ((ArrayList<Presence>) presenceDao.getPresences(etudiantCherche.getId())).size();


            //get taux général d'absences d'un étudiant
            float txAbsGen = (nbAbs / nbInstances) * 100;
            //get taux général de retards d'un étudiant
            float txRetGen = (nbRetards / nbInstances) * 100;

            request.setAttribute("txAbsGen", txAbsGen);
            request.setAttribute("txRetGen", txRetGen);
        }
        request.setAttribute("page", "profile-etudiant-cherche");
        request.getRequestDispatcher("/view/compte/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
